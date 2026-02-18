
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:memory_card/provider/HomeProvider.dart';
import 'package:provider/provider.dart';

class GameProvider extends ChangeNotifier {

  final AudioPlayer _player = AudioPlayer();

  void flipSound({required BuildContext context})async{
    final homeProvider = Provider.of<HomeProvider>(context,listen: false);
    if (homeProvider.sound) {
      await _player.play(AssetSource('audio/flip_card.ogg'));
    }
  }
}