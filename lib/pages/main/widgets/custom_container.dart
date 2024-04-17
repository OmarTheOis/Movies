import 'package:flutter/material.dart';
import 'package:movies/core/config/constants.dart';

class Customcontainer extends StatelessWidget {
 final String text ;
 final String image ;
   Customcontainer({super.key, required this.text, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(4),
      padding: EdgeInsets.all(2),
      alignment: Alignment.topLeft,
      color: Color(0XFF282A28),

      child: Column(
        children: [
          Text(text,style: constants.theme.textTheme.bodyMedium,textAlign: TextAlign.start,),
        SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                children: [
            Container(decoration: BoxDecoration(
            image:DecorationImage(
              //api images
                image:AssetImage (image) ,
            fit: BoxFit.cover) ,
    ),
    margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
    width: 100,
    height: 150,
              child: Icon(Icons.add),
    ),
    ]
    )

    ),
    ],
      ),
    );
  }
}
