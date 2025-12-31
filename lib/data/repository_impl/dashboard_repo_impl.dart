
import 'package:ecogo_booking/data/models/post_search_response.dart';
import 'package:ecogo_booking/data/models/search_response_model.dart';
import 'package:ecogo_booking/data/repository/dashboard_repo.dart';

import '../../core/urls.dart';
import '../../helper/api_exception.dart';
import '../../helper/dio_client.dart';
import 'package:dio/dio.dart';

class DashBoardRepositoryImpl implements DashBoardRepository{

  final DioClient _dio = DioClient();


  @override
  Future<SearchModel?> getSearchFlight({required String tuiId}) async{
    try{
    var response = await _dio.get("${Urls.apiUrl}${Urls.search}/$tuiId");
    return SearchModel.fromJson(response.data);
  }catch(e){
  throw ApiException(e.toString());
  }
  }

  @override
  Future<PostSearchModel?> postSearchFlight({required String tuiId,required String date})async {
    final body = {
      "ADT": 1,
    "CHD": 0,
    "INF": 0,
    "Cabin": "E",
    "Source": "",
    "Mode": "",
    "ClientID": "",
    "FareType": "",
    "SecType": "",
    "TUI": "",
    "Trips": [{
    "From": "COK",
    "To": "DEL",
    "OnwardDate": date,
    "ReturnDate": "",
    "TUI": ""
  }],
    "Parameters": {
    "IsDirect": false,
    "IsConnecting": false,
    "PaxCategory": "",
    "Refundable": ""
  }
  };
   try{
     var response = await _dio.post("${Urls.apiUrl}${Urls.search}",data: body,
     options:Options(headers: {"X-TUI":tuiId}));
     return PostSearchModel.fromJson(response.data);
   }catch(e){
     throw ApiException(e.toString());
   }
  }
}