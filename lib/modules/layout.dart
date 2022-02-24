import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialapplication/cubit/cubit.dart';
import 'package:socialapplication/cubit/states/socialstates.dart';

class socialpplayout extends StatelessWidget {
  const socialpplayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<appcubit, appstates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = appcubit.get(context);
          return Scaffold(
            appBar: AppBar(),
            body: cubit.screens[cubit.pageindex],
            bottomNavigationBar: BottomNavigationBar(
                items: cubit.items,
                currentIndex: cubit.pageindex,
                onTap: (index) {
                  cubit.changeindex(index);
                }),
          );
        });
  }
}
