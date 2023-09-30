import 'package:currency_converter/api/data.dart';
import 'package:currency_converter/utils/constants.dart';
import 'package:flutter/material.dart';

class WorkingSection extends StatefulWidget {
  const WorkingSection({super.key});
  @override
  State<WorkingSection> createState() => _WorkingSectionState();
}

class _WorkingSectionState extends State<WorkingSection> {
  int fromIndex = 0;
  int toIndex = 0;
  String convertedValue = '0';
  String currentRate = '1';
  TextEditingController amountController = TextEditingController();
  TextEditingController searchController = TextEditingController();
  Color swapColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Data.getData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasData) {
          if (0 != snapshot.data) {
            return showError(snapshot.data.toString());
          }
          return showLayout();
        } else {
          return showError(snapshot.error.toString());
        }
      },
    );
  }

  Widget showLayout() {
    return FittedBox(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          inputRow(),
          const SizedBox(height: 70),
          inputAmount(),
          const SizedBox(height: 35),
          convertBtn(),
          const SizedBox(height: 50),
          showResult(),
          const SizedBox(height: 50),
          showRate(),
        ],
      ),
    );
  }

  Widget showError(String error) {
    return Center(
        child: Text(
      'ERROR CODE: $error',
      style: getStyle(15, weight: 'l', color: 'w'),
    ));
  }

  void onConvertBtnPressed() {
    setState(() {
      convertedValue = Data.calculate(fromIndex, toIndex, amount: amountController.text);
    });
  }

  Widget showRate() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(width: 685),
        Text('Current Rate', style: getStyle(40, color: 'w', weight: 'b')),
        const SizedBox(height: 10),
        Text(currentRate, style: getStyle(36, color: 'lb', weight: 'l')),
      ],
    );
  }

  Widget showResult() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(width: 685),
        Text(Data.currencyName[toIndex], style: getStyle(40, color: 'w', weight: 'b')),
        const SizedBox(height: 10),
        Text(convertedValue, style: getStyle(36, color: 'lb', weight: 'l')),
      ],
    );
  }

  Widget convertBtn() {
    return SizedBox(
        height: 70,
        width: 245,
        child: ElevatedButton(
          onPressed: onConvertBtnPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          ),
          child: Text('convert', style: getStyle(32, weight: 'r')),
        ));
  }

  Widget inputAmount() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Amount', style: getStyle(40, color: 'w', weight: 'b')),
        const SizedBox(height: 16),
        SizedBox(
          height: 50,
          width: 685,
          child: TextField(
            controller: amountController,
            keyboardType: TextInputType.number,
            style: getStyle(30, color: 'lb'),
            cursorColor: lightblue,
            decoration: const InputDecoration(
              fillColor: Colors.amber,
              enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 1)),
              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 2)),
            ),
          ),
        )
      ],
    );
  }

  Widget inputRow() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('From', style: getStyle(40, color: 'w', weight: 'r')),
        const SizedBox(width: 15),
        // get 'from' currency
        InkWell(
          onTap: () {
            onCountrySeleted(forFrom: true);
          },
          child: Container(
            height: 50,
            width: 200,
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: lightblue),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: Text(
                Data.currencyName[fromIndex],
                style: getStyle(32, color: 'lb', weight: 'b'),
              ),
            ),
          ),
        ),
        const SizedBox(width: 30),
        InkWell(
          onTapUp: (details) {
            setState(() {
              swapColor = Colors.white;
            });
          },
          onTapDown: (details) {
            setState(() {
              swapColor = const Color.fromARGB(255, 226, 226, 226);
              int temp = fromIndex;
              fromIndex = toIndex;
              toIndex = temp;
              currentRate = Data.calculate(fromIndex, toIndex);
              convertedValue = Data.calculate(fromIndex, toIndex, amount: amountController.text);
            });
          },
          child: Container(
            height: 50,
            width: 50,
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: swapColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(swapUrl),
          ),
        ),
        const SizedBox(width: 30),
        Text('To', style: getStyle(40, color: 'w', weight: 'r')),
        const SizedBox(width: 15),
        // get 'to' currency
        InkWell(
          onTap: () {
            onCountrySeleted();
          },
          child: Container(
            height: 50,
            width: 200,
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: lightblue),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: Text(
                Data.currencyName[toIndex],
                style: getStyle(32, color: 'lb', weight: 'b'),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // update current rate variable
  void onCountrySeleted({bool forFrom = false}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            contentPadding: const EdgeInsets.all(0),
            backgroundColor: Colors.transparent,
            content: Container(
              height: 500,
              width: 400,
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
              padding: const EdgeInsets.all(10),
              child: StatefulBuilder(builder: (context, update) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: SearchBar(
                        backgroundColor: const MaterialStatePropertyAll(Colors.black12),
                        padding: const MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 10)),
                        elevation: const MaterialStatePropertyAll(0),
                        hintText: 'Search',
                        controller: searchController,
                        overlayColor: const MaterialStatePropertyAll(Colors.transparent),
                        textStyle: MaterialStatePropertyAll(getStyle(18, color: 'bl')),
                        hintStyle: MaterialStatePropertyAll(getStyle(18, color: 'b')),
                        onChanged: (value) {
                          update(() {});
                        },
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: Data.currencyName.length,
                        itemBuilder: (context, index) {
                          if (Data.currencyName[index].contains(searchController.text.toUpperCase())) {
                            return InkWell(
                              onTap: () {
                                Navigator.of(context).pop();
                                if (forFrom) {
                                  fromIndex = index;
                                } else {
                                  toIndex = index;
                                }
                                setState(() {});
                                currentRate = Data.calculate(fromIndex, toIndex);
                                searchController.text = '';
                              },
                              child: Container(
                                height: 60,
                                decoration: const BoxDecoration(border: Border(bottom: BorderSide(width: 1, color: lightblue))),
                                child: Center(
                                  child: Text(
                                    Data.currencyName[index],
                                    style: getStyle(20, color: 'b', weight: 'b'),
                                  ),
                                ),
                              ),
                            );
                          } else {
                            return const SizedBox();
                          }
                        },
                      ),
                    ),
                  ],
                );
              }),
            ));
      },
    );
  }
}
