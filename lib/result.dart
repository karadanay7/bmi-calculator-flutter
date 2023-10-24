import 'package:flutter/material.dart';
import 'constants.dart';
import 'reusable_card.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({ super.key, required this.bmiResult, required this.resultText, required this.interpretation});
  final String bmiResult;
  final String resultText;
  final String interpretation;




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            alignment: Alignment.bottomLeft,
            child: const Expanded(

              child: Text(
                'Your Result',
                style: kTitleTextStyle,
              ),
            ),
          ),
         Expanded(
            flex: 5,
            child: ReusableCard(
              colorReusableCard: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(resultText.toUpperCase(), style: kResultTextStyle,),
                  Text(bmiResult,style: kBMITextStyle,),
                  Text(interpretation, textAlign: TextAlign.center, style: kBodyTextStyle,)
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
             Navigator.pop(context);
            },
            child: Container(
              color: kBottomContainerColor,
              padding: const EdgeInsets.only(bottom: 20),
              margin: const EdgeInsets.only(top: 10),
              width: double.infinity,
              height: kBottomContainerHeight,
              child:  const Center(
                child: Text('RECALCULATE',
                  style: kLargeButtonTextStyle,),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
