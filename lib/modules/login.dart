import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialapplication/cubit/logincubit.dart';
import 'package:socialapplication/cubit/states/loginstates.dart';
import 'package:socialapplication/modules/register.dart';
import 'package:socialapplication/share/component.dart';

class loginpagee extends StatelessWidget {
  loginpagee({Key? key}) : super(key: key);
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<logincubit, loginstates>(
      listener: (context, state) {
        if (state is loginsuccessstate) {
          print(ToastStates.SUCCESS);
        } else {
          print(ToastStates.ERROR);
        }
      },
      builder: (context, state) {
        var cubit = logincubit.get(context);
        return Scaffold(
            body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'welcome  login ',
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
              ),
              const SizedBox(
                height: 7.0,
              ),
              const Text(
                'login to our system for the news ',
                style: TextStyle(
                  fontSize: 13.0,
                  fontStyle: FontStyle.italic,
                ),
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: emailcontroller,
                decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.email),
                  label: Text('email address'),
                ),
                validator: (value) {
                  if (value == null) {
                    print('the email must be fill ');
                  }
                },
              ),
              TextFormField(
                keyboardType: TextInputType.visiblePassword,
                controller: passwordcontroller,
                obscureText: true,
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.lock),
                  prefixIcon: IconButton(
                      onPressed: () {
                        cubit.changevisibilepassword();
                      },
                      icon: Icon(cubit.icon)),
                  label: Text('password'),
                ),
                validator: (value) {
                  if (value == null) {
                    print('the password must be fill ');
                  }
                },
              ),
              Container(
                width: double.infinity,
                child: MaterialButton(
                  onPressed: () {
                    cubit.userlogin(
                        email: emailcontroller.text,
                        password: passwordcontroller.text);
                  },
                  child: Text('login'),
                ),
              ),
              Row(
                children: [
                  const Text('don,t have an account '),
                  const SizedBox(
                    width: 7.0,
                  ),
                  defaultTextButton(
                      function: () {
                        navigateTo(context, registerpage());
                      },
                      text: 'register'),
                ],
              )
            ],
          ),
        ));
      },
    );
  }
}
