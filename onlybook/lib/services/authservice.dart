import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthService {
  Dio dio = Dio();

  login(email, password) async {
    try {
      return await dio.post('https://onlybooksnew.herokuapp.com/authenticate',
          data: {"email": email, "password": password},
          options: Options(contentType: Headers.formUrlEncodedContentType));
    } on DioError catch (e) {
      print(e.response?.data['msg']);
    }
  }

  addUser(email, password) async{
   try {
      return await dio.post('https://onlybooksnew.herokuapp.com/adduser',
          data: {"email": email, "password": password},
          options: Options(contentType: Headers.formUrlEncodedContentType));
    } on DioError catch (e) {
      print(e.response?.data['msg']);
    }
  }
}