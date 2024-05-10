import 'package:flutter/material.dart';
import 'package:worshipsongs_app/domain/Author.dart';
import '../domain/Song.dart';
import '../domain/Topic.dart';
import 'BottomNavigationBarState.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  final List<Song> songs;
  final List<Author> authors;
  final List<Topic> topics;

  const BottomNavigationBarWidget({super.key, required this.songs, required this.authors, required this.topics});

  @override
  State<BottomNavigationBarWidget> createState() => BottomNavigationBarState(songs, authors, topics);
}