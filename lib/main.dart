import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'animation/fade_animation.dart';
import 'models/job.dart';
import 'widgets/job_widget.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
    debugShowCheckedModeBanner: false,
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> jobList = [];

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/jobs.json');
    final data = await json.decode(response);

    setState(() {
      jobList = data['jobs'].map((data) => Job.fromJson(data)).toList();
    });
  }

  @override
  void initState() {
    super.initState();

    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 20,
        leading: IconButton(
            padding: EdgeInsets.only(left: 20),
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.grey.shade600,
            )),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                iconSize: 30,
                onPressed: () {},
                icon: Icon(
                  Icons.notifications_none,
                  color: Colors.grey.shade400,
                )),
          )
        ],
        title: Container(
          height: 45,
          child: TextField(
            cursorColor: Colors.grey,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              filled: true,
              fillColor: Colors.grey.shade200,
              prefixIcon: Icon(Icons.search, color: Colors.grey),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide.none),
              hintText: "Search e.g Software Developer",
              hintStyle: TextStyle(fontSize: 14),
            ),
          ),
        ),
      ),
      body: Container(
        child: ListView.builder(
            padding: EdgeInsets.all(20),
            itemCount: jobList.length,
            itemBuilder: (context, index) {
              return FadeAnimation(
                  (0.5 + index) / 2, JobWidget(job: jobList[index]));
            }),
      ),
    );
  }
}
