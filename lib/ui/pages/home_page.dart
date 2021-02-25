part of 'pages.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  int indexDic = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: defaultMargin,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: defaultMargin,
                ),
                child: Text(
                  "Explore Now",
                  style: blackFontStyle.copyWith(
                    fontSize: 24,
                  ),
                ),
              ),
              SizedBox(
                height: 2,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: defaultMargin,
                ),
                child: Text(
                  "Mencari peternakan moderen",
                  style: greyFontStyle.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: defaultMargin,
                ),
                child: Text(
                  "Popular Farm",
                  style: blackFontStyle.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              BlocBuilder<FarmCubit, FarmState>(
                builder: (_, state) => (state is FarmLoaded)
                    ? Container(
                        height: 150,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.farm.length,
                          itemBuilder: (context, index) {
                            return FarmCard(
                              farm: state.farm[index],
                              index: index,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailFarmPage(
                                      farm: state.farm[index],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      )
                    : Center(
                        child: CircularProgressIndicator(),
                      ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: defaultMargin,
                ),
                child: Text(
                  "Farm News",
                  style: blackFontStyle.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              BlocBuilder<NewsCubit, NewsState>(
                builder: (context, state) => (state is NewsLoaded)
                    ? Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: defaultMargin,
                        ),
                        child: Column(
                          children: state.news.map(
                            (e) {
                              index++;
                              return NewsCard(
                                index: index,
                                news: e,
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailNewsPage(
                                        news: e,
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ).toList(),
                        ),
                      )
                    : Center(
                        child: CircularProgressIndicator(),
                      ),
              )
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: defaultMargin,
            ),
            child: Text(
              "Dictionary",
              style: blackFontStyle.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          BlocBuilder<DictionaryCubit, DictionaryState>(
            builder: (_, state) => (state is DictionaryLoaded)
                ? Padding(
                    padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                    child: Column(
                      children: state.dictionary.map((e) {
                        indexDic++;
                        return DictionaryCard(
                          indexDic: indexDic,
                          dictionary: e,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailDictionary(
                                  dictionary: e,
                                ),
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            height: 50,
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(17),
              ),
              color: blueColor,
              elevation: 0,
              child: Text(
                "Go To Dictionary",
                style: whiteFontStyle,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DictionaryPage(),
                  ),
                );
                context.read<DictionaryCubit>().getDataAll();
              },
            ),
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
