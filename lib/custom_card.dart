part of 'wrapper.dart';

class CustomCard extends StatelessWidget {
  final Color? color;
  final Widget? child;

  const CustomCard({
    Key? key,
    this.color,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(context.dp(14)),
      decoration: BoxDecoration(
          color: color ?? context.background,
          borderRadius: BorderRadius.circular(10)),
      child: child,
    );
  }
}
