import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forgotten_mines/Controller/Const/components.dart';
import 'package:forgotten_mines/Model/news_model.dart';
import 'package:forgotten_mines/View/Screens/details_screens.dart';

class NewsItem extends StatelessWidget {
 final Articles articles;
  const NewsItem({ Key? key,required this.articles}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navigateTo(context, NewsDtails(articles: articles,));
      },
      child: Column(
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.network(
              articles.urlToImage,
              width: 130.w,
              height: 150.h,
              fit: BoxFit.fill,
              errorBuilder: (context, error, stackTrace) => Center(
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset(
                    "assets/images/cover.jpeg",
                    width: 130.w,
                    height: 150.h,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Text(
            articles.title,
            style: TextStyle(
              fontSize: 12.sp,
             overflow: TextOverflow.ellipsis
            ),
          ),
          Text(
            articles.publishedAt,
            style: TextStyle(
              fontSize: 10.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
