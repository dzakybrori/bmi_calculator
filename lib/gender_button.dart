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
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: context.dp(80)),
              SizedBox(height: context.dp(15)),
              Text(label,
                  style:
                      const TextStyle(fontSize: 18, color: Color(0xFF8D8E98)),
                  textScaleFactor: context.ts),
            ],
          ),
        ),
      ),
    );
  }
}
