import 'package:flutter/material.dart';
import 'package:movies/pages/search/pages/searchscreen.dart';
import 'package:movies/pages/watchlist/pages/watchlist.dart';

import '../../browse/pages/browse.dart';
import '../../home/pages/home_navbar.dart';
import '../widgets/custom_container.dart';

class MainScreen extends StatefulWidget {

   const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentindex=0;

  List<Widget>navigatedpages=[home(),searchsscreen(),browsesscreen(),watchlistsscreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigatedpages[currentindex],
      bottomNavigationBar: BottomNavigationBar(currentIndex: currentindex,
        onTap: (index){
          currentindex=index;
          setState(() {
          });
        },
        items: [
        BottomNavigationBarItem(icon: Icon(Icons.home),
            label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.search),
            label: "Search"),
        BottomNavigationBarItem(icon: ImageIcon(AssetImage("assets/images/browseicon.png")),
            label: "BROWSE"),
        BottomNavigationBarItem(icon: ImageIcon(AssetImage("assets/images/watchlist_icon.png")),
            label: "WATCHLIST"),
      ],
      ),
    );
  }
}
