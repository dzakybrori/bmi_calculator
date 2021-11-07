part of 'screens.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender _selectedGender = Gender.male;
  int _height = 160;
  int _weight = 60;
  int _age = 20;

  @override
  void setState(VoidCallback fn) => (mounted) ? super.setState(fn) : fn();

  void _toggleSelectedGender(Gender gender) {
    if (gender != _selectedGender) {
      setState(() => _selectedGender =
          (_selectedGender == Gender.male) ? Gender.female : Gender.male);
    }
  }

  void _changeHeight(double value) => setState(() => _height = value.round());

  void _decrementWeight() => setState(() => _weight--);
  void _incrementWeight() => setState(() => _weight++);
  void _decrementAge() => setState(() => _age--);
  void _incrementAge() => setState(() => _age++);

  void _calculateBmi() {
    CalculatorBrain calc = CalculatorBrain(height: _height, weight: _weight);
    calc.calculateBMI();

    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultPage(bmiResult: calc),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text('BMI CALCULATOR', textScaleFactor: context.ts)),
      body: _buildBody(context),
    );
  }

  Column _buildBody(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(
                right: context.dp(18),
                left: context.dp(18),
                bottom: context.dp(18)),
            child: Column(
              children: [
                _buildGenderSection(),
                _buildHeightSection(context),
                _buildWeightAndAgeSection(),
              ],
            ),
          ),
        ),
        SizedBox(
            width: double.infinity,
            height: context.h(80),
            child: ElevatedButton(
                onPressed: _calculateBmi,
                child: Text('CALCULATE YOUR BMI', textScaleFactor: context.ts)))
      ],
    );
  }

  Expanded _buildWeightAndAgeSection() {
    return Expanded(
      flex: 9,
      child: Row(
        children: [
          Expanded(
            child: CounterCard(
              label: 'WEIGHT',
              value: _weight,
              onDecrement: _decrementWeight,
              onIncrement: _incrementWeight,
            ),
          ),
          Expanded(
            child: CounterCard(
              label: 'AGE',
              value: _age,
              onDecrement: _decrementAge,
              onIncrement: _incrementAge,
            ),
          ),
        ],
      ),
    );
  }

  Expanded _buildHeightSection(BuildContext context) {
    return Expanded(
      flex: 9,
      child: CustomCard(
        padding: EdgeInsets.only(
            top: context.dp(12), right: context.dp(12), left: context.dp(12)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('HEIGHT',
                textScaleFactor: context.ts, style: context.text.subtitle1),
            RichText(
              text: TextSpan(
                  text: '$_height',
                  children: [
                    TextSpan(text: '\tcm', style: context.text.subtitle1)
                  ],
                  style: context.text.headline2),
              textScaleFactor: context.ts,
              maxLines: 1,
            ),
            Slider(
              value: _height.toDouble(),
              min: 130.0,
              max: 220.0,
              onChanged: _changeHeight,
            )
          ],
        ),
      ),
    );
  }

  Expanded _buildGenderSection() {
    return Expanded(
      flex: 8,
      child: Row(
        children: [
          Expanded(
              child: GenderButton(
                  onTap: () => _toggleSelectedGender(Gender.male),
                  isSelected: _selectedGender == Gender.male,
                  icon: FontAwesomeIcons.mars,
                  label: 'MALE')),
          Expanded(
              child: GenderButton(
                  onTap: () => _toggleSelectedGender(Gender.female),
                  isSelected: _selectedGender == Gender.female,
                  icon: FontAwesomeIcons.venus,
                  label: 'FEMALE')),
        ],
      ),
    );
  }
}
