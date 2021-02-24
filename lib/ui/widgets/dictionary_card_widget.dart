part of 'widgets.dart';

class DictionaryCard extends StatelessWidget {
  final Dictionary dictionary;
  final int indexDic;
  final Function onTap;

  DictionaryCard({
    this.dictionary,
    this.indexDic,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        margin: EdgeInsets.only(top: indexDic == 1 ? 0 : 20),
        padding: EdgeInsets.symmetric(horizontal: 15),
        height: 75,
        decoration: BoxDecoration(
          border: Border.all(
            color: greyColor,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: MediaQuery.of(context).size.width - 2 * defaultMargin - 50,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dictionary.title,
                    style: blackFontStyle,
                    maxLines: 1,
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    dictionary.subtitle,
                    style: greyFontStyle,
                    maxLines: 1,
                  ),
                ],
              ),
            ),
            Image.asset(
              "assets/btn.png",
              width: 10,
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
