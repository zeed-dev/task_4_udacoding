part of 'pages.dart';

class DictionaryPage extends StatefulWidget {
  final List<Dictionary> dictionary;
  DictionaryPage({this.dictionary});

  @override
  _DictionaryPageState createState() => _DictionaryPageState();
}

class _DictionaryPageState extends State<DictionaryPage> {
  TextEditingController searchController = TextEditingController();
  bool isSearch = true;
  List<Dictionary> filterList = [];
  List<Dictionary> dataList = [];
  String query = "";

  Future<Null> getDataAll({http.Client client}) async {
    client ??= http.Client();

    String url = baseURL + "get_dictionary_all.php";

    var response = await client.get(url);

    final List data = json.decode(response.body);

    // print(data);

    for (var i in data) {
      setState(() {
        dataList.add(Dictionary.fromJson(i));
      });
    }
  }

  void closeKeyboard(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null)
      FocusManager.instance.primaryFocus.unfocus();
  }

  @override
  void initState() {
    super.initState();
    getDataAll();
  }

  _DictionaryPageState() {
    searchController.addListener(() {
      if (searchController.text.isEmpty) {
        setState(() {
          isSearch = false;
          query = "";
        });
      } else {
        setState(() {
          isSearch = true;
          query = searchController.text;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: defaultMargin,
              ),
              Text(
                "Dictionary",
                style: blackFontStyle.copyWith(
                  fontSize: 16,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                margin: EdgeInsets.only(top: 6),
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search",
                    hintStyle: greyFontStyle,
                    icon: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              isSearch
                  ? _seraching()
                  : Column(
                      children: dataList.map(
                        (e) {
                          return DictionaryCard(
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
                        },
                      ).toList(),
                    ),
              SizedBox(
                height: 80,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _seraching() {
    filterList = new List<Dictionary>();

    for (var i = 0; i < dataList.length; i++) {
      var data = dataList[i];
      if (data.title.toLowerCase().contains(query.toLowerCase())) {
        filterList.add(data);
      }
    }
    return filterList.isEmpty
        ? Center(
            child: LottieBuilder.asset(
              "assets/trash.json",
              width: 300,
              height: 300,
            ),
          )
        : Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: filterList.map(
                (e) {
                  return DictionaryCard(
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
                },
              ).toList(),
            ),
          );
  }
}
