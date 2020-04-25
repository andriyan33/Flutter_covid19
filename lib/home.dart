import 'package:flutter/material.dart';
import './components/indonesia.dart';
import './components/world.dart';
import 'package:provider/provider.dart';

import './providers/corona_provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height; //KITA AMBIL UKURAN LAYAR

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(249, 19, 147, 70),
        title: const Text('Berantas Covid-19'),
      ),
      //PENERAPAN REFRESH INDICATOR AGAR KETIKA LAYAR DITARIK DARI ATAS KE BAWAH, MAKA SECARA OTOMATIS AKAN MELOAD DATA BARU
      body: RefreshIndicator(
        //MENGGUNAKAN ATTRIBUTENYA YAKNI ONREFRESH
        //DAN AKAN MEMANGGIL FUNGSI GETDATA YANG SUDAH DIBUAT PADA CORONA PROVIDER
        onRefresh: () =>
            Provider.of<CoronaProvider>(context, listen: false).getData(),
        child: Container(
          margin: const EdgeInsets.all(10),
          //KEMUDIAN KETIKA APPS DIBUKA, MAKA FUNGSI FUTURE BUILDER AKAN DIJALANKAN
          child: FutureBuilder(
            //DAN MELOAD DATA DARI API MENGGUNAKAN FUNGSI YANG SAMA
            future:
                Provider.of<CoronaProvider>(context, listen: false).getData(),
            builder: (context, snapshot) {
              //JIKA MASIH LOADING
              if (snapshot.connectionState == ConnectionState.waiting) {
                //MAKA TAMPILKAN LOADING INDIKATOR
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              //SELAIN ITU MAKA AKAN KITA TAMPILKAN WIDGET UNTUK DATA
              //KITA GUNAKAN CONSUMER UNTUK MENGAMBIL DATA DARI CORONA PROVIDER
              return Consumer<CoronaProvider>(
                builder: (context, data, _) {
                  //DIMANA ADA DUA BUAH COLUMN
                  return Column(
                    children: <Widget>[
                      //YANG PERTAMA ADALAH DATA INDONESIA YANG WIDGETNYA KITA PISAHKAN KE FILE TERSENDIRI
                      Flexible(
                        flex: 1,
                        child: Indonesia(height: height, data: data,),
                      ),
                      //DAN YANG KEDUA ADALAH WIDGET UNTUK MENAMPILKAN DATA DUNIA DENGAN CARA YANG SAMA
                      Flexible(
                        flex: 1,
                        child: World(height: height, data: data,),
                      )
                    ],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
