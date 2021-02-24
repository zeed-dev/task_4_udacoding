part of 'pages.dart';

class DetailDictionary extends StatefulWidget {
  final Dictionary dictionary;
  DetailDictionary({
    this.dictionary,
  });
  @override
  _DetailDictionaryState createState() => _DetailDictionaryState();
}

class _DetailDictionaryState extends State<DetailDictionary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 37,
              ),
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
              SizedBox(
                height: 15,
              ),
              Text(
                widget.dictionary.title,
                style: blackFontStyle.copyWith(
                  fontSize: 18,
                ),
              ),
              Text(
                widget.dictionary.subtitle,
                style: greyFontStyle,
              ),
              SizedBox(
                height: 23,
              ),
              Text(
                widget.dictionary.description,
                style: greyFontStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
