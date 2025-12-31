class PostSearchModel {
  final bool isComplete;
  final String p;
  final String provider;
  final SearchResult searchResult;
  final Status status;

  PostSearchModel({
    required this.isComplete,
    required this.p,
    required this.provider,
    required this.searchResult,
    required this.status,
  });

  factory PostSearchModel.fromJson(Map<String, dynamic> json) {
    return PostSearchModel(
      isComplete: json['isComplete'] ?? false,
      p: json['p'] ?? '',
      provider: json['provider'] ?? '',
      searchResult: SearchResult.fromJson(json['searchResult'] ?? {}),
      status: Status.fromJson(json['status'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'isComplete': isComplete,
      'p': p,
      'provider': provider,
      'searchResult': searchResult.toJson(),
      'status': status.toJson(),
    };
  }
}

class SearchResult {
  final TripInfos tripInfos;

  SearchResult({required this.tripInfos});

  factory SearchResult.fromJson(Map<String, dynamic> json) {
    return SearchResult(
      tripInfos: TripInfos.fromJson(json['tripInfos'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tripInfos': tripInfos.toJson(),
    };
  }
}

class TripInfos {
  final List<dynamic> onward;

  TripInfos({required this.onward});

  factory TripInfos.fromJson(Map<String, dynamic> json) {
    return TripInfos(
      onward: json['ONWARD'] ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ONWARD': onward,
    };
  }
}

class Status {
  final int httpStatus;
  final String message;
  final bool success;

  Status({
    required this.httpStatus,
    required this.message,
    required this.success,
  });

  factory Status.fromJson(Map<String, dynamic> json) {
    return Status(
      httpStatus: json['httpStatus'] ?? 0,
      message: json['message'] ?? '',
      success: json['success'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'httpStatus': httpStatus,
      'message': message,
      'success': success,
    };
  }
}
