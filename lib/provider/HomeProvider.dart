import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:memory_card/widgets/MyText.dart';
import '../screen/GameScreen.dart';

class HomeProvider extends ChangeNotifier {
  bool _sound = true;
  bool _music = true;

  bool get sound => _sound;

  bool get music => _music;

  List<int> customRows = [2, 3, 4, 5, 6, 7, 8];
  List<int> customColumns = [2, 3, 4];
  int selectCustomRow = 2;
  int selectCustomColumn = 2;

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

  void setInitialValues() {
    selectCustomRow = 2;
    selectCustomColumn = 2;
  }

  void selectCustomCard({
    required int rows,
    required int columns,
    required BuildContext context,
  }) {
    if (rows * columns % 2 == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => GameScreen(rows: rows, columns: columns),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Center(child: Text("Please Select Multiple of 2",style: GoogleFonts.abel(fontSize: 20))),
          backgroundColor: Colors.lightBlue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.only(topRight: Radius.circular(10),topLeft: Radius.circular(10))
          ),
        ),
      );
    }
  }
}
