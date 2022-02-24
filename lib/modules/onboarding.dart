import 'package:flutter/material.dart';

import 'package:socialapplication/modules/login.dart';

import '../share/component.dart';
import '../share/sharedpreference.dart';

class onboardingmodel {
  String? image;
  String? title;
  String? body;

  onboardingmodel({
    this.image,
    this.body,
    this.title,
  });
}

class onboarding extends StatefulWidget {
  onboarding({Key? key}) : super(key: key);

  @override
  State<onboarding> createState() => _onboardingState();
}

class _onboardingState extends State<onboarding> {
  List<onboardingmodel> model = [
    onboardingmodel(
      image:
          'https://cdn.pixabay.com/photo/2020/05/18/16/17/social-media-5187243__340.png',
      title: 'onboarding',
      body: 'contact with other and have your opportunityu ',
    ),
    onboardingmodel(
      image:
          'https://akm-img-a-in.tosshub.com/businesstoday/images/story/201907/bt_24_25_660_072319045145.jpg',
      title: 'onboarding',
      body: 'make a relationship with other ',
    ),
    onboardingmodel(
      image:
          'https://www.pngitem.com/pimgs/m/500-5004833_side-img-people-chatting-on-social-media-hd.png',
      title: 'onboarding',
      body: 'need context here',
    )
  ];
  void submit() {
    CacheHelper.saveData(
      key: 'onBoarding',
      value: true,
    ).then((value) {
      if (value) {
        navigateAndFinish(
          context,
          loginpagee(),
        );
      }
    });
  }

  var boardController = PageController();

  int pageindex = 0;
  bool isthird = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        PageView.builder(
          itemBuilder: (context, index) => buildonboardingitems(model[index]),
          controller: boardController,
          physics: const BouncingScrollPhysics(),
          onPageChanged: (int value) {
            if (value == model.length - 1) {
              setState(() {
                isthird = true;
              });
            }
            setState(() {
              isthird = false;
            });
          },
          scrollDirection: Axis.horizontal,
        ),
        Row(
          children: [
            /*
            SmoothPageIndicator(
                effect: const ExpandingDotsEffect(
                  dotColor: Colors.grey,
                  activeDotColor: Colors.deepOrange,
                  dotWidth: 10,
                  dotHeight: 10,
                  spacing: 5,
                  expansionFactor: 4,
                ),
                controller: boardController,
                count: model.length),
            Spacer(),
            */
            FloatingActionButton(
                onPressed: () {
                  if (isthird) {
                    submit();
                  } else {
                    boardController.nextPage(
                        duration: const Duration(milliseconds: 750),
                        curve: Curves.fastLinearToSlowEaseIn);
                  }
                },
                child: const Icon(Icons.arrow_forward_ios_outlined)),
          ],
        )
      ],
    ));
  }

  Widget buildonboardingitems(onboardingmodel model) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(image: NetworkImage('${model.image}')),
          const SizedBox(
            height: 12.0,
          ),
          Text(
            '${model.title}',
            style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 12.0,
          ),
          Text(
            '${model.body}',
            style: const TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      );
}
