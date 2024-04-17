import 'package:flutter/material.dart';
class searchsscreen extends StatelessWidget {
  const searchsscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(25),
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 15,),
              SearchBar(
               hintText: "Search",
                leading: Icon(Icons.search,color: Colors.white,) ,
                backgroundColor:  MaterialStateProperty.all(Color(0XFF514F4F)),
              ),
              SizedBox(height: 150,),
              Image.asset("assets/images/searchpage.png"),
            ],
          ),
        ),
      ),
    );
  }
}
