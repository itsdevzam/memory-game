import 'package:flutter/material.dart';
import 'package:memory_card/provider/GameProvider.dart';
import 'package:memory_card/utils/Constants.dart';
import 'package:memory_card/widgets/FlipCard.dart';
import 'package:memory_card/widgets/MyButton.dart';
import 'package:provider/provider.dart';

class GameScreen extends StatefulWidget {
  int rows;
  int columns;

  GameScreen({super.key, required this.rows, required this.columns});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    final gameProvider = Provider.of<GameProvider>(context);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bg/bg_blue.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            ///Header
            Container(
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: Colors.lightBlue.withAlpha(100),
                image: const DecorationImage(
                  image: AssetImage("assets/icons/square.png"),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.blueAccent,
                    BlendMode.srcATop,
                  ),
                ),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                ),
                border: Border.all(color: Colors.black54, width: 0.5),
              ),
              width: Constants.getWidth(context),
              height: 120,
              child: Consumer<GameProvider>(
                builder: (context, gameProvider, child) => Row(
                  mainAxisAlignment: .spaceEvenly,
                  children: [
                    MyButton(
                      callback: () {},
                      text: "",
                      width: 50,
                      iconData: Icons.pause,
                      isIcon: true,
                      iconColor: Colors.black54,
                    ),
                    MyButton(
                      callback: () {},
                      iconData: Icons.star_rounded,
                      text: gameProvider.userCoins.toString(),
                      width: 150,
                      fontSize: 24,
                      isIcon: true,
                    ),
                    MyButton(
                      callback: () {},
                      text: gameProvider.userLives.toString(),
                      width: 100,
                      iconData: Icons.favorite,
                      isIcon: true,
                      fontSize: 22,
                      iconColor: Colors.redAccent,
                    ),
                  ],
                ),
              ),
            ),

            ///Body
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: widget.columns > 4 ? 0 : 50),
                child: GridView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: widget.columns >= 4 ? 4 : widget.columns,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                  ),
                  itemCount: widget.rows * widget.columns,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () =>
                          gameProvider.flipCard(index: index, context: context),
                      child: Consumer<GameProvider>(
                        builder: (context, gameProvider, child) {
                          return FlipCard(
                            isFlipped:
                                gameProvider.cardList[index].isFlip! ||
                                gameProvider.cardList[index].isMatch!,
                            front: Card(
                              elevation: 3,
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.white.withAlpha(150),
                                      Colors.lightBlue.withOpacity(0.8),
                                    ],
                                    begin: AlignmentGeometry.topCenter,
                                    end: AlignmentGeometry.bottomCenter,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: Colors.black54,
                                    width: 1,
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadiusGeometry.circular(
                                    10,
                                  ),
                                  child: Image.asset(
                                    gameProvider.cardList[index].image!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                // child: Image.asset("assets/icons/card.png"),
                              ),
                            ),
                            back: Card(
                              elevation: 3,
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.white.withAlpha(150),
                                      Colors.lightBlue.withOpacity(0.8),
                                    ],
                                    begin: AlignmentGeometry.topCenter,
                                    end: AlignmentGeometry.bottomCenter,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: Colors.black54,
                                    width: 1,
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadiusGeometry.circular(
                                    10,
                                  ),
                                  child: Image.asset(
                                    "assets/icons/card.png",
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                // child: Image.asset("assets/icons/card.png"),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<GameProvider>().buildCardList(
      rows: widget.rows,
      columns: widget.columns,
    );
  }
}
