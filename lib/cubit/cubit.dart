import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hmnews/Modules/science/science_screen.dart';
import 'package:hmnews/Modules/sports/sport_screen.dart';
import 'package:hmnews/cubit/states.dart';
import 'package:hmnews/network/remote/dio_helper.dart';
import '../Modules/Crypto/crypto.dart';
import '../Modules/Hacker/hacker.dart';
class newsCubit extends Cubit<newsStates> {
  newsCubit() : super(NewsInitialStates());

  static newsCubit get(context) => BlocProvider.of(context);
  int indexItems = 0;
  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.sports_soccer),
      label: 'sports',
    ),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: 'science'),
    BottomNavigationBarItem(
        icon: Icon(Icons.crisis_alert_outlined), label: 'hacker'),
    BottomNavigationBarItem(
        icon: Icon(Icons.currency_bitcoin), label: 'crypto'),
  ];

  List<Widget> lscreens = [
    sport_screen(),
    science_screen(),
    hacker_screen(),
    crypto_screen(),
  ];

  void changeBottomNavigationBarItem(int index) {
    indexItems = index;
    emit(ChangeBottomNavigationBarItemStates());
  }


  List<dynamic> sports = [];
  void getSports() {
    emit(NewsGetSportsLoadingStates());
    if (sports.length == 0) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'ma',
          'category': 'sport',
          'apikey': '007a9d5f195a4a679619b875c278c61e',
        },
      ).then((value) {
        sports = value.data['articles'];
        emit(NewsGetSportsSuccessStates());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetSportsErrorStates(error.toString()));
      });
    } else {
      emit(NewsGetSportsSuccessStates());
    }
  }

  List<dynamic> science = [];

  void getScience() {
    emit(NewsGetScienceLoadingStates());
    if (science.length == 0) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'ma',
          'category': 'science',
          'apikey': '007a9d5f195a4a679619b875c278c61e',
        },
      ).then((value) {
        science = value.data['articles'];
        emit(NewsGetScienceSuccessStates());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetScienceErrorStates(error.toString()));
      });
    } else {
      emit(NewsGetScienceSuccessStates());
    }
  }

  List<dynamic> hacker = [];

  void getHacker() {
    emit(NewsGetHackersLoadingStates());
    if (hacker.length == 0) {
      DioHelper.getData(
        url: 'v2/everything',
        query: {
          'domains': 'wired.com',
          'apikey': '007a9d5f195a4a679619b875c278c61e',
        },
      ).then((value) {
        hacker = value.data['articles'];
        emit(NewsGetHackersSuccessStates());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetHackersErrorStates(error.toString()));
      });
    } else {
      emit(NewsGetHackersSuccessStates());
    }
  }

  List<dynamic> crypto = [];

  void getCrypto() {
    emit(NewsGetCryptoLoadingStates());
    if (crypto.length == 0) {
      DioHelper.getData(
        url: 'v2/everything',
        query: {
          'domains': 'cointelegraph.com',
          'apikey': '007a9d5f195a4a679619b875c278c61e',
        },
      ).then((value) {
        crypto = value.data['articles'];
        emit(NewsGetCryptoSuccessStates());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetCryptoErrorStates(error.toString()));
      });
    } else {
      emit(NewsGetCryptoSuccessStates());
    }
  }
  List<dynamic> search = [];
  void getSearch(String value) {
    emit(NewsGetSearchLoadingStates());
    search = [];
    DioHelper.getData(
      url: 'v2/everything',
      query: {
        'q': '$value',
        'apikey': '007a9d5f195a4a679619b875c278c61e',
      },
    ).then((value) {
      search = value.data['articles'];
      emit(NewsGetSearchSuccessStates());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetSearchErrorStates(error.toString()));
    });
  }
}