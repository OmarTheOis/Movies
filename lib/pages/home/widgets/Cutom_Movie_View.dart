import 'package:flutter/material.dart';
import 'package:movies/Domain/Entities/popular_entites.dart';
import 'package:movies/core/config/constants.dart';
import 'package:movies/network/Api/api_manger.dart';
import 'package:movies/pages/home/widgets/Second-Container.dart';
import 'package:movies/pages/home/widgets/category_item.dart';
import 'package:movies/pages/home/widgets/custom_container.dart';

import 'package:flutter/material.dart';
import 'package:movies/Domain/Entities/popular_entites.dart';
import 'package:movies/core/config/constants.dart';
import 'package:movies/network/Api/api_manger.dart';
import 'package:movies/pages/home/widgets/Second-Container.dart';
import 'package:movies/pages/home/widgets/category_item.dart';
import 'package:movies/pages/home/widgets/custom_container.dart';

class CustomMovieView extends StatelessWidget {
  const CustomMovieView({Key? key});

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as PopularEntity;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(
          args.title,
          style: constants.theme.textTheme.bodyLarge,
        ),
      ),
      body: Column(
        children: [
          Container(
            width: constants.mediaquery.width,
            height: constants.mediaquery.height * 0.55,
            child: Column(
              children: [
                Container(
                  color: Color(0xFF282A28),
                  width: constants.mediaquery.width,
                  height: constants.mediaquery.height * 0.24,
                  child: Image.network(
                    args.backDrop,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        args.title,
                        style: constants.theme.textTheme.bodyLarge,
                      ),
                      Text(
                        "Release date:  ${args.date}",
                        style: constants.theme.textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Stack(
                      alignment: Alignment.topLeft,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0XFF282A28),
                            borderRadius:
                            BorderRadius.all(Radius.circular(10)),
                            image: DecorationImage(
                              image: NetworkImage(args.poster),
                              fit: BoxFit.cover,
                            ),
                          ),
                          margin: EdgeInsets.symmetric(
                              vertical: 0, horizontal: 10),
                          width: MediaQuery.of(context).size.width * 0.3,
                          height: constants.mediaquery.height * 0.22,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Image.asset("assets/images/bookmark.png"),
                        )
                      ],
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FutureBuilder(
                            future: ApiManager.categoryNames(args.categories),
                            builder: (context, AsyncSnapshot<List<String>> snapshot) {
                              if (snapshot.connectionState == ConnectionState.waiting) {
                                return CircularProgressIndicator();
                              } else if (snapshot.hasError) {
                                return Text('Error: ${snapshot.error}');
                              } else {
                                List<String> categories = snapshot.data ?? [];
                                return SizedBox(
                                  height: constants.mediaquery.height * 0.15,
                                  width: constants.mediaquery.width * 0.6,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                children: categories.map((category) {
                                                  return CategoryItem(category: category);
                                                }).toList(),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        "Overview:",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Expanded(
                                        child: SingleChildScrollView(
                                          child: Text(
                                            args.overview,
                                            style: constants.theme.textTheme.bodyMedium,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }
                            },
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.yellow),
                              Text(
                                "Rating (${args.voteAverage})",
                                style: constants.theme.textTheme.bodyLarge,
                              )
                            ],
                          ),
                          SizedBox(height: 8),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: constants.mediaquery.height * 0.02),
          const SecondContainer(
            text: 'More like this',
            image: "assets/images/TestBrowse.png",
          ),
        ],
      ),
    );
  }
}


