import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialapplication/cubit/states/socialstates.dart';
import 'package:socialapplication/modules/chats.dart';
import 'package:socialapplication/modules/home.dart';
import 'package:socialapplication/modules/new_post.dart';
import 'package:socialapplication/modules/setting.dart';
import 'package:socialapplication/modules/user.dart';

class appcubit extends Cubit<appstates> {
  appcubit() : super(initialappstates());
  static appcubit get(context) => BlocProvider.of(context);
  List<BottomNavigationBarItem> items = [
    const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
    const BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'chat'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.file_upload_outlined), label: 'posts'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.location_pin), label: 'location'),
    const BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'setting'),
  ];
  List<String> title = ['Home', 'chats', 'new post', 'user', 'setting'];
  List screens = [
    home(),
    chats(),
    posts(),
    users(),
    settings(),
  ];
  int pageindex = 0;
  void changeindex(int index) {
    pageindex = index;
    emit(changenavstate());
  }
}
