import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onboarding/onboarding.dart';
import 'package:socialapplication/cubit/cubit.dart';
import 'package:socialapplication/cubit/states/loginstates.dart';
import 'package:socialapplication/cubit/states/socialstates.dart';
import 'package:socialapplication/modules/home.dart';
import 'package:socialapplication/modules/login.dart';
import 'package:socialapplication/modules/onboarding.dart';
import 'package:socialapplication/share/component.dart';
import 'package:socialapplication/share/sharedpreference.dart';

import 'cubit/logincubit.dart';
import 'cubit/registercubit.dart';

void main() async {
  // بيتأكد ان كل حاجه هنا في الميثود خلصت و بعدين يتفح الابلكيشن
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await CacheHelper.init();
  String? uid = CacheHelper.getData(key: 'uid');
  bool? onboard = CacheHelper.getData(key: 'onboad');
  bool? isdark = CacheHelper.getData(key: 'isdark');
  Widget? widget;
  if (onboarding != null) {
    if (uid != null) {
      widget = home();
    } else {
      widget = loginpagee();
    }
  } else {
    widget = onboarding();
  }

  runApp(socialapp(
    isdark: isdark,
    firstwidget: widget,
  ));
}

class socialapp extends StatelessWidget {
  String? uid;
  Widget? firstwidget;
  bool? isdark;
  socialapp({this.firstwidget, this.isdark, this.uid});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => appcubit(),
        ),
        BlocProvider(create: (context) => logincubit()),
        BlocProvider(create: (context) => registercubit()),
      ],
      child: BlocConsumer<appcubit, appstates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            home: AnimatedSplashScreen(
                duration: 3000,
                splash: Icons.home,
                nextScreen: firstwidget!,
                splashTransition: SplashTransition.fadeTransition,
                curve: Curves.bounceIn,
                backgroundColor: Colors.blue),
          );
        },
      ),
    );
  }
}
