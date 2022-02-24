import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialapplication/cubit/states/loginstates.dart';

class logincubit extends Cubit<loginstates> {
  logincubit() : super(initialloginstates());
  static logincubit get(context) => BlocProvider.of(context);

  IconData icon = Icons.visibility;
  bool ispass = false;

  void changevisibilepassword() {
    ispass = !ispass;
    ispass ? icon = Icons.visibility : icon = Icons.visibility_off;
    emit(changepassvisibilitystate());
  }

  void userlogin({
    required String? email,
    required String? password,
  }) {
    emit(loginloadingstate());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!)
        .then((value) {
      print(value.user!.email);
      print(value.user!.uid);
      emit(loginsuccessstate());
    }).catchError((error) {
      print(error.toString());
      emit(loginerrorstate(error: error));
    });
  }
}
