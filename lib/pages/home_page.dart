
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:instagram_ui/pages/feed_page.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int current = 0;

  List<Widget> pages = [
    const FeedPage(),
    const FeedPage(),
    const FeedPage(),
    const FeedPage(),
    const FeedPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.black,
        leading: const Icon(FeatherIcons.camera,size:25,color: Colors.grey,),
        title: const Text("Instagram",style: TextStyle(color: Colors.grey, ),),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(FeatherIcons.tv,size: 25,color: Colors.grey,)),
          IconButton(onPressed: (){}, icon: const Icon(FeatherIcons.send,size: 25,color: Colors.grey,))
        ],
      ),
      body: pages[current],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: current,

        onTap: (index){
          setState(() {
            current = index;
          });
        },
        showUnselectedLabels: false,
        showSelectedLabels: false,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Foundation.home),
            label: 'feed',
          ),
          BottomNavigationBarItem(
            icon: Icon(FeatherIcons.search),
            label: 'search',
          ),
          BottomNavigationBarItem(
            icon: Icon(FeatherIcons.plusSquare),
            label: 'upload',
          ),
          BottomNavigationBarItem(
            icon: Icon(FeatherIcons.heart),
            label: 'like',
          ),
          BottomNavigationBarItem(
            icon: Icon(FeatherIcons.user),
            label: 'account',
          ),
        ],
      ),
    );
  }
}
