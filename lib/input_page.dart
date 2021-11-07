part of 'wrapper.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.male;

  @override
  void setState(VoidCallback fn) => (mounted) ? super.setState(fn) : fn();

  void toggleSelectedGender(Gender gender) {
    // gender 1 is male and 2 is female
    if (gender != selectedGender) {
      setState(() => selectedGender =
          (selectedGender == Gender.male) ? Gender.female : Gender.male);
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
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                            child: GenderButton(
                                onTap: () => toggleSelectedGender(Gender.male),
                                isSelected: selectedGender == Gender.male,
                                icon: FontAwesomeIcons.mars,
                                label: 'MALE')),
                        Expanded(
                            child: GenderButton(
                                onTap: () =>
                                    toggleSelectedGender(Gender.female),
                                isSelected: selectedGender == Gender.female,
                                icon: FontAwesomeIcons.venus,
                                label: 'FEMALE')),
                      ],
                    ),
                  ),
                  const Expanded(child: CustomCard()),
                  Expanded(
                    child: Row(
                      children: const [
                        Expanded(child: CustomCard()),
                        Expanded(child: CustomCard()),
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
}
