part of 'pages.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedPage;
  PageController pageController;
  SharedPreferences sharedPreferences;
  String name;
  String email;

  @override
  void initState() {
    super.initState();
    getDataPref();
    selectedPage = 0;
    pageController = PageController(initialPage: 0);
  }

  getDataPref() async {
    sharedPreferences = await SharedPreferences.getInstance();
    name = sharedPreferences.getString("name");
    email = sharedPreferences.getString("email");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: PageView(
              controller: pageController,
              onPageChanged: (index) {
                setState(() {
                  selectedPage = index;
                });
              },
              children: [
                HomePage(),
                DictionaryPage(),
                ProfilPage(
                  name: name,
                  email: email,
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: CustomBottomNavBar(
              onTap: (index) {
                setState(() {
                  selectedPage = index;
                  pageController.jumpToPage(selectedPage);
                });
              },
              selectedIndex: selectedPage,
            ),
          )
        ],
      ),
    );
  }
}
