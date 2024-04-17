
import 'package:flutter/material.dart';
import 'package:movies/core/config/constants.dart';

class RecomendedItem extends StatelessWidget {
  final image;
  final name;
  final price;
  final double reviews;

  const RecomendedItem(
      {super.key,
        required this.image,
        required this.name,
        required this.price,
        required this.reviews});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width*0.24,
      height: size.height*0.21,
      margin: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            alignment: Alignment.topLeft,
            children: [
              Container(
                height: size.height*0.14,
                width: size.width*0.24,
                child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(4),
                        topLeft: Radius.circular(4)),
                    child: Image.network(
                      image,
                      fit: BoxFit.fill,
                    )),
              ),
              InkWell(
                onTap: () {},
                child:
                    Image.asset("assets/images/bookmark.png"),

                )
            ],
          ),
          Expanded(
            child: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                    color: Color(0XFF343534),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(4),
                        bottomRight: Radius.circular(4)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Color(0xFFF4B400),
                            size: 20,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            reviews.toString(),
                            style: constants.theme.textTheme.bodySmall!.copyWith(
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        name,
                        overflow: TextOverflow.ellipsis,
                       style: constants.theme.textTheme.bodySmall!.copyWith(
                         overflow: TextOverflow.ellipsis,
                         fontWeight: FontWeight.normal,
                       )
                      ),
                      Row(
                        children: [
                          Text(
                            price,
                            overflow: TextOverflow.ellipsis,
                              style: constants.theme.textTheme.bodySmall!.copyWith(
                                fontWeight: FontWeight.normal,
                                color: Color(0xFFB5B4B4),
                                fontSize: 12
                              )
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}