abstract class loginstates {}

class initialloginstates extends loginstates {}

class loginloadingstate extends loginstates {}

class loginsuccessstate extends loginstates {}

class loginerrorstate extends loginstates {
  final String error;

  loginerrorstate({
    required this.error,
  });
}

class changepassvisibilitystate extends loginstates {}
