import 'dart:async';
import 'dart:math';
import '../../data/models/search_response_model.dart';
import '../../data/repository_impl/dashboard_repo_impl.dart';
import '../widgets/custom_snakbar.dart';

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
      if(response?.status.success == true){
        return true;
      }else{
        return false;
      }
    } catch(e){
      SnackBarCustom.failure(e.toString());
      return false;
    }
  }

  Future<SearchModel?> getSearchFlight({required String tuiId})async {
    try{
      var response = await dashboardRepo.getSearchFlight(tuiId: tuiId);
      if(response?.searchResult?.tripInfos?.onward?.isNotEmpty == true){
        flightList = response!.searchResult!.tripInfos!.onward!;
        filteredFlightList = List.from(flightList);
        flightFilter(type: "Recommended");
      }
    } catch(e){
      _searchController.sink.addError(e);
    }
  }

   void flightFilter({required String type}){
    switch(type){
      case "Recommended":
        return filterRecommended();
      case "Cheapest":
        return filterCheapest();
      case "Fastest":
        return filterFastest();

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

  bool validation({
    required String from,
    required String to,
    required String date,
  }) {
    if (from.trim().isEmpty) {
      SnackBarCustom.failure("Enter From");
      return false;
    }

    if (to.trim().isEmpty) {
      SnackBarCustom.failure("Enter To");
      return false;
    }
    if (date.trim().isEmpty) {
      SnackBarCustom.failure("Choose date");
      return false;
    }
    return true;
  }
}