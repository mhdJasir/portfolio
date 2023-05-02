import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/bloc/landing_cubit.dart';
import 'package:portfolio/helpers/theme_helper.dart';
import 'package:portfolio/pages/landing_page/landing_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => LandingCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Portfolio',
        theme: ThemeHelper().theme,
        home: const LandingPage(),
      ),
    );
  }
}
