// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:calculator/widgets/custombutton.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';
import 'calculations.dart';

class RightPanel extends StatefulWidget {
  const RightPanel({
    super.key,
  });

  @override
  State<RightPanel> createState() => _RightPanelState();
}

class _RightPanelState extends State<RightPanel> {
  ScrollController sc = ScrollController();
  UserData data = UserData();
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        width: 385,
        height: 600,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
                color: Colors.white12,
                offset: Offset(1, 1),
                blurRadius: 10.0,
                spreadRadius: 3.0)
          ],
          borderRadius: BorderRadius.circular(15),
        ),
        margin: const EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //screen
            Container(
              width: 380,
              height: 120,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                color: primary,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    data.previous,
                    style:
                        GoogleFonts.lato(fontSize: 20, color: Colors.white38),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    //padding: const EdgeInsets.symmetric(horizontal: 5),
                    controller: sc,
                    reverse: true,
                    child: Text(
                      data.curr,
                      style:
                          GoogleFonts.lato(fontSize: 60, color: Colors.white70),
                    ),
                  ),
                ],
              ),
            ),
            // buttons
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
                color: Color.fromARGB(255, 0, 11, 19),
              ),
              child: calculatorButtons(),
            )
          ],
        ),
      ),
    );
  }

  Column calculatorButtons() {
    return Column(
      children: [
        const SizedBox(height: 10),
        FittedBox(
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            const SizedBox(width: 10),
            Custombutton(
                symbol: '9',
                func: () => setState(() {
                      data.addNumber('9');
                    })),
            Custombutton(
                symbol: '8',
                func: () => setState(() {
                      data.addNumber('8');
                    })),
            Custombutton(
                symbol: '7',
                func: () => setState(() {
                      data.addNumber('7');
                    })),
            Custombutton(
                symbol: '+',
                func: () => setState(() {
                      data.operator('+');
                    })),
            const SizedBox(width: 10),
          ]),
        ),
        FittedBox(
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            const SizedBox(width: 10),
            Custombutton(
                symbol: '6',
                func: () => setState(() {
                      data.addNumber('6');
                    })),
            Custombutton(
                symbol: '5',
                func: () => setState(() {
                      data.addNumber('5');
                    })),
            Custombutton(
                symbol: '4',
                func: () => setState(() {
                      data.addNumber('4');
                    })),
            Custombutton(
                symbol: '-',
                func: () => setState(() {
                      data.operator('-');
                    })),
            const SizedBox(width: 10),
          ]),
        ),
        FittedBox(
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            const SizedBox(width: 10),
            Custombutton(
                symbol: '3',
                func: () => setState(() {
                      data.addNumber('3');
                    })),
            Custombutton(
                symbol: '2',
                func: () => setState(() {
                      data.addNumber('2');
                    })),
            Custombutton(
                symbol: '1',
                func: () => setState(() {
                      data.addNumber('1');
                    })),
            Custombutton(
                symbol: 'X',
                func: () => setState(() {
                      data.operator('X');
                    })),
            const SizedBox(width: 10),
          ]),
        ),
        FittedBox(
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            const SizedBox(width: 10),
            Custombutton(
                symbol: 'DEL',
                func: () => setState(() {
                      data.removelast();
                    })),
            Custombutton(
                symbol: '0',
                func: () => setState(() {
                      data.addNumber('0');
                    })),
            Custombutton(
                symbol: '=',
                func: () => setState(() {
                      data.operatorEqual();
                    })),
            Custombutton(
                symbol: '/',
                func: () => setState(() {
                      data.operator('/');
                    })),
            const SizedBox(width: 10),
          ]),
        ),
        const SizedBox(height: 5),
        FittedBox(
          child: Row(
            children: [
              Custombutton(
                symbol: 'Clear All',
                height: 70,
                width: 350,
                func: () {
                  setState(() {
                    data.curr = '';
                    data.previous = '';
                  });
                },
              ),
              const SizedBox(
                height: 80,
              )
            ],
          ),
        ),
        const SizedBox(height: 10)
      ],
    );
  }
}
