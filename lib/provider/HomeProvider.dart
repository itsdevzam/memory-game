import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';

class HomeProvider extends ChangeNotifier {
  bool _sound = true;
  bool _music = true;

  bool get sound => _sound;

  bool get music => _music;

  set sound(bool val) {
    _sound = val;
    notifyListeners();
  }

  set music(bool val) {
    _music = val;
    notifyListeners();
  }

  final AudioPlayer _player = AudioPlayer();

  void buttonClickSound() async {
    if (_sound) {
      await _player.play(AssetSource('audio/BotonBeep.ogg'));
    }
  }
}
