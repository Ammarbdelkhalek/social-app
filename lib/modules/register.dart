import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialapplication/cubit/registercubit.dart';
import 'package:socialapplication/cubit/states/registerstates.dart';

class registerpage extends StatelessWidget {
  registerpage({Key? key}) : super(key: key);
  var namecontroller = TextEditingController();
  var phonecontroller = TextEditingController();
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<registercubit, registerstates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = registercubit.get(context);
        return Scaffold(
          body: Column(
            children: [
              const Text(
                'register  ',
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
              ),
              const SizedBox(
                height: 7.0,
              ),
              const Text(
                'register to our system for the news ',
                style: TextStyle(
                  fontSize: 13.0,
                  fontStyle: FontStyle.italic,
                ),
              ),
              TextFormField(
                keyboardType: TextInputType.name,
                controller: emailcontroller,
                decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.person),
                  label: Text('user name '),
                ),
                validator: (value) {
                  if (value == null) {
                    print('the username  must be fill ');
                  }
                },
              ),
              TextFormField(
                keyboardType: TextInputType.phone,
                controller: emailcontroller,
                decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.phone),
                  label: Text('phone'),
                ),
                validator: (value) {
                  if (value == null) {
                    print('the phone must be fill ');
                  }
                },
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
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.lock),
                  prefixIcon: IconButton(
                      onPressed: () {
                        cubit.changevisibilepass();
                      },
                      icon: Icon(cubit.icon)),
                  label: Text('password'),
                ),
                validator: (value) {
                  if (value == null) {
                    print('the email must be fill ');
                  }
                },
              ),
              Container(
                width: double.infinity,
                child: MaterialButton(
                  onPressed: () {
                    cubit.registerdata(
                        name: namecontroller.text,
                        phone: phonecontroller.text,
                        email: emailcontroller.text,
                        password: passwordcontroller.text);
                  },
                  child: const Text('register'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
