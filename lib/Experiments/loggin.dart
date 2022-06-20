import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'themes_cubit.dart';

class loggin extends StatefulWidget {
  const loggin({Key? key}) : super(key: key);

  @override
  _logginState createState() => _logginState();
}

class _logginState extends State<loggin> {
  bool _value = false;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
          title: Text('Theme'),
          leading: Switch(onChanged: (bool value) {
            setState(() {
              _value = value;
              (_value == false)?
              BlocProvider.of<ThemesCubit>(context).callTeam():BlocProvider.of<ThemesCubit>(context).calldarkteam();
            });
          }, value: _value,

          )
      ),

      body: Center(child: Text("loggin" , style: TextStyle(fontSize: 24),) ),
    );
  }
}
