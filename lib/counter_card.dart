part of 'wrapper.dart';

class CounterCard extends StatelessWidget {
  final String label;
  final int value;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const CounterCard({
    Key? key,
    required this.label,
    required this.value,
    required this.onIncrement,
    required this.onDecrement,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      padding: EdgeInsets.all(context.dp(12)),
      child: FittedBox(
        child: Column(
          children: [
            Text(label,
                textScaleFactor: context.ts, style: context.text.subtitle1),
            Text('$value',
                textScaleFactor: context.ts, style: context.text.headline2),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              CircleIconButton(
                  icon: FontAwesomeIcons.minus, onPressed: onDecrement),
              SizedBox(width: context.dp(10)),
              CircleIconButton(
                  icon: FontAwesomeIcons.plus, onPressed: onIncrement),
            ]),
          ],
        ),
      ),
    );
  }
}
