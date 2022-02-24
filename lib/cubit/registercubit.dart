import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialapplication/cubit/states/registerstates.dart';

class registercubit extends Cubit<registerstates> {
  registercubit() : super(initialregisterstates());
  static registercubit get(context) => BlocProvider.of(context);
  IconData icon = Icons.visibility;
  bool ispass = false;

  void changevisibilepass() {
    ispass = !ispass;
    ispass ? icon = Icons.visibility : icon = Icons.visibility_off;
    emit(changepassvisibilitystates());
  }

  void registerdata({
    required String? name,
    required String? phone,
    required String? email,
    required String? password,
  }) {
    emit(registerloadingstate());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!)
        .then((value) {
      print(value.user!.email);
      print(value.user!.uid);
      emit(registersuccessstate());
    }).catchError((error) {
      print(error.toString());
      emit(registererrorstate(error: error));
    });
  }
}
