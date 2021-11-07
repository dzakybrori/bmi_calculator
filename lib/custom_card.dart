part of 'wrapper.dart';

class CustomCard extends StatelessWidget {
  final Color? color;
  final Widget? child;
  final EdgeInsetsGeometry? margin;

  const CustomCard({
    Key? key,
    this.color,
    this.child,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: margin ??
          EdgeInsets.symmetric(
              horizontal: context.dp(4), vertical: context.dp(12)),
      decoration: BoxDecoration(
          color: color ?? context.background,
          borderRadius: BorderRadius.circular(10)),
      child: child,
    );
  }
}
