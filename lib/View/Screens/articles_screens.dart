import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forgotten_mines/Controller/News/news_cubit.dart';
import 'package:forgotten_mines/View/Widgets/NewsItem.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => NewsCubit()..getNews(),
        child: BlocConsumer<NewsCubit, NewsState>(
          listener: (context, state) {},
          builder: (context, state) {
            NewsCubit cubit = NewsCubit.get(context);
            return Column(
              children: [
                cubit.newsModel == null
                    ? const Center(
                        child: CircularProgressIndicator(
                        color: Colors.black,
                      ))
                    : Expanded(
                        child: GridView.count(
                            padding: const EdgeInsets.only(top: 20),
                            crossAxisCount: 4,
                            childAspectRatio: 1.4,
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            children: List.generate(
                                cubit.newsModel!.articles!.length,
                                (index) => NewsItem(
                                    articles:
                                        cubit.newsModel!.articles![index]))),
                      )
              ],
            );
          },
        ),
      ),
    );
  }
}
