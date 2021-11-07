part of 'screens.dart';

const kNormalWeightColor = Color(0xFF24DB76);
const kUnderWeightColor = Color(0xFF88ABFE);
const kOverWeightColor = Color(0xFFFF897A);

class ResultPage extends StatelessWidget {
  final CalculatorBrain bmiResult;

  const ResultPage({Key? key, required this.bmiResult}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text('BMI CALCULATOR', textScaleFactor: context.ts)),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(context.dp(18)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Your Result',
                      textScaleFactor: context.ts,
                      style: context.text.headline3?.copyWith(height: 1.5)),
                  SizedBox(height: context.h(14)),
                  Expanded(
                    child: CustomCard(
                      padding: EdgeInsets.all(context.h(24)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Spacer(flex: 3),
                          Text(bmiResult.getResult(),
                              textScaleFactor: context.ts,
                              style: context.text.headline6?.copyWith(
                                  color: bmiResult.getResultColor())),
                          const Spacer(),
                          Text(bmiResult.calculateBMI(),
                              textScaleFactor: context.ts,
                              style: context.text.headline1),
                          const Spacer(),
                          RichText(
                            text: TextSpan(
                                text: 'Normal BMI range:\n',
                                children: [
                                  TextSpan(
                                      text: '18,5 - 25 kg/m2',
                                      style: context.text.subtitle1?.copyWith(
                                          height: 1.7,
                                          color: context.onBackground)),
                                ],
                                style: context.text.subtitle1),
                            textAlign: TextAlign.center,
                            textScaleFactor: context.ts,
                            maxLines: 2,
                          ),
                          const Spacer(),
                          Text(bmiResult.getInterpretation(),
                              maxLines: 2,
                              textScaleFactor: context.ts,
                              textAlign: TextAlign.center,
                              style: context.text.subtitle1
                                  ?.copyWith(color: context.onBackground)),
                          const Spacer(flex: 3),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
              width: double.infinity,
              height: context.h(80),
              child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('RE-CALCULATE YOUR BMI',
                      textScaleFactor: context.ts))),
        ],
      ),
    );
  }
}
