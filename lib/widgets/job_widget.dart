import 'package:animated_list_example/models/job.dart';
import 'package:flutter/material.dart';

class JobWidget extends StatelessWidget {
  const JobWidget({Key? key, required this.job}) : super(key: key);

  final Job job;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 0,
              blurRadius: 2,
              offset: Offset(0, 1),
            ),
          ]),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(children: [
                  Container(
                      width: 60,
                      height: 60,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(job.companyLogo),
                      )),
                  SizedBox(width: 10),
                  Flexible(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(job.title,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500)),
                          SizedBox(
                            height: 5,
                          ),
                          Text(job.address,
                              style: TextStyle(color: Colors.grey[500])),
                        ]),
                  )
                ]),
              ),
              GestureDetector(
                onTap: () {
                  // setState(() {
                  //   job.isMyFav = !job.isMyFav;
                  // });
                },
                child: AnimatedContainer(
                    height: 35,
                    padding: EdgeInsets.all(5),
                    duration: Duration(milliseconds: 300),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: job.isMyFav
                              ? Colors.red.shade100
                              : Colors.grey.shade300,
                        )),
                    child: Center(
                        child: job.isMyFav
                            ? Icon(
                                Icons.favorite,
                                color: Colors.red,
                              )
                            : Icon(
                                Icons.favorite_outline,
                                color: Colors.grey.shade600,
                              ))),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.grey.shade200),
                      child: Text(
                        job.type,
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Color(
                                  int.parse("0xff${job.experienceLevelColor}"))
                              .withAlpha(20)),
                      child: Text(
                        job.experienceLevel,
                        style: TextStyle(
                            color: Color(
                                int.parse("0xff${job.experienceLevelColor}"))),
                      ),
                    )
                  ],
                ),
               /* Text(
                  job.timeAgo,
                  style: TextStyle(color: Colors.grey.shade800, fontSize: 12, overflow: TextOverflow.ellipsis),
                )*/
              ],
            ),
          )
        ],
      ),
    );
  }
}
