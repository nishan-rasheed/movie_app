

import 'dart:convert';

import 'package:http/http.dart';
import 'package:movie_app/model/cast_model.dart';
import 'package:http/http.dart' as http;

class CastService{
   List<CastModel> cast = [];
   Future<List<CastModel>> getCast(String numb)async{
    final url ='https://api.tvmaze.com/shows/$numb/cast';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final List castList = jsonDecode(response.body);
      cast = castList.map((e) => CastModel.fromJson(e)).toList();
    }
    return cast;
   }
}