part of 'pages.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 69,
                ),
                Text(
                  "Sign In",
                  style: blackFontStyle.copyWith(
                    fontSize: 22,
                  ),
                ),
                Text(
                  "Udacoding Farm News",
                  style: greyFontStyle,
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  "Email Address",
                  style: blackFontStyle,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  margin: EdgeInsets.only(top: 6),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Type your username",
                      hintStyle: greyFontStyle,
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  "Password",
                  style: blackFontStyle,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  margin: EdgeInsets.only(top: 6),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Type your password",
                      hintStyle: greyFontStyle,
                    ),
                  ),
                ),
                SizedBox(
                  height: defaultMargin,
                ),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: isLoading
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : RaisedButton(
                          color: blueColor,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(9),
                          ),
                          child: Text(
                            "Sign In",
                            style: whiteFontStyle,
                          ),
                          onPressed: () async {
                            if (!(emailController.text.trim() != "")) {
                              Flushbar(
                                duration: Duration(seconds: 2),
                                flushbarPosition: FlushbarPosition.TOP,
                                backgroundColor: Color(0xFFFF5C83),
                                message: "Email must not be empty",
                              ).show(context);
                            } else if (!(passwordController.text.trim() !=
                                "")) {
                              Flushbar(
                                duration: Duration(seconds: 2),
                                flushbarPosition: FlushbarPosition.TOP,
                                backgroundColor: Color(0xFFFF5C83),
                                message: "Password must not be empty",
                              ).show(context);
                            } else if (passwordController.text.length < 6) {
                              Flushbar(
                                duration: Duration(seconds: 2),
                                flushbarPosition: FlushbarPosition.TOP,
                                backgroundColor: Color(0xFFFF5C83),
                                message: "Password's length min 6 characters",
                              ).show(context);
                            } else {
                              setState(() {
                                isLoading = true;
                              });
                              await context.read<UserCubit>().signIn(
                                    emailController.text,
                                    passwordController.text,
                                  );

                              UserState state = context.read<UserCubit>().state;

                              if (state is UserLoaded) {
                                context.read<NewsCubit>().getNews();
                                context.read<FarmCubit>().getFarm();
                                context.read<DictionaryCubit>().getDataLimit();
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MainPage()),
                                );
                              } else {
                                setState(() {
                                  isLoading = false;
                                });
                                Flushbar(
                                  duration: Duration(seconds: 2),
                                  flushbarPosition: FlushbarPosition.TOP,
                                  backgroundColor: Color(0xFFFF5C83),
                                  message:
                                      "Email or password is not registered",
                                ).show(context);
                              }
                            }
                          },
                        ),
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: RaisedButton(
                    color: greyColor,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                    child: Text(
                      "Create New Account",
                      style: whiteFontStyle,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpPage(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
