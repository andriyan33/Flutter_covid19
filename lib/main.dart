import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import './providers/corona_provider.dart';
import './home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //PROVIDER DIGUNAKAN UNTUK MANAJEMEN STATE, PEMBAHASAN LEBIH LENGKAP ADA DI ARTIKEL BERBEDA
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CoronaProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home(),
        title: 'Corona Goblok',
      ),
    );
  }
}