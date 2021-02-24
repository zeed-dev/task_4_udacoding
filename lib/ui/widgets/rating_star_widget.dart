part of 'widgets.dart';

class RatingStar extends StatelessWidget {
  final int rate;
  final int index;

  RatingStar({
    this.index,
    this.rate,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      index <= rate ? "assets/Icon_star.png" : "assets/Icon_star_grey.png",
      width: 22,
    );
  }
}
