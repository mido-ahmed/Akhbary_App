import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news_layout.dart';
import 'package:news_app/shared/network/local/cache_helper.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';
import 'package:news_app/shared/news_cubit/news_app_cubit.dart';
import 'package:news_app/shared/styles/bloc_observer.dart';
import 'package:news_app/shared/theme/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init().then((value) {
    bool? isDark = CacheHelper.getBooleanData(key: 'isDark');
    NewsAppCubit.isDark = isDark ?? false;
    runApp(const MyApp());
  });
  Bloc.observer = MyBlocObserver();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NewsAppCubit()..getBusiness())
      ],
      child: BlocConsumer<NewsAppCubit, NewsAppState>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'News App',
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: NewsAppCubit.isDark ? ThemeMode.dark : ThemeMode.light,
            home: const NewsLayout(),
          );
        },
      ),
    );
  }
}
