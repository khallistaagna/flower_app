import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends ValueNotifier<bool> {
  AuthController._() : super(false);

  static final AuthController instance = AuthController._();

  static const _prefsKey = 'flowee_is_logged_in';

  // dipanggil sekali saat aplikasi baru dibbuka 
  // untuk membaca status login yang tersimpan dari sesi sebelumnya
  Future<void> loadPersistedSession() async{
    final prefs = await SharedPreferences.getInstance();
    value = prefs.getBool(_prefsKey) ?? false;
  }

  Future<void> login() async { // SharedPreferences itu menyimpan sesuatu ke lokal sirage 
    value = true;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_prefsKey, true);
  }
  
  Future<void> logout() async{
    value = false;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_prefsKey, false);
  }
}