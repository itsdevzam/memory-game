
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';

class HomeProvider extends ChangeNotifier{

  final AudioPlayer _player = AudioPlayer();

  void buttonClickSound()async{
    await _player.play(AssetSource('audio/BotonBeep.ogg'));
  }

}