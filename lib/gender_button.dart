part of 'wrapper.dart';

class GenderButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;

  const GenderButton(
      {Key? key,
      required this.icon,
      required this.label,
      this.isSelected = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(10),
      child: CustomCard(
        color: isSelected ? context.focusColor : context.disableColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon,
                color: isSelected
                    ? Colors.white.withOpacity(0.89)
                    : Colors.white70,
                size: context.dp(80)),
            SizedBox(height: context.dp(15)),
            Text(label,
                style: TextStyle(
                    fontSize: 18,
                    color: isSelected ? Colors.white54 : Colors.white30),
                textScaleFactor: context.ts),
          ],
        ),
      ),
    );
  }
}
