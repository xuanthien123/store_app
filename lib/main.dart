import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/provider/product_provider.dart';
import 'package:store_app/splash.dart';

import 'provider/theme_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: MaterialApp(

        title: 'Flutter Demo',
        theme: Provider.of<ThemeProvider>(context).currentTheme,
        //
        home: const Splash(),
      ),
    );
  }
}

