import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pract/styles/text.dart';

import '../cubit/body_cubit.dart';
import '../loginpage/login.dart';
import '../webpage/headerdata.dart';

class appbar extends StatefulWidget {
  const appbar({Key? key}) : super(key: key);

  @override
  _appbarState createState() => _appbarState();
}

class _appbarState extends State<appbar> {
  double _counter = 90;
  int x = 0;

  static int numbofelements = 4;

  List<int> barnumber = List.filled(numbofelements, 0);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    barnumber[0] = 1;
  }

  void _incrementCounter() {
    setState(() {
      (_counter == 90) ? _counter = 300 : _counter = 90;
      //(x==0)?x=3.14/2:x=0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> headeritems = [];

    for (int i = 0; i < numbofelements; i++) {
      headeritems.add(headercontent(Headrerdata.headeritemslist()[i], 20, () {
        BlocProvider.of<BodyCubit>(context).headerfunction()[i]();
        x = 0;
        _incrementCounter();
        print('sai');
        setState(() {
          for (int j = 0; j < numbofelements; j++) {
            if (j == i) {
              barnumber[j] = 1;
            } else {
              barnumber[j] = 0;
            }
          }
        });
      }, barnumber[i]));
    }

    var wid = MediaQuery.of(context).size.width;
    // var abc = BlocProvider.of<BodyCubit>(context).a;
    return (wid < 800)
        ? TweenAnimationBuilder(
            duration: Duration(milliseconds: 90),
            tween: Tween<double>(begin: 90, end: _counter),
            onEnd: () {
              setState(() {
                (_counter == 300) ? x = 1 : x = 0;
              });
            },
            builder: (BuildContext context, double value, Widget? child) {
              return (x == 0)
                  ? Container(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      padding: EdgeInsets.fromLTRB(10, 0, 30, 0),
                      width: wid,
                      height: value,
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Image.asset(
                                Headrerdata.headerlogo,
                                width: 150,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                x = 0;
                                _incrementCounter();
                              },
                              child: Image.asset(
                                Headrerdata.headermenuicon,
                                width: 25,
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  : Container(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      padding: EdgeInsets.fromLTRB(10, 0, 30, 0),
                      width: wid,
                      height: value,
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Image.asset(
                                  Headrerdata.headerlogo,
                                  width: 150,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  x = 0;
                                  _incrementCounter();
                                },
                                child: Image.asset(
                                  Headrerdata.headermenuicon,
                                  width: 25,
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: headeritems,
                          )
                        ],
                      ),
                    );
            },
          )
        : Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            width: wid,
            height: 100,
            padding: EdgeInsets.fromLTRB(30, 0, 50, 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Image.asset(
                    Headrerdata.headerlogo,
                    width: 150,
                  ),
                ),
                Row(
                  children: headeritems,
                )
              ],
            ),
          );
  }

  Widget headercontent(String a, double b, Function() c, int d) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: c,
            child: Text(
              a,
              style: Headrerdata.josefinSanssty(FontWeight.bold, b),
            ),
          ),
          (d == 1)
              ? Container(
                  width: 60,
                  child: Divider(
                    thickness: 2,
                    color: Headrerdata.dividertextcolor,
                    height: 0,
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
