abstract class registerstates {}

class initialregisterstates extends registerstates {}

class registerloadingstate extends registerstates {}

class registersuccessstate extends registerstates {}

class registererrorstate extends registerstates {
  final String error;

  registererrorstate({
    required this.error,
  });
}

class changepassvisibilitystates extends registerstates {}

// for git user credintIAL 