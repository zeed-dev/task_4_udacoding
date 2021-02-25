import 'package:farm_house/cubit/dictionary_cubit.dart';
import 'package:farm_house/cubit/farm_cubit.dart';
import 'package:farm_house/cubit/news_cubit.dart';
import 'package:farm_house/ui/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => NewsCubit()),
        BlocProvider(create: (_) => FarmCubit()),
        BlocProvider(create: (_) => DictionaryCubit()),
      ],
      child: MaterialApp(
        home: SplashPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
