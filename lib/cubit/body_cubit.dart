import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:pract/Carrer/careerbody.dart';
import 'package:pract/aboutuss/aboutusbody.dart';
import 'package:pract/home/homebody.dart';
import 'package:pract/team/teambody.dart';

part 'body_state.dart';

class BodyCubit extends Cubit<BodyInitial> {
  static int numbofelements = 4;

  BodyCubit() : super(BodyInitial(Hombody()));

  //List<Function> a = List.filled(numbofelements, (){});

  List<Function> headerfunction() {
    List<Function> a = List.filled(numbofelements, () {});
    a[0] = () => emit(BodyInitial(Hombody()));
    a[1] = () => emit(BodyInitial(Carrerbody()));

    a[2] = () => emit(BodyInitial(Aboutusbody()));
    a[3] = () => emit(BodyInitial(Teambody()));

    return a;
  }
}
