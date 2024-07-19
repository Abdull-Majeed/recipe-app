import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 50),
              ),
              Text(
                'Know about us',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, bottom: 15, top: 15),
                child: Text(
                  'We have created a wonderfull reciepe application for you, you can made delicious foody items for your belived loves We have created a wonderfull reciepe application for you, you can made delicious foody items for your belived loves We have created a wonderfull reciepe application for you, you can made delicious foody items for your belived loves We have created a wonderfull reciepe application for you, you can made delicious foody items for your belived loves We have created a wonderfull reciepe application for you, you can made delicious foody items for your belived loves We have created a wonderfull reciepe application for you, you can made delicious foody items for your belived loves',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Center(
                child: Container(
                  width: 320,
                  height: 200,
                  padding: EdgeInsets.all(8),
                  color: Color.fromARGB(255, 184, 182, 182),
                  child: Column(
                    children: [
                      Text(
                        'Our Motive',
                        style: TextStyle(
                            fontSize: 22,
                            color: Color.fromARGB(133, 248, 76, 76)),
                      ),
                        Text(
                          'We have created a wonderfull reciepe application for you, you can made delicious foody items for your belived loves We have created a wonderfull reciepe application for you, you can made delicious foody items for your belived loves ',
                          style: TextStyle(
                              color: const Color.fromARGB(255, 34, 26, 26),
                              fontSize: 16),
                        ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Column(
                children: [
                  Text(
                    'We are available 24/7 for you',
                    style: TextStyle(
                        fontSize: 22, color: Color.fromARGB(255, 252, 108, 108)),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Email: majeedpalli46@gmail.com',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Email: saifullah@gmail.com',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Contact: 03495003512',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
