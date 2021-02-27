part of 'pages.dart';

class ProfilPage extends StatelessWidget {
  final String name;
  final String email;
  ProfilPage({
    this.name,
    this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 37,
              ),
              Padding(
                padding: EdgeInsets.only(left: defaultMargin),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    print("Back");
                  },
                  child: Image.asset(
                    "assets/btn_back.png",
                    width: 40,
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Center(
                child: Stack(
                  children: [
                    Image.asset(
                      "assets/photo.png",
                      width: 150,
                    ),
                    Positioned(
                      top: 110,
                      left: 90,
                      child: IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {},
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  name,
                  style: blackFontStyle.copyWith(
                    fontSize: 20,
                  ),
                ),
              ),
              Center(
                child: Text(
                  email,
                  style: blackFontStyle.copyWith(
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(
                height: 100,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: RaisedButton(
                  color: blueColor,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  child: Text("Logout",
                      style: whiteFontStyle.copyWith(fontSize: 18)),
                  onPressed: () {
                    String email =
                        (context.read<UserCubit>().state as UserLoaded)
                            .user
                            .email;
                    context.read<UserCubit>().signOut(email);
                    signOutPreff();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignInPage(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
