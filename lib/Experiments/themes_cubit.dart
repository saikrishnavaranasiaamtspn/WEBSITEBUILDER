import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'themes_state.dart';

class ThemesCubit extends Cubit<ThemesInitial> {
  ThemesCubit() : super(ThemesInitial(Colors.orange , Colors.black));

  void callTeam() => emit(ThemesInitial(Colors.green,Colors.brown));

  void calldarkteam() => emit(ThemesInitial(Colors.grey,Color.fromRGBO(
      229, 192, 162, 1.0)));

}
