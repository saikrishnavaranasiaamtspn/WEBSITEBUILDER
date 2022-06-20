import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pract/Experiments/testing.dart';

import 'Experiments/themes_cubit.dart';
import 'cubit/body_cubit.dart';
import 'webpage/pageskeleton.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<BodyCubit>(create: (context) => BodyCubit()),
      BlocProvider<ThemesCubit>(create: (context) => ThemesCubit())
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    // ThemesCubit c = BlocProvider.of(context, listen: true);
    return MaterialApp(
        title: 'Saikrishna',
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        debugShowCheckedModeBanner: false,
        home: Home1());
  }
}
