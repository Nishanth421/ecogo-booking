
import '../models/post_search_response.dart';
import '../models/search_response_model.dart';



abstract class DashBoardRepository {
  Future<SearchModel?> getSearchFlight({required String tuiId});
  Future<PostSearchModel?>postSearchFlight({required String tuiId,required String date});
}
