part of 'wrapper.dart';

class GenderButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const GenderButton(
      {Key? key,
      required this.icon,
      required this.label,
      this.isSelected = false,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: context.dp(4), vertical: context.dp(8)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: CustomCard(
          margin: EdgeInsets.zero,
          color: isSelected ? context.focusColor : context.disableColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon,
                  color: isSelected
                      ? Colors.white.withOpacity(0.89)
                      : Colors.white60,
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
      ),
    );
  }
}
