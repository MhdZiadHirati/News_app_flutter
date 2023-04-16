import 'package:flutter/material.dart';
import 'package:news_app/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/business/business_screen.dart';
import 'package:news_app/modules/sports/sports_screen.dart';
import 'package:news_app/shared/constants.dart';
import 'package:news_app/shared/network/local/cache_helper.dart';
import '../modules/science/science_screen.dart';
import '../shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  bool isDarkMode = true;

  List<BottomNavigationBarItem> items = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: 'Business',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: 'Science',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: 'Sports',
    ),
  ];

  List<Widget> screens = [
    const BusinessScreen(),
    const ScienceScreen(),
    const SportsScreen(),
  ];

  void changeIndex(int index) {
    currentIndex = index;
    if (currentIndex == 1) {
      getScience();
    }
    if (currentIndex == 2) {
      getSports();
    }
    emit(NewsBottomNavState());
  }

  void changeThemeMode({bool? fromSharedPre}) {
    if (fromSharedPre != null) {
      isDarkMode = fromSharedPre;

      emit(NewsDarkModeState());
    } else {
      isDarkMode = !isDarkMode;

      CacheHelper.putBool(
              key: 'isDarkModeActivated', isDarkModeActivated: isDarkMode)
          .then((value) {
        emit(NewsDarkModeState());
      });
    }
  }

  List business = [];

  void getBusiness() {
    emit(NewsGetBusinessLoadingState());
    if (business.isEmpty) {
      DioHelper.getData(
        url: 'v1/news',
        query: {
          'access_key': apiKey,
          'categories': 'business',
          'countries': 'us',
        },
      ).then((value) {
        business = value.data['data'];
        emit(NewsGetBusinessSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetBusinessErrorState(error.toString()));
      });
    } else {
      emit(NewsGetBusinessSuccessState());
    }
  }

  List sports = [];

  void getSports() {
    emit(NewsGetSportsLoadingState());
    if (sports.isEmpty) {
      DioHelper.getData(
        url: 'v1/news',
        query: {
          'access_key': apiKey,
          'categories': 'sports',
          'countries': 'us',
        },
      ).then((value) {
        sports = value.data['data'];

        emit(NewsGetSportsSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetSportsErrorState(error.toString()));
      });
    } else {
      emit(NewsGetSportsSuccessState());
    }
  }

  List science = [];

  void getScience() {
    emit(NewsGetScienceLoadingState());
    if (science.isEmpty) {
      DioHelper.getData(
        url: 'v1/news',
        query: {
          'access_key': apiKey,
          'categories': 'science',
          'countries': 'us',
        },
      ).then((value) {
        science = value.data['data'];
        emit(NewsGetScienceSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetScienceErrorState(error.toString()));
      });
    } else {
      emit(NewsGetScienceSuccessState());
    }
  }

  List search = [];

  void getSearch(String keyWord) {
    emit(NewsGetSearchLoadingState());

    search = [];

    DioHelper.getData(
      url: 'v1/news',
      query: {
        'access_key': apiKey,
        'keywords': keyWord,
      },
    ).then((value) {
      search = value.data['data'];
      emit(NewsGetSearchSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetSearchErrorState(error.toString()));
    });
  }
}
