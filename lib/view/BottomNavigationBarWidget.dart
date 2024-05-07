import 'package:flutter/material.dart';
import 'package:worshipsongs_app/view/BottomNavigationBarState.dart';
import '../domain/Song.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  final List<Song> songs;

  const BottomNavigationBarWidget({super.key, required this.songs});

  @override
  State<BottomNavigationBarWidget> createState() => BottomNavigationBarState(songs);
}