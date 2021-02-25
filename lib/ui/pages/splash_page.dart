part of 'pages.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              SizedBox(
                height: 50,
              ),
              LottieBuilder.asset(
                "assets/cow.json",
                width: 300,
                height: 300,
              ),
              Text(
                "Farm House",
                style: blueFontStyle.copyWith(
                  fontSize: 30,
                ),
              ),
              Text(
                "Lorem Ipsum is simply dummy\ntext of the printing  typesetting\nindustry.",
                textAlign: TextAlign.center,
                style: greyFontStyle,
              ),
              SizedBox(
                height: 42,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    "Get Started",
                    style: whiteFontStyle,
                  ),
                  color: blueColor,
                  elevation: 0,
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignInPage(),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 30,
              )
            ],
          ),
        ],
      ),
    );
  }
}
