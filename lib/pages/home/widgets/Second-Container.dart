import 'package:flutter/material.dart';
import 'package:movies/Domain/Entities/recomended_entity.dart';
import 'package:movies/core/config/constants.dart';
import 'package:movies/network/Api/api_manger.dart';
import 'package:movies/pages/home/widgets/recomended_item.dart';
//more like this Container
class SecondContainer extends StatelessWidget {
  final String text ;
  final String image ;
  const SecondContainer({super.key, required this.text, required this.image});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.recomended(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error.toString());
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          List<RecommendedEntities> data = snapshot.data ?? [];
          return Container(
                margin: EdgeInsets.all(4),
                padding: EdgeInsets.only(left: 10,top: 5),
                alignment: Alignment.topLeft,
                color: Color(0XFF282A28),
                width:constants.mediaquery.width,
                height: constants.mediaquery.height*0.3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(text,style: constants.theme.textTheme.bodyMedium,textAlign: TextAlign.start,),
                    Expanded(
                      child: ListView.builder(
                        itemCount: data.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) =>  RecomendedItem(image: data[index].image, name: data[index].title, price: data[index].publishAt, reviews: data[index].reviews),),
                    )
                  ],
                ),



          );

        },


    );


  }
}
