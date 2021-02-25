part of 'pages.dart';

class DetailNewsPage extends StatefulWidget {
  final News news;
  DetailNewsPage({
    this.news,
  });

  @override
  _DetailNewsPageState createState() => _DetailNewsPageState();
}

class _DetailNewsPageState extends State<DetailNewsPage> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Image.network(
              baseURL + widget.news.photo,
              height: 358,
              fit: BoxFit.cover,
            ),
            ListView(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 328),
                  padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      color: whiteColor),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        widget.news.titile,
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                        style: blackFontStyle.copyWith(
                          fontSize: 22,
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        widget.news.date,
                        style: greyFontStyle.copyWith(
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        widget.news.description,
                        style: greyFontStyle.copyWith(
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      )
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: defaultMargin,
                vertical: 30,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      print("Back");
                    },
                    child: Image.asset(
                      "assets/btn_back.png",
                      width: 40,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isSelected ? isSelected = false : isSelected = true;
                      });
                    },
                    child: Image.asset(
                      isSelected
                          ? "assets/btn_wishlist_select.png"
                          : "assets/btn_wishlist.png",
                      width: 40,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
