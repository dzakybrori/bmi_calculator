part of 'wrapper.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
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
                children: const [
                  Expanded(
                      child: GenderButton(
                          isSelected: true,
                          icon: FontAwesomeIcons.mars,
                          label: 'MALE')),
                  Expanded(
                      child: GenderButton(
                          icon: FontAwesomeIcons.venus, label: 'FEMALE')),
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
