part of 'components.dart';

class CustomCard extends StatelessWidget {
  final Color? color;
  final Widget? child;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

  const CustomCard({
    Key? key,
    this.color,
    this.child,
    this.margin,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: margin ??
          EdgeInsets.symmetric(
              horizontal: context.dp(4), vertical: context.dp(8)),
      padding: padding,
      decoration: BoxDecoration(
          color: color ?? context.background,
          borderRadius: BorderRadius.circular(10)),
      child: child,
    );
  }
}
