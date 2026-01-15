import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CounterProvider extends ChangeNotifier{
  int _count = 0;

  int get count => _count;

  CounterProvider(){
    _loadCount();
  }

  Future<void> _loadCount() async{
    final prefs = await SharedPreferences.getInstance();
    _count = prefs.getInt('count') ?? 0;
    notifyListeners();
  }
  Future<void> _saveCount() async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('count', _count);
  }

  void increment(){
    _count++;
    _saveCount();
    notifyListeners();
  }

  void decrement(){
    _count--;
    _saveCount();
    notifyListeners();
  }

  void reset(){
    _count = 0;
    _saveCount();
    notifyListeners();
  }
}