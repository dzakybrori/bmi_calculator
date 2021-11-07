part of 'wrapper.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int selectedGender = 1;

  @override
  void setState(VoidCallback fn) => (mounted) ? super.setState(fn) : fn();

  void toggleSelectedGender(int gender) {
    // gender 1 is male and 2 is female
    if (gender != selectedGender) {
      setState(() => selectedGender = (selectedGender == 1) ? 2 : 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text('BMI CALCULATOR', textScaleFactor: context.ts)),
      body: Padding(
        padding: EdgeInsets.all(context.dp(18)),
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: GenderButton(
                          onTap: () => toggleSelectedGender(1),
                          isSelected: selectedGender == 1,
                          icon: FontAwesomeIcons.mars,
                          label: 'MALE')),
                  Expanded(
                      child: GenderButton(
                          onTap: () => toggleSelectedGender(2),
                          isSelected: selectedGender == 2,
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
      floatingActionButton:
          FloatingActionButton(onPressed: () {}, child: const Icon(Icons.add)),
    );
  }
}
