import 'package:e_learnig_clone/datas/category_json.dart';
import 'package:e_learnig_clone/theme/colors.dart';
import 'package:e_learnig_clone/theme/padding.dart';
import 'package:e_learnig_clone/widgets/custom_heading.dart';
import 'package:e_learnig_clone/widgets/custom_place_holder.dart';
import 'package:e_learnig_clone/widgets/custom_search_field.dart';
import 'package:e_learnig_clone/widgets/custom_title.dart';
import 'package:flutter/material.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0.0),
        child: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          brightness: Brightness.light,
        ),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(appPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: spacer - 1.0),

          //header
          CustomHeading(
            title: 'Explore',
            subTitle: 'Seek for your preference',
            color: secondary,
          ),
          SizedBox(height: spacer),

          //search
          CustomSearchField(
            hintField: 'Try "Web Design"',
            backgroundColor: textWhite,
          ),
          SizedBox(height: spacer),

          //title
          CustomTitle(title: 'Top Searches', extend: false),
          SizedBox(height: smallSpacer),

          //suggestion
          Wrap(
            spacing: 10.0,
            runSpacing: 10.0,
            children: List.generate(CategoryJson.length, (index) {
              return Container(
                padding: const EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                  top: 10.0,
                  bottom: 10.0,
                ),
                decoration: BoxDecoration(
                  color: primary.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(100.0),
                  boxShadow: [
                    BoxShadow(
                      color: primary.withOpacity(0.5),
                      spreadRadius: 0.0,
                      blurRadius: 6.0,
                      offset: Offset(0, 2),
                    )
                  ],
                ),
                child: Text(
                  CategoryJson[index]['title'],
                  style: TextStyle(
                    color: textWhite,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              );
            }),
          ),
          SizedBox(height: spacer),

          //title
          CustomTitle(title: 'Categories', extend: false),
          SizedBox(height: smallSpacer),

          //list categories
          Column(
            children: List.generate(AllCategories.length, (index) {
              var data = AllCategories[index];
              var getData = data['data'];
              return Padding(
                padding: const EdgeInsets.only(bottom: miniSpacer),
                child: GestureDetector(
                  onTap: () {
                   
                  },
                  child: CunstomPlaceHolder(
                    title: data['title'],
                  ),
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}
