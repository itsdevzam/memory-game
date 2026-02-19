import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:memory_card/model/CardModel.dart';
import 'package:memory_card/provider/HomeProvider.dart';
import 'package:memory_card/widgets/resultDialog.dart';
import 'package:provider/provider.dart';

class GameProvider extends ChangeNotifier {
  final AudioPlayer _player = AudioPlayer();
  final int MAX_CARDS = 60;
  List<CardModel> cardList = [];
  int? openCardIndex;
  bool isBusy = false;
  int userLives = 0;
  int userCoins = 0;
  int retryRows = 0;
  int retryColumns = 0;

  void flipSound({required BuildContext context}) async {
    final homeProvider = Provider.of<HomeProvider>(context, listen: false);
    if (homeProvider.sound) {
      await _player.play(AssetSource('audio/flip_card.ogg'));
    }
  }

  void winSound({required BuildContext context}) async {
    final homeProvider = Provider.of<HomeProvider>(context, listen: false);
    if (homeProvider.sound) {
      await _player.play(AssetSource('audio/win.ogg'));
    }
  }

  void looseSound({required BuildContext context}) async {
    final homeProvider = Provider.of<HomeProvider>(context, listen: false);
    if (homeProvider.sound) {
      await _player.play(AssetSource('audio/loose.ogg'));
    }
  }

  void cardMatchSound({required BuildContext context}) async {
    final homeProvider = Provider.of<HomeProvider>(context, listen: false);
    if (homeProvider.sound) {
      await _player.play(AssetSource('audio/card_match.ogg'));
    }
  }

  bool get isGameCompleted {
    return cardList.every((card) => card.isMatch == true);
  }

  void buildCardList({
    required int rows,
    required int columns,
    required BuildContext context,
  }) {
    retryRows = rows;
    retryColumns = columns;
    cardList.clear();
    int pairs = (rows * columns) ~/ 2;
    for (int i = 0; i < pairs; i++) {
      final random = Random();
      int randomNumber = random.nextInt(MAX_CARDS);
      String imgPath = 'assets/cards/image${randomNumber + 1}.webp';
      final card1 = CardModel(image: imgPath, isMatch: false, isFlip: false);
      final card2 = CardModel(image: imgPath, isMatch: false, isFlip: false);
      cardList.add(card1);
      cardList.add(card2);
    }
    cardList.shuffle();
    buildUserLives(lives: pairs, context: context);
    resetCoins();
  }

  void retry({required BuildContext context}) {
    buildCardList(rows: retryRows, columns: retryColumns, context: context);
    notifyListeners();
  }

  void buildUserLives({required int lives, required BuildContext context}) {
    userLives = lives;
    ///Game-over condition
    if (userLives == 0) {
      looseSound(context: context);
      resultDialog(context: context, isCompleted: false, coins: userCoins);
    }
  }

  void addCoin() {
    userCoins += 10;
  }

  void resetCoins() {
    userCoins = 0;
  }

  void flipCard({required int index, required BuildContext context}) async {
    if (cardList[index].isFlip! || cardList[index].isMatch!) return;
    if (isBusy) return;
    if (userLives == 0) return;
    flipSound(context: context);
    if (openCardIndex != null) {
      isBusy = true;
      cardList[index].isFlip = true;
      notifyListeners();
      if (cardList[openCardIndex!].image == cardList[index].image) {
        cardMatchSound(context: context);
        cardList[openCardIndex!].isMatch = true;
        cardList[index].isMatch = true;
        openCardIndex = null;
        addCoin();
        buildUserLives(lives: userLives + 1, context: context);
        if (isGameCompleted) {
          winSound(context: context);
          resultDialog(context: context, isCompleted: true, coins: userCoins);
        }
      } else {
        await Future.delayed(const Duration(milliseconds: 700));
        cardList[openCardIndex!].isFlip = false;
        cardList[index].isFlip = false;
        openCardIndex = null;
        buildUserLives(lives: userLives - 1, context: context);
      }
      isBusy = false;
    } else {
      cardList[index].isFlip = true;
      openCardIndex = index;
    }
    notifyListeners();
  }
}
