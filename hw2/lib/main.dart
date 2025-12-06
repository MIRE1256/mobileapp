import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const CalculatorUI(),
    );
  }
}

class CalculatorUI extends StatefulWidget {
  const CalculatorUI({super.key});

  @override
  State<CalculatorUI> createState() => _CalculatorUIState();
}

class _CalculatorUIState extends State<CalculatorUI> {
  String displayText = "0";
  String input = "";

  void onButtonPress(String value) {
    setState(() {
      if (value == "C") {
        input = "";
        displayText = "0";
        return;
      }

      if (value == "=") {
        try {
          String expression = input.replaceAll("%", "/100");
          displayText = expression;
          input = expression;
        } catch (e) {
          displayText = "Error";
          input = "";
        }
        return;
      }

      if ("+-*/".contains(value)) {
        if (input.isEmpty) return;
        if ("+-*/".contains(input[input.length - 1])) return;
      }

      input += value;
      displayText = input;
    });
  }

  Widget buildButton(String text, Color color) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(6.0),   // ลด padding จาก 8 → 6
        child: ElevatedButton(
          onPressed: () => onButtonPress(text),
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            padding: const EdgeInsets.symmetric(vertical: 18), // ลดขนาดปุ่มลง
            shape: const CircleBorder(),
            elevation: 0,
          ),
          child: Text(
            text,
            style: const TextStyle(fontSize: 26, color: Colors.white), // ลด font ลงนิดนึง
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: screenHeight - 20, // ปรับให้พอดีกับหน้าจอ
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFFF9A9E),
                    Color(0xFFFECFEF),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      displayText,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 60,
                      ),
                    ),
                  ),

                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            buildButton("7", const Color(0xFFFFB347)),
                            buildButton("8", const Color(0xFFFFCC33)),
                            buildButton("9", const Color(0xFF77DD77)),
                            buildButton("/", const Color(0xFF84B1FF)),
                          ],
                        ),
                        Row(
                          children: [
                            buildButton("4", const Color(0xFFFFB347)),
                            buildButton("5", const Color(0xFFFFCC33)),
                            buildButton("6", const Color(0xFF77DD77)),
                            buildButton("*", const Color(0xFF84B1FF)),
                          ],
                        ),
                        Row(
                          children: [
                            buildButton("1", const Color(0xFFFFB347)),
                            buildButton("2", const Color(0xFFFFCC33)),
                            buildButton("3", const Color(0xFF77DD77)),
                            buildButton("-", const Color(0xFF84B1FF)),
                          ],
                        ),
                        Row(
                          children: [
                            buildButton("0", const Color(0xFFFFB347)),
                            buildButton("%", const Color(0xFFFF80AB)),
                            buildButton("C", const Color(0xFFFF80AB)),
                            buildButton("+", const Color(0xFF84B1FF)),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: ElevatedButton(
                                  onPressed: () => onButtonPress("="),
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(vertical: 20),
                                    backgroundColor: const Color(0xFFB388FF),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    elevation: 0,
                                  ),
                                  child: const Text(
                                    "=",
                                    style: TextStyle(
                                      fontSize: 30,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
