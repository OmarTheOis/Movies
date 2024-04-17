import 'package:flutter/material.dart';
import 'package:movies/core/config/constants.dart';
import 'package:movies/pages/home/widgets/Second-Container.dart';

import '../widgets/custom_container.dart';
import '../widgets/popularView.dart';

class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          PopularView(),
          SizedBox(height: constants.mediaquery.height*0.02,),
          Customcontainer(text: "New Releases ",image: "assets/images/Splash.png"),
          SizedBox(height: constants.mediaquery.height*0.02,),
          SecondContainer(text: "Recomended ",image: "assets/images/Splash.png",)

        ],
      ),
    );
  }
}
