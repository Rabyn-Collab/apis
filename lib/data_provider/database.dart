import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_ex/models/astro.dart';
import 'package:flutter_ex/models/nasa_.dart';
import 'package:flutter_ex/models/rates.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class Data extends ChangeNotifier{

 Future<List<Rates>> getRates() async{
final response = await http.get(Uri.parse('https://www.nrb.org.np/api/forex/v1/rates?from=2021-05-20&to=2021-05-20&per_page=100&page=1'));
 final extractedData = jsonDecode(response.body);

  final  data = extractedData['data']['payload'][0]['rates'] as List;

  return data.map((e) => Rates.fromJson(e)).toList();

 }




  Future<http.Response> getData(String sub){
   return  http.post(Uri.parse('https://aztro.sameerkumar.website/?sign=$sub&day=today'));
  }
List<String> subs = ['scorpio', 'libra', 'leo', 'virgo'];

  Future<List<http.Response>> getDatas(){
   return  Future.wait(subs.map((e) => getData(e)));
  }

  Future<List<Astro>> getAstros() async {
   final response = await getDatas();
   return response.map((e) => Astro.fromJson(jsonDecode(e.body))).toList();

  }





 Future<List<Nasa>> getMars() async{
  final response = await http.get(Uri.parse(
      'https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?api_key=DEMO_KEY&sol=1000'));
  final extractedData = jsonDecode(response.body);

  final  data = extractedData['photos'] as List;

  return data.getRange(0, 100).map((e) => Nasa.fromJson(e)).toList();

 }




}


final rateProvider = FutureProvider.autoDispose((ref) => Data().getRates());
final nasaProvider = FutureProvider.autoDispose((ref) => Data().getMars());
final astroProvider = FutureProvider.autoDispose((ref) => Data().getAstros());
