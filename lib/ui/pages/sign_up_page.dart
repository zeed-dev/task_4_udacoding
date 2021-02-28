part of 'pages.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
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
                  "Sign Up",
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
                  "Full Name",
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
                    controller: nameController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Type your name",
                      hintStyle: greyFontStyle,
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
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
                    obscureText: true,
                    controller: passwordController,
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
                            "Sign Up",
                            style: whiteFontStyle,
                          ),
                          onPressed: () async {
                            if (!(nameController.text.trim() != "")) {
                              Flushbar(
                                duration: Duration(seconds: 2),
                                flushbarPosition: FlushbarPosition.TOP,
                                backgroundColor: Color(0xFFFF5C83),
                                message: "Name must not be empty",
                              ).show(context);
                            } else if (!(emailController.text.trim() != "")) {
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
                              await context.read<UserCubit>().signUp(
                                    nameController.text,
                                    emailController.text,
                                    passwordController.text,
                                  );

                              UserState state = context.read<UserCubit>().state;

                              if (state is UserSignUp) {
                                Navigator.pop(context);
                                Flushbar(
                                  duration: Duration(seconds: 2),
                                  flushbarPosition: FlushbarPosition.TOP,
                                  backgroundColor: Colors.green,
                                  message:
                                      "You have successfully registered an account",
                                ).show(context);
                              } else {
                                setState(() {
                                  isLoading = false;
                                });
                                Flushbar(
                                  duration: Duration(seconds: 2),
                                  flushbarPosition: FlushbarPosition.TOP,
                                  backgroundColor: Color(0xFFFF5C83),
                                  message: "Email registered",
                                ).show(context);
                              }
                            }
                          },
                        ),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
