import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:bloc/bloc.dart';

part 'theme.dart';

// String baseURL = "http://192.168.1.8/farm-house-service/";
String baseURL = "http://farmwebserver.000webhostapp.com/";

saveDataPref({
  int value,
  String name,
  String email,
}) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sharedPreferences.setInt("value", value);
  sharedPreferences.setString("name", name);
  sharedPreferences.setString("email", email);
}

signOutPreff() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sharedPreferences.clear();
}

// getDataPref(context) async {
//   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//   int value = sharedPreferences.getInt("value");
// }
