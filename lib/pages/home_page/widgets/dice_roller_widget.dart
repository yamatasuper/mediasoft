import 'package:dnd_veilenar_assistant/pages/home_page/providers/dice_roller_d20.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class DiceRollerWidget extends StatelessWidget {
  const DiceRollerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Color _rollInProgressColor = Colors.pinkAccent;
    const Color _rollDoneColor = Colors.greenAccent;
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.blueGrey,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.blueGrey.withOpacity(0.4),
            spreadRadius: 2,
            blurRadius: 10,
            offset: Offset(2, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text(
              'D20 Dice Roller',
              style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 25,
                letterSpacing: 1,
              ),
            ),
          ),
          Consumer<D20DiceRoller>(
            builder: (_, D20DiceRoller diceRoller, __) => InkWell(
              onTap: () => diceRoller.isDone ? diceRoller.rollD20() : null,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: diceRoller.isDone
                        ? _rollDoneColor
                        : _rollInProgressColor,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/images/dices/d20_home.svg',
                    ),
                    Text(
                      diceRoller.d20.toString(),
                      style: TextStyle(fontSize: 38, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Selector<D20DiceRoller, bool>(
            selector: (_, D20DiceRoller diceRoller) => diceRoller.isDone,
            builder: (_, bool isDone, __) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Text(
                isDone ? 'Click on dice to roll' : 'Roll in progress...',
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 17,
                  letterSpacing: 0.8,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
