import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'navbar_screens/home_Page.dart';
import 'navbar_screens/chatPage.dart';

import 'navbar_screens/favourite.dart';
import 'navbar_screens/profilePage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override  
  
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  bool isToSearch = false;

  static List pages = [Card1(), Card2(), Card4(), Card5()];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  ////Search TextField function call

  filterField() {
    return
    Padding(
      padding: const EdgeInsets.all(5.0),
      child: TextFormField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 10),
            prefixIcon: Icon(Icons.search),
            suffixIcon:
                IconButton(onPressed: () {}, icon: Icon(Icons.menu_rounded)),
            fillColor: Colors.greenAccent,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            hintText: 'Search'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.deepPurple[900],
        showUnselectedLabels: true,
        unselectedItemColor: Colors.black26,
        selectedItemColor: Colors.deepPurple[700],
        elevation: 100,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "chat"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: "Favorite"),
          BottomNavigationBarItem(
              icon: Icon(Icons.perm_identity_outlined), label: "Profile")
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 2,
        title: isToSearch
            ? filterField()
            : Text(
                "Easy shelter",
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
        actions: [
         _selectedIndex==0? IconButton(
              onPressed: () {
                setState(() {
                  isToSearch = !isToSearch;
                });
              },
              icon: Icon(
               isToSearch?Icons.cancel: Icons.search,
                size: 30,
                color: Colors.black,
              )):Text(""),
        ],
        leading: _selectedIndex==0? isToSearch?null: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications,
              size: 30,
              color: Colors.black,
            )):null,
      ),
    );
  }
}
