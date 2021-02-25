part of 'pages.dart';

class DetailFarmPage extends StatefulWidget {
  final Farm farm;
  DetailFarmPage({this.farm});

  @override
  _DetailFarmPageState createState() => _DetailFarmPageState();
}

class _DetailFarmPageState extends State<DetailFarmPage> {
  bool isSeleceted = false;

  _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Image.network(
              baseURL + widget.farm.foto,
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
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.farm.name,
                                style: blackFontStyle.copyWith(
                                  fontSize: 22,
                                ),
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Row(
                                children: [
                                  Text(
                                    widget.farm.cows.toString(),
                                    style: blueFontStyle.copyWith(
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    " Cows",
                                    style: greyFontStyle.copyWith(
                                      fontSize: 16,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Row(
                                children: [1, 2, 3, 4, 5].map(
                                  (index) {
                                    return RatingStar(
                                      index: index,
                                      rate: widget.farm.rate,
                                    );
                                  },
                                ).toList(),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "${widget.farm.rate.toString()}/5",
                                style: greyFontStyle.copyWith(fontSize: 16),
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 49,
                      ),
                      Text(
                        "Location",
                        style: blackFontStyle.copyWith(
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.farm.location,
                                style: greyFontStyle,
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Text(
                                widget.farm.city,
                                style: greyFontStyle,
                              ),
                            ],
                          ),
                          Image.asset(
                            "assets/btn_map.png",
                            width: 44,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        child: RaisedButton(
                          elevation: 0,
                          color: blueColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(17),
                          ),
                          child: Text(
                            "Go To Farm",
                            style: whiteFontStyle.copyWith(
                              fontSize: 18,
                            ),
                          ),
                          onPressed: () {
                            _launchUrl(widget.farm.mapUrl);
                          },
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
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
                        isSeleceted ? isSeleceted = false : isSeleceted = true;
                      });
                    },
                    child: Image.asset(
                      isSeleceted
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
