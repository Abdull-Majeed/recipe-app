import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    AppBar(
      title: Text("Chief's kitchen"),
      backgroundColor: Colors.white,
    );
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Text(
            "This is recipe of Biryani In this course, you will learn that there are many ways to approach a problem.Example 9 illustrates three common approaches.A numerical approach: Construct and use a table.A graphical approach: Draw and use a graph.An algebraic approach: Use the rules of algebra.",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
          ),
        ),
      ),
    );
  }
  firstList() {
    return Container(
    child: Text('List One'),
    );
}
  secondList() {
    return Container(
      child: Text('List Two'),
    );
  }
  thirdList() {
    return Container(
      child: Text('List Three'),
    );
  }
  fourList() {
    return Container(
      child: Text('List Four'),
    );
  }
  fiveList() {
    return Container(
      child: Text('List five'),
    );
  }
  sixList() {
    return Container(
      child: Text('List six'),
    );
  }
  sevenList() {
    return Container(
      child: Text('List seven'),
    );
  }
}
