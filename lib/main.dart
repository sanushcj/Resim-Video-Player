import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';

import 'DB/modelclass.dart';
import 'Screens/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

     Hive.registerAdapter(VideoDatassAdapter());
  
 
 await Hive.openBox<List<dynamic>>(boxname);


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 800),
        minTextAdapt: true,
        splitScreenMode: true,
        // ignore: always_specify_types
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                backgroundColor: const Color.fromARGB(255, 4, 57, 87),
                fontFamily: 'Resim'),
            title: 'Resim Video',
            home: const Splashscreen(),
          );
        });
  }
}
