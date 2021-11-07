part of 'wrapper.dart';

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

  void toggleSelectedGender(Gender gender) {
    if (gender != _selectedGender) {
      setState(() => _selectedGender =
          (_selectedGender == Gender.male) ? Gender.female : Gender.male);
    }
  }

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
                children: [
                  _buildGenderSection(),
                  _buildHeightSection(context),
                  Expanded(
                    flex: 9,
                    child: Row(
                      children: [
                        Expanded(
                          child: CounterCard(
                            label: 'WEIGHT',
                            value: _weight,
                            onDecrement: () {},
                            onIncrement: () {},
                          ),
                        ),
                        Expanded(
                          child: CounterCard(
                            label: 'AGE',
                            value: _age,
                            onDecrement: () {},
                            onIncrement: () {},
                          ),
                        ),
                      ],
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
                  onPressed: () {},
                  child:
                      Text('CALCULATE YOUR BMI', textScaleFactor: context.ts)))
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
              onChanged: (value) => setState(() => _height = value.round()),
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
                  onTap: () => toggleSelectedGender(Gender.male),
                  isSelected: _selectedGender == Gender.male,
                  icon: FontAwesomeIcons.mars,
                  label: 'MALE')),
          Expanded(
              child: GenderButton(
                  onTap: () => toggleSelectedGender(Gender.female),
                  isSelected: _selectedGender == Gender.female,
                  icon: FontAwesomeIcons.venus,
                  label: 'FEMALE')),
        ],
      ),
    );
  }
}
