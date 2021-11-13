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
      appBar: context.isPortrait
          ? AppBar(centerTitle: true, title: _textTitle(context))
          : null,
      body: context.isLandscape
          ? SafeArea(
              child: Row(children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      SizedBox(height: context.dp(18)),
                      _textTitle(context),
                      const Spacer(),
                      _textResult(context),
                      const Spacer(),
                      _reCalculateBmiBtn(context),
                      const Spacer(),
                      SizedBox(height: context.dp(18)),
                    ],
                  ),
                ),
                _buildMainResult(context)
              ]),
            )
          : Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(context.dp(18)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _textResult(context),
                        SizedBox(height: context.h(14)),
                        _buildMainResult(context),
                      ],
                    ),
                  ),
                ),
                _reCalculateBmiBtn(context),
              ],
            ),
    );
  }

  // NOTE: THE MAIN COMPONENTS--------------------------------------------------
  //// Text Title
  Text _textTitle(BuildContext context) => Text('BMI CALCULATOR',
      style: context.text.headline6, textScaleFactor: context.ts);

  //// Text Result
  Text _textResult(BuildContext context) => Text('Your Result',
      textScaleFactor: context.ts,
      style: context.text.headline3?.copyWith(height: 1.5));

  //// Result Section
  Widget _buildMainResult(BuildContext context) => Expanded(
        flex: context.isLandscape ? 3 : 1,
        child: CustomCard(
          padding: EdgeInsets.all(context.h(24)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 3),
              Text(bmiResult.getResult(),
                  textScaleFactor: context.ts,
                  style: context.text.headline6
                      ?.copyWith(color: bmiResult.getResultColor())),
              const Spacer(),
              Text(bmiResult.calculateBMI(),
                  textScaleFactor: context.ts, style: context.text.headline1),
              const Spacer(),
              RichText(
                text: TextSpan(
                    text: 'Normal BMI range:\n',
                    children: [
                      TextSpan(
                          text: '18,5 - 25 kg/m2',
                          style: context.text.subtitle1?.copyWith(
                              height: 1.7, color: context.onBackground)),
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
      );

  //// Re-Calculate Button
  Widget _reCalculateBmiBtn(BuildContext context) => SizedBox(
      width: double.infinity,
      height: context.isLandscape ? context.dp(65) : context.h(80),
      child: ElevatedButton(
          onPressed: () => Navigator.pop(context),
          child: Text('RE-CALCULATE YOUR BMI', textScaleFactor: context.ts)));

// NOTE: END OF MAIN COMPONENTS-----------------------------------------------

}
