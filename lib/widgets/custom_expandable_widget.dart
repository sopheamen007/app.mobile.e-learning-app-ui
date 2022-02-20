import 'package:e_learnig_clone/theme/colors.dart';
import 'package:e_learnig_clone/theme/padding.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomExpandableWidget extends StatelessWidget {
  const CustomExpandableWidget({
    Key? key,
    required this.curiculumTitle,
    required this.totalVideoAmount,
    required this.totalVideoRuntime,
    required this.lectures,
  }) : super(key: key);

  final String curiculumTitle;
  final String totalVideoAmount;
  final String totalVideoRuntime;
  final List lectures;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ExpandableNotifier(
      child: Column(
        children: [
          Expandable(
            collapsed: ExpandableButton(
              child: Container(
                width: size.width,
                height: size.width * .21,
                padding: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: textWhite,
                  borderRadius: BorderRadius.circular(22.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 50.0,
                      height: 50.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: primary.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(22.0),
                        boxShadow: [
                          BoxShadow(
                            color: primary.withOpacity(0.5),
                            spreadRadius: 0.0,
                            blurRadius: 6.0,
                            offset: Offset(0, 2),
                          )
                        ],
                      ),
                      child: Icon(
                        CupertinoIcons.play_fill,
                        color: textWhite,
                        size: 20.0,
                      ),
                    ),
                    SizedBox(width: miniSpacer + 5),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          curiculumTitle,
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w700,
                            color: secondary,
                          ),
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          '$totalVideoAmount Lectures - $totalVideoRuntime total length',
                          style: TextStyle(
                            fontSize: 12.0,
                            color: secondary.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
            expanded: ExpandableButton(
              child: Container(
                width: size.width,
                // height: size.width * .9,
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.topCenter,
                decoration: BoxDecoration(
                  color: textWhite,
                  borderRadius: BorderRadius.circular(22.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 50.0,
                          height: 50.0,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: primary.withOpacity(0.7),
                            borderRadius: BorderRadius.circular(22.0),
                            boxShadow: [
                              BoxShadow(
                                color: primary.withOpacity(0.5),
                                spreadRadius: 0.0,
                                blurRadius: 6.0,
                                offset: Offset(0, 2),
                              )
                            ],
                          ),
                          child: Icon(
                            CupertinoIcons.play_fill,
                            color: textWhite,
                            size: 20.0,
                          ),
                        ),
                        SizedBox(width: miniSpacer + 5),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              curiculumTitle,
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w700,
                                color: secondary,
                              ),
                            ),
                            SizedBox(height: 5.0),
                            Text(
                              '$totalVideoAmount Lectures - $totalVideoRuntime total length',
                              style: TextStyle(
                                fontSize: 12.0,
                                color: secondary.withOpacity(0.5),
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                      ],
                    ),
                    SizedBox(height: smallSpacer),
                    Column(
                      children: List.generate(lectures.length, (index) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: appPadding),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    lectures[index]['title'],
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: secondary,
                                    ),
                                  ),
                                  Icon(
                                    CupertinoIcons.play_circle_fill,
                                    color: secondary,
                                    size: 13.0,
                                  ),
                                ],
                              ),
                              SizedBox(height: 5.0),
                              Text(
                                'Runtime: ' + lectures[index]['runtime'],
                                style: TextStyle(
                                  fontSize: 12,
                                  color: grey,
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
