// ignore_for_file: always_specify_types


import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'Screens/All_Videos/all_videos.dart';
import 'Screens/Home/home.dart';
import 'Screens/Favorites/favorite_screen.dart';
import 'Screens/PlayList/playlist_screen.dart';

class NavBar extends StatefulWidget {
   const NavBar({super.key, });

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _currentselectionIndex = 0;

  final List<Widget> _pages = [
      HomeScreen(),
      AllVideos(),
     UserFav(),
    PlaylistPage(),
  ];

  @override
  Widget build(BuildContext context) {
        // log('<<<<<<<<<<<<<<<<<<<<<ssss<<<<<<<<<<<<<<<<<<<<<<<<<<,${widget.videodatasss}>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>.');
    return Scaffold(
      extendBody: true,
      backgroundColor: const Color.fromARGB(255, 4, 57, 87),
      body: _pages[_currentselectionIndex],
      bottomNavigationBar: FloatingNavbar(
        iconSize: 30,
        backgroundColor: const Color.fromARGB(255, 4, 57, 87),
        // fixedColor: Colors.white,
        unselectedItemColor: const Color.fromARGB(255, 167, 183, 188),
        // showSelectedLabels: false,
        // showUnselectedLabels: false,
        // type: FloatingNavbarItem.fixed,
        onTap: (value) {
          setState(() {
            _currentselectionIndex = value;
          });
        },
        currentIndex: _currentselectionIndex,
        items: [
          FloatingNavbarItem(icon: Icons.home, title: 'Home'),
          FloatingNavbarItem(icon: Icons.play_arrow, title: 'Play'),
          FloatingNavbarItem(icon: Icons.favorite, title: 'Favorites'),
          FloatingNavbarItem(icon: Icons.playlist_add, title: 'Playlists'),
        ],
      ),
    );
  }
}
