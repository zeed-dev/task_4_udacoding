import 'dart:convert';

import 'package:farm_house/cubit/dictionary_cubit.dart';
import 'package:farm_house/cubit/farm_cubit.dart';
import 'package:farm_house/cubit/news_cubit.dart';
import 'package:farm_house/cubit/user_cubit.dart';
import 'package:farm_house/models/models.dart';
import 'package:farm_house/shared/shared.dart';
import 'package:farm_house/ui/widgets/widgets.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

part 'splash_page.dart';
part 'sign_in_page.dart';
part 'sign_up_page.dart';
part 'home_page.dart';
part 'detail_farm.dart';
part 'detail_news_farm.dart';
part 'detail_dictionary.dart';
part 'dictionary_page.dart';
part 'profil_page.dart';
