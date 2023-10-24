
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'result.dart';
import 'package:bmi_calculator/calculator_functionality.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color maleCardColor = kInactiveCardColor;
  Color femaleCardColor = kInactiveCardColor;
  double _currentHeightValue = 180;
  double _currentWeightValue = 70;
  double _currentAgeValue = 19;
  void updateColor() {
    maleCardColor = maleCardColor == kInactiveCardColor
        ? kActiveCardColor
        : kInactiveCardColor;
    femaleCardColor = femaleCardColor == kInactiveCardColor
        ? kActiveCardColor
        : kInactiveCardColor;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColor();
                      });
                    },
                    child: ReusableCard(
                        colorReusableCard: maleCardColor,
                        cardChild: const IconContent(
                          icon: FontAwesomeIcons.mars,
                          label: 'Male',
                        )),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColor();
                      });
                    },
                    child: ReusableCard(
                      cardChild: const IconContent(
                        icon: FontAwesomeIcons.venus,
                        label: 'Female',
                      ),
                      colorReusableCard: femaleCardColor,
                    ),
                  ),
                ),
              ],
            ),
          ),//gender section
          Expanded(
            child: ReusableCard(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        _currentHeightValue.round().toString(),
                        style: kNumberTextStyle,
                      ),
                      const Text(
                        "cm",
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: const SliderThemeData(
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 15,
                      ),
                      overlayShape: RoundSliderOverlayShape(
                        overlayRadius: 30,
                      ),
                      overlayColor: Color(0x1fEB1555),
                      thumbColor: Color(0xFFEB1555),
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8E98),
                    ),
                    child: Slider(
                      value: _currentHeightValue,
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double value) {
                        setState(() {
                          _currentHeightValue = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              colorReusableCard: kActiveCardColor,
            ),
          ),//Height section
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          _currentWeightValue.round().toString(),
                          style: kNumberTextStyle,
                        ),
                         Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(icon: FontAwesomeIcons.minus,
                              onPressed : (){
                              setState(() {
                                _currentWeightValue--;
                              });
                              }
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            RoundIconButton(icon: FontAwesomeIcons.plus,
                                onPressed : (){
                                  setState(() {
                                    _currentWeightValue++;
                                  });
                                }),
                          ],
                        )
                      ],
                    ),
                    colorReusableCard: kActiveCardColor,
                  ),
                ), // Weight section
                Expanded(
                  child: ReusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          _currentAgeValue.round().toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(icon: FontAwesomeIcons.minus,
                                onPressed : (){
                                  setState(() {
                                    _currentAgeValue--;
                                  });
                                }
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            RoundIconButton(icon: FontAwesomeIcons.plus,
                                onPressed : (){
                                  setState(() {
                                    _currentAgeValue++;
                                  });
                                }),
                          ],
                        )
                      ],
                    ),
                    colorReusableCard: kActiveCardColor,
                  ),
                ),//Age Section
              ],
            ),
          ), //weight and age section
          GestureDetector(
            onTap: (){
              CalculatorBrain calc = CalculatorBrain(height: _currentHeightValue, weight: _currentWeightValue);
              Navigator.push(context, MaterialPageRoute(builder: (context) =>  ResultsPage(
                bmiResult: calc.calculateBMI() ,
                resultText: calc.getResult(),
                interpretation:calc.getInterpretation(),
              ),
              ));
            },
            child: Container(
              color: kBottomContainerColor,
              padding: const EdgeInsets.only(bottom: 20),
              margin: const EdgeInsets.only(top: 10),
              width: double.infinity,
              height: kBottomContainerHeight,
              child:  const Center(
                child: Text('CALCULATE',
                style: kLargeButtonTextStyle,),
              ),
            ),
          ),//bottom
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


class RoundIconButton extends StatelessWidget {
  const RoundIconButton({super.key, required this.icon, required this.onPressed});
  final IconData icon;
 final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0.0,
      constraints: const BoxConstraints.tightFor(
        width: 56,
        height: 56,
      ),
      shape: const CircleBorder(),
      fillColor: const Color(0xFF4C4F5E),
      onPressed: onPressed,
      child: Icon(icon),
    );
  }
}
