import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/modules/business_module/business_screen.dart';
import 'package:news_app/modules/science_module/science_screen.dart';
import 'package:news_app/modules/settings_module/setting_screen.dart';
import 'package:news_app/modules/sport_module/sport_screen.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

part 'news_app_state.dart';

class NewsAppCubit extends Cubit<NewsAppState> {
  NewsAppCubit() : super(NewsAppInitial());

  static NewsAppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<String> appBarNames = [
    "Business Screen",
    "Sport Screen",
    "Science Screen",
  ];
  List<Widget> screens = const [
    BusinessScreen(),
    SportScreen(),
    ScienceScreen(),
  ];
  List<BottomNavigationBarItem> barItems = const [
    BottomNavigationBarItem(icon: Icon(Icons.business), label: "Business"),
    BottomNavigationBarItem(icon: Icon(Icons.sports), label: "Sport"),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: "Science"),
  ];

  List<dynamic> business = [];
  List<dynamic> sports = [];
  List<dynamic> science = [];

  void changeIndex(int index) {
    currentIndex = index;
    if (index == 1) getSport();
    if (index == 2) getScience();
    emit(NewsAppBottomNav());
  }

  void getBusiness() {
    emit(NewsAppGetBusinessDataLoading());
    DioHelper.getData(
      dataPath: "v2/top-headlines",
      query: {
        "country": "us",
        "category": "business",
        "apiKey": "6f05cd4f7ac740c5975a4881fe4453a7"
      },
    ).then(
      (value) {
        business = value!.data['articles'];
        log("business output : ${business[0]['title']}");
        emit(NewsAppGetBusinessDataSuccessfully());
      },
    ).catchError(
      (error) {
        log(error.toString());
        emit(NewsAppGetBusinessDataError(error.toString()));
      },
    );
  }

  void getSport() {
    emit(NewsAppGetSportDataLoading());
    if (sports.isEmpty) {
      DioHelper.getData(
        dataPath: "v2/top-headlines",
        query: {
          "country": "us",
          "category": "sport",
          "apiKey": "6f05cd4f7ac740c5975a4881fe4453a7"
        },
      ).then(
        (value) {
          sports = value!.data['articles'];
          log("sport output : ${sports[0]['title']}");
          emit(NewsAppGetSportDataSuccessfully());
        },
      ).catchError(
        (error) {
          log(error.toString());
          emit(NewsAppGetSportDataError(error.toString()));
        },
      );
    } else {
      emit(NewsAppGetSportDataSuccessfully());
    }
  }

  void getScience() {
    emit(NewsAppGetScienceDataLoading());
    if (science.isEmpty) {
      DioHelper.getData(
        dataPath: "v2/top-headlines",
        query: {
          "country": "us",
          "category": "science",
          "apiKey": "6f05cd4f7ac740c5975a4881fe4453a7"
        },
      ).then(
        (value) {
          science = value!.data['articles'];
          log("science output : ${science[0]['title']}");
          emit(NewsAppGetScienceDataSuccessfully());
        },
      ).catchError(
        (error) {
          log(error.toString());
          emit(NewsAppGetScienceDataError(error.toString()));
        },
      );
    } else {
      emit(NewsAppGetScienceDataSuccessfully());
    }
  }

  bool isDark = false;

  void changeAppMode() {
    isDark = !isDark;
    emit(NewsAppThemeModeChangedSuccessfully());
  }
}
