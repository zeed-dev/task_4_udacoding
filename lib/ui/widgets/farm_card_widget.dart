part of 'widgets.dart';

class FarmCard extends StatelessWidget {
  final int index;
  final Farm farm;
  final Function onTap;

  const FarmCard({
    this.farm,
    this.index,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap();
        }
      },
      child: Container(
        margin: EdgeInsets.only(
          left: index == 0 ? defaultMargin : 0,
          right: index == mockFarm.length - 1 ? 16 : defaultMargin,
        ),
        height: 150,
        width: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: Color(0xFFF6F7F8),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18),
                topRight: Radius.circular(18),
              ),
              child: Image.asset(
                farm.photo,
                height: 102,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              farm.name,
              style: blackFontStyle,
              maxLines: 1,
              overflow: TextOverflow.clip,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
