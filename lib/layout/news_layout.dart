import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/news_cubit/news_app_cubit.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsAppCubit()..getBusiness(),
      child: BlocConsumer<NewsAppCubit, NewsAppState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = NewsAppCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(cubit.appBarNames[cubit.currentIndex]),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search_rounded),
                )
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: cubit.barItems,
              currentIndex: cubit.currentIndex,
              onTap: (index) => cubit.changeIndex(index),
            ),
            body: cubit.screens[cubit.currentIndex],
          );
        },
      ),
    );
  }
}