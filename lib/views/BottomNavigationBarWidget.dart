import 'package:flutter/material.dart';
import 'package:worshipsongs_app/domain/Author.dart';
import 'package:worshipsongs_app/views/BottomNavigationBarState.dart';
import '../domain/Song.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  final List<Song> songs;
  final List<Author> authors;

  const BottomNavigationBarWidget({super.key, required this.songs, required this.authors});

  @override
  State<BottomNavigationBarWidget> createState() => BottomNavigationBarState(songs, authors);
}