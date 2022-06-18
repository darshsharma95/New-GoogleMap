import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_map_new/screens/googlemapscreen.dart';



main(){
  runApp( MaterialApp(
    themeMode: ThemeMode.dark,
    theme: ThemeData(brightness: Brightness.dark,backgroundColor: Colors.black,),

    home: MyApp(),
  )
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>GoogleMapScreen(),
            )
        )
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            FlutterLogo(size: 100,),
          ],
        ),
      ),
    );
  }
}

