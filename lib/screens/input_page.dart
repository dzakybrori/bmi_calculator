part of 'screens.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  var _padding = 18.0;
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
    _padding = context.dp(18);
    return Scaffold(
      appBar: context.isPortrait
          ? AppBar(centerTitle: true, title: _textTitle())
          : null,
      body: _buildBody(context),
    );
  }

  // NOTE: THE MAIN COMPONENTS--------------------------------------------------
  //// Text Title
  Text _textTitle() => Text('BMI CALCULATOR',
      style: context.text.headline6, textScaleFactor: context.ts);

  //// Male Gender Button
  Widget _maleGenderBtn() => Expanded(
      child: GenderButton(
          onTap: () => _toggleSelectedGender(Gender.male),
          isSelected: _selectedGender == Gender.male,
          icon: FontAwesomeIcons.mars,
          label: 'MALE'));

  //// Female Gender Button
  Widget _femaleGenderBtn() => Expanded(
      child: GenderButton(
          onTap: () => _toggleSelectedGender(Gender.female),
          isSelected: _selectedGender == Gender.female,
          icon: FontAwesomeIcons.venus,
          label: 'FEMALE'));

  //// Setting Weight Section
  Widget _weightSection() => Expanded(
        child: CounterCard(
          label: 'WEIGHT',
          value: _weight,
          onDecrement: _decrementWeight,
          onIncrement: _incrementWeight,
        ),
      );

  //// Setting Age Section
  Widget _ageSection() => Expanded(
        child: CounterCard(
          label: 'AGE',
          value: _age,
          onDecrement: _decrementAge,
          onIncrement: _incrementAge,
        ),
      );

  //// Calculate Button
  Widget _calculateBmiBtn() => SizedBox(
      width: double.infinity,
      height: context.isLandscape ? context.dp(65) : context.h(80),
      child: ElevatedButton(
          onPressed: _calculateBmi,
          child: Text('CALCULATE YOUR BMI', textScaleFactor: context.ts)));

  // NOTE: END OF MAIN COMPONENTS-----------------------------------------------

  Widget _buildBody(BuildContext context) {
    List<Widget> _children = [
      _buildGenderSection(),
      _buildWeightAndAgeSection(),
      _buildHeightSection(context)
    ];
    return context.isLandscape
        ? SafeArea(
            child: Row(children: _children),
          )
        : Column(children: [
            Expanded(
                child: Padding(
                    padding: EdgeInsets.only(
                        right: _padding, left: _padding, bottom: _padding),
                    child: Column(children: _children))),
            _calculateBmiBtn()
          ]);
  }

  Expanded _buildWeightAndAgeSection() {
    List<Widget> _children = [_weightSection(), _ageSection()];
    return Expanded(
      flex: 9,
      child: context.isLandscape
          ? Padding(
              padding: EdgeInsets.symmetric(horizontal: context.dp(8)),
              child: Column(children: _children.reversed.toList()),
            )
          : Row(children: _children),
    );
  }

  Expanded _buildHeightSection(BuildContext context) {
    Widget _card = CustomCard(
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
    );
    return Expanded(
      flex: 9,
      child: context.isLandscape
          ? Column(
              children: [
                Expanded(child: _card),
                _calculateBmiBtn(),
              ],
            )
          : _card,
    );
  }

  // NOTE: GENDER BUTTON SECTION------------------------------------------------
  Expanded _buildGenderSection() {
    return Expanded(
      flex: 8,
      child: context.isLandscape
          ? Padding(
              padding: EdgeInsets.only(top: _padding, left: _padding),
              child: Column(children: [
                _textTitle(),
                SizedBox(height: context.dp(8)),
                _maleGenderBtn(),
                _femaleGenderBtn(),
              ]),
            )
          : Row(
              children: [
                _maleGenderBtn(),
                _femaleGenderBtn(),
              ],
            ),
    );
  }
// NOTE: END OF GENDER BUTTON SECTION-----------------------------------------
}
