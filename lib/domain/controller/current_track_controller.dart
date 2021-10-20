import 'package:flutter/material.dart';
import 'package:flutter_web_desktop/domain/model/songs.dart';
import 'package:get/get.dart';

class CurrentSongController extends GetxController {
  var _selectedSong = Song().obs;

  Song get selectedSong => _selectedSong.value;

  set selectedSong(Song song) {
    _selectedSong.value = song;
    update();
  }
}
