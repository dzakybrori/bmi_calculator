part of 'wrapper.dart';

class CircleIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const CircleIconButton(
      {Key? key, required this.icon, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
          width: context.dp(50), height: context.dp(50)),
      shape: const CircleBorder(),
      fillColor: context.focusColor,
      child: Icon(icon, size: context.dp(18)),
    );
  }
}
