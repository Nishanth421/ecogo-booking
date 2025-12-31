import 'dart:async';
import 'dart:math';
import 'package:ecogo_booking/ui/screens/search/search_screen.dart';
import 'package:flutter/material.dart';

import '../../core/app_constants.dart';
import '../../data/models/post_search_response.dart';
import '../../data/models/search_response_model.dart';
import '../../data/repository_impl/dashboard_repo_impl.dart';

class DashboardBloc{

  final dashboardRepo = DashBoardRepositoryImpl();

  final StreamController<List<ONWARD?>> _searchController = StreamController<List<ONWARD?>>.broadcast();
  Stream <List<ONWARD?>> get searchStream =>_searchController.stream;

  List<ONWARD?> flightList = [];
  List<ONWARD?> filteredFlightList = [];

  String generateRandomString(int length) {
    const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    final rand = Random();
    return List.generate(length, (index) => chars[rand.nextInt(chars.length)])
        .join();
  }

  Future<bool> postSearchFlight({required String tuiId,required String date})async {
    try{
      var response = await dashboardRepo.postSearchFlight(tuiId: tuiId,date: date);
      print("ppppppp==>${response}");
      if(response?.status.success == true){
        return true;
      }else{
        return false;
      }
    } catch(e){
      print("erorr==>${e}");
      return false;
    }
  }

  Future<SearchModel?> getSearchFlight({required String tuiId})async {
    try{
      var response = await dashboardRepo.getSearchFlight(tuiId: tuiId);
      if(response?.searchResult?.tripInfos?.onward?.isNotEmpty == true){
        flightList = response!.searchResult!.tripInfos!.onward!;
        filteredFlightList = List.from(flightList);
        _searchController.add(filteredFlightList);
      }
      print("ppppppp==>${response}");
    } catch(e){
      print("erorr==>${e}");
    }
  }

  void filterCheapest() {
    filteredFlightList.sort((a, b) {
      final priceA = a?.totalPriceList![0]
          .fareDetail!.adult!.fareComponents!.totalFare!;
      final priceB = b?.totalPriceList![0]
          .fareDetail!.adult!.fareComponents!.totalFare!;
      return priceA!.compareTo(priceB!);
    });

    _searchController.add(filteredFlightList);
  }

  void filterFastest() {
    filteredFlightList.sort((a, b) {
      final durationA = a!.segmentInformation![0].duration!;
      final durationB = b!.segmentInformation![0].duration!;
      return durationA.compareTo(durationB);
    });

    _searchController.add(filteredFlightList);
  }

  void filterRecommended() {
    filteredFlightList.sort((a, b) {
      final priceA = a!.totalPriceList![0]
          .fareDetail!.adult!.fareComponents!.totalFare!;
      final durationA = a!.segmentInformation![0].duration!;

      final priceB = b!.totalPriceList![0]
          .fareDetail!.adult!.fareComponents!.totalFare!;
      final durationB = b.segmentInformation![0].duration!;

      final scoreA = priceA + durationA;
      final scoreB = priceB + durationB;

      return scoreA.compareTo(scoreB);
    });

    _searchController.add(filteredFlightList);
  }
}