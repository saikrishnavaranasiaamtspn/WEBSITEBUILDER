import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pract/Experiments/themes_cubit.dart';
import 'package:pract/styles/boxdec.dart';

import '../cubit/body_cubit.dart';
import 'loggin.dart';

class auto extends StatefulWidget {
  const auto({Key? key}) : super(key: key);

  @override
  _autoState createState() => _autoState();
}

class _autoState extends State<auto> {
  bool _value = false;
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.red,
      appBar: AppBar(
          title: Text('Theme $counter'),
          leading: Switch(
            onChanged: (bool value) {
              setState(() {
                ++counter;
                _value = value;
                (_value == false)
                    ? BlocProvider.of<ThemesCubit>(context).callTeam()
                    : BlocProvider.of<ThemesCubit>(context).calldarkteam();
              });
            },
            value: _value,
          )),

      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
          "saikrishna themes",
          style: TextStyle(fontSize: 24),
        ),

            Container(
              decoration: Boxdec.homepagecontainerdec(),
              height: 200,
              width: 200,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => loggin()));
        },
      ),
    );
  }
}
