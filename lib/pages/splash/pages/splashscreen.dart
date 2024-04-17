import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movies/core/config/pages_Route_Name.dart';
import 'package:movies/network/Api/api_manger.dart';

import '../../../main.dart';

class splashscreen extends StatelessWidget {
  const splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 4),
            () {
          navigatorkey.currentState!.
          pushReplacementNamed(PageRouteName.homescreen);
        });
    return Container(
        decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            image: AssetImage("assets/images/Splash.png"),
            fit: BoxFit.cover,
          ),
        ),
    );
  }
}