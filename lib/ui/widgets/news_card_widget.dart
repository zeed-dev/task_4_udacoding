part of 'widgets.dart';

class NewsCard extends StatelessWidget {
  final News news;
  final Function onTap;

  NewsCard({
    this.news,
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
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(top: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Image.network(
                baseURL + news.photo,
                height: 110,
                width: 130,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            width: MediaQuery.of(context).size.width - 2 * defaultMargin - 140,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  news.titile,
                  style: blackFontStyle,
                  maxLines: 1,
                  overflow: TextOverflow.clip,
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  news.description,
                  style: greyFontStyle,
                  maxLines: 3,
                  overflow: TextOverflow.clip,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
