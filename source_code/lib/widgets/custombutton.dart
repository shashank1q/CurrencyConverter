import 'package:flutter/material.dart';

class Custombutton extends StatefulWidget {
  final String symbol;
  final double height;
  final double width;
  final GestureTapCallback func;

  const Custombutton(
      {Key? key,
      required this.symbol,
      this.height = 80,
      this.width = 80,
      required this.func})
      : super(key: key);

  @override
  State<Custombutton> createState() =>
      // ignore: no_logic_in_create_state
      _CustombuttonState(height: height, width: width);
}

class _CustombuttonState extends State<Custombutton> {
  bool glow = false;
  double height;
  double width;
  _CustombuttonState({required this.height, required this.width});
  late Color color1;
  late Color color2;

  @override
  void initState() {
    color1 = getColor(widget.symbol)[0];
    color2 = getColor(widget.symbol)[1];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          glow = true;
        });
      },
      onExit: (event) {
        setState(() {
          glow = false;
        });
      },
      child: InkWell(
        onTapDown: (e) {
          setState(() {
            height = widget.height - 5;
            width = widget.width - 10;
          });
        },
        onTapUp: (e) {
          setState(() {
            height = widget.height;
            width = widget.width;
            widget.func();
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          height: height,
          width: width,
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: [color1, color2],
            ),
            boxShadow: glow
                ? [
                    BoxShadow(
                      color: color1,
                      offset: const Offset(0, 0),
                      blurRadius: 5.0,
                    ),
                    BoxShadow(
                      color: color2,
                      offset: const Offset(0, 0),
                      blurRadius: 5.0,
                    ),
                  ]
                : [],
          ),
          child: Center(
            child: Text(
              widget.symbol,
              style: TextStyle(
                fontSize: widget.symbol == '-' ? 45 : 22,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Color> getColor(String symbol) {
    if (symbol == 'DEL') {
      return [Colors.redAccent, Colors.orange];
    } else if (symbol == '+' ||
        symbol == '-' ||
        symbol == 'X' ||
        symbol == '/' ||
        symbol == 'Clear All') {
      return [Colors.blueAccent, Colors.greenAccent];
    }

    return [Colors.blueGrey, Colors.grey];
  }
}
