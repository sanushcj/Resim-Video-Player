// ignore_for_file: always_specify_types, use_build_context_synchronously, non_constant_identifier_names

import 'package:flutter/material.dart';
import '../navbar.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    GoToHome(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 4, 57, 87),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            SizedBox(
                height: 100,
                width: 100,
                child: Image(
                    image: AssetImage('assets/img/Resim player icon.png'))),
            Text(
              'RESIM VIDEO',
              style: TextStyle(color: Colors.white, fontSize: 40),
            )
          ],
        ),
      ),
    );
  }

  Future<void> GoToHome(BuildContext context) async {
    await Future<dynamic>.delayed(
      const Duration(seconds: 1),
    );
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const NavBar(),
    ));
  }
}
