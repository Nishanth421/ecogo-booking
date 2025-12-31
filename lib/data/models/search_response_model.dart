class SearchModel {
  String? tui;
  bool? isComplete;
  String? provider;
  String? providers;
  PostSearchResult? searchResult;
  Status? status;

  SearchModel({
    this.tui,
    this.isComplete,
    this.provider,
    this.providers,
    this.searchResult,
    this.status,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    return SearchModel(
      tui: json['Tui'],
      isComplete: json['isComplete'],
      provider: json['provider'],
      providers: json['providers'],
      searchResult: json['searchResult'] != null
          ? PostSearchResult.fromJson(json['searchResult'])
          : null,
      status: json['status'] != null ? Status.fromJson(json['status']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Tui': tui,
      'isComplete': isComplete,
      'provider': provider,
      'providers': providers,
      if (searchResult != null) 'searchResult': searchResult!.toJson(),
      if (status != null) 'status': status!.toJson(),
    };
  }
}

class PostSearchResult {
  TripInfos? tripInfos;

  PostSearchResult({this.tripInfos});

  factory PostSearchResult.fromJson(Map<String, dynamic> json) {
    return PostSearchResult(
      tripInfos: json['tripInfos'] != null
          ? TripInfos.fromJson(json['tripInfos'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (tripInfos != null) 'tripInfos': tripInfos!.toJson(),
    };
  }
}

class TripInfos {
  List<ONWARD>? onward;

  TripInfos({this.onward});

  factory TripInfos.fromJson(Map<String, dynamic> json) {
    return TripInfos(
      onward: json['ONWARD'] != null
          ? (json['ONWARD'] as List)
          .map((v) => ONWARD.fromJson(v as Map<String, dynamic>))
          .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (onward != null) 'ONWARD': onward!.map((v) => v.toJson()).toList(),
    };
  }
}

class ONWARD {
  List<SegmentInformation>? segmentInformation;
  String? airFlowType;
  String? provider;
  List<TotalPriceList>? totalPriceList;

  ONWARD({
    this.segmentInformation,
    this.airFlowType,
    this.provider,
    this.totalPriceList,
  });

  factory ONWARD.fromJson(Map<String, dynamic> json) {
    return ONWARD(
      segmentInformation: json['SegmentInformation'] != null
          ? (json['SegmentInformation'] as List)
          .map((v) => SegmentInformation.fromJson(v as Map<String, dynamic>))
          .toList()
          : null,
      airFlowType: json['airFlowType'],
      provider: json['provider'],
      totalPriceList: json['totalPriceList'] != null
          ? (json['totalPriceList'] as List)
          .map((v) => TotalPriceList.fromJson(v as Map<String, dynamic>))
          .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (segmentInformation != null)
        'SegmentInformation': segmentInformation!.map((v) => v.toJson()).toList(),
      'airFlowType': airFlowType,
      'provider': provider,
      if (totalPriceList != null)
        'totalPriceList': totalPriceList!.map((v) => v.toJson()).toList(),
    };
  }
}

class SegmentInformation {
  ArrivalAirport? arrivalAirport;
  String? arrivalTime;
  ArrivalAirport? departureAirport;
  String? departureTime;
  FlightDesignator? flightDesignator;
  bool? isArrivingNextDay;
  MAC? oac;
  int? segmentNumber;
  int? duration;
  String? id;
  bool? isReturnSegment;
  int? stops;

  SegmentInformation({
    this.arrivalAirport,
    this.arrivalTime,
    this.departureAirport,
    this.departureTime,
    this.flightDesignator,
    this.isArrivingNextDay,
    this.oac,
    this.segmentNumber,
    this.duration,
    this.id,
    this.isReturnSegment,
    this.stops,
  });

  factory SegmentInformation.fromJson(Map<String, dynamic> json) {
    return SegmentInformation(
      arrivalAirport: json['ArrivalAirport'] != null
          ? ArrivalAirport.fromJson(json['ArrivalAirport'])
          : null,
      arrivalTime: json['ArrivalTime'],
      departureAirport: json['DepartureAirport'] != null
          ? ArrivalAirport.fromJson(json['DepartureAirport'])
          : null,
      departureTime: json['DepartureTime'],
      flightDesignator: json['FlightDesignator'] != null
          ? FlightDesignator.fromJson(json['FlightDesignator'])
          : null,
      isArrivingNextDay: json['IsArrivingNextDay'],
      oac: json['OAC'] != null ? MAC.fromJson(json['OAC']) : null,
      segmentNumber: json['SegmentNumber'],
      duration: json['duration'],
      id: json['id'],
      isReturnSegment: json['isReturnSegment'],
      stops: json['stops'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (arrivalAirport != null) 'ArrivalAirport': arrivalAirport!.toJson(),
      'ArrivalTime': arrivalTime,
      if (departureAirport != null) 'DepartureAirport': departureAirport!.toJson(),
      'DepartureTime': departureTime,
      if (flightDesignator != null) 'FlightDesignator': flightDesignator!.toJson(),
      'IsArrivingNextDay': isArrivingNextDay,
      if (oac != null) 'OAC': oac!.toJson(),
      'SegmentNumber': segmentNumber,
      'duration': duration,
      'id': id,
      'isReturnSegment': isReturnSegment,
      'stops': stops,
    };
  }
}

class ArrivalAirport {
  String? city;
  String? cityCode;
  String? code;
  String? country;
  String? countryCode;
  String? name;
  String? terminal;

  ArrivalAirport({
    this.city,
    this.cityCode,
    this.code,
    this.country,
    this.countryCode,
    this.name,
    this.terminal,
  });

  factory ArrivalAirport.fromJson(Map<String, dynamic> json) {
    return ArrivalAirport(
      city: json['city'],
      cityCode: json['cityCode'],
      code: json['code'],
      country: json['country'],
      countryCode: json['countryCode'],
      name: json['name'],
      terminal: json['terminal'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'city': city,
      'cityCode': cityCode,
      'code': code,
      'country': country,
      'countryCode': countryCode,
      'name': name,
      'terminal': terminal,
    }..removeWhere((key, value) => value == null);
  }
}

class FlightDesignator {
  String? equipmentType;
  String? flightNumber;
  MAC? mac;

  FlightDesignator({this.equipmentType, this.flightNumber, this.mac});

  factory FlightDesignator.fromJson(Map<String, dynamic> json) {
    return FlightDesignator(
      equipmentType: json['EquipmentType'],
      flightNumber: json['FlightNumber'],
      mac: json['MAC'] != null ? MAC.fromJson(json['MAC']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'EquipmentType': equipmentType,
      'FlightNumber': flightNumber,
      if (mac != null) 'MAC': mac!.toJson(),
    };
  }
}

class MAC {
  String? code;
  bool? isLcc;
  String? name;

  MAC({this.code, this.isLcc, this.name});

  factory MAC.fromJson(Map<String, dynamic> json) {
    return MAC(
      code: json['code'],
      isLcc: json['isLcc'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'isLcc': isLcc,
      'name': name,
    }..removeWhere((key, value) => value == null);
  }
}

class TotalPriceList {
  FareDetail? fareDetail;
  String? priceId;
  String? specialReturnIdentifier;
  TripAdditionalInformation? tripAdditionalInformation;
  String? fareIdentifier;
  bool? icca;

  TotalPriceList({
    this.fareDetail,
    this.priceId,
    this.specialReturnIdentifier,
    this.tripAdditionalInformation,
    this.fareIdentifier,
    this.icca,
  });

  factory TotalPriceList.fromJson(Map<String, dynamic> json) {
    return TotalPriceList(
      fareDetail: json['FareDetail'] != null
          ? FareDetail.fromJson(json['FareDetail'])
          : null,
      priceId: json['PriceId'],
      specialReturnIdentifier: json['SpecialReturnIdentifier'],
      tripAdditionalInformation: json['TripAdditionalInformation'] != null
          ? TripAdditionalInformation.fromJson(json['TripAdditionalInformation'])
          : null,
      fareIdentifier: json['fareIdentifier'],
      icca: json['icca'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (fareDetail != null) 'FareDetail': fareDetail!.toJson(),
      'PriceId': priceId,
      'SpecialReturnIdentifier': specialReturnIdentifier,
      if (tripAdditionalInformation != null)
        'TripAdditionalInformation': tripAdditionalInformation!.toJson(),
      'fareIdentifier': fareIdentifier,
      'icca': icca,
    };
  }
}

class FareDetail {
  ADULT? adult;

  FareDetail({this.adult});

  factory FareDetail.fromJson(Map<String, dynamic> json) {
    return FareDetail(
      adult: json['ADULT'] != null ? ADULT.fromJson(json['ADULT']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (adult != null) 'ADULT': adult!.toJson(),
    };
  }
}

class ADULT {
  AdditionalFareComponents? additionalFareComponents;
  BaggageInformation? baggageInformation;
  String? cabinClass;
  String? classOfBooking;
  String? fareBasis;
  bool? mealIndicator;
  int? refundableType;
  int? seatsRemaining;
  FareComponents? fareComponents;
  String? cb; // from your last ADULT class
  String? ib;

  ADULT({
    this.additionalFareComponents,
    this.baggageInformation,
    this.cabinClass,
    this.classOfBooking,
    this.fareBasis,
    this.mealIndicator,
    this.refundableType,
    this.seatsRemaining,
    this.fareComponents,
    this.cb,
    this.ib,
  });

  factory ADULT.fromJson(Map<String, dynamic> json) {
    return ADULT(
      additionalFareComponents: json['AdditionalFareComponents'] != null
          ? AdditionalFareComponents.fromJson(json['AdditionalFareComponents'])
          : null,
      baggageInformation: json['BaggageInformation'] != null
          ? BaggageInformation.fromJson(json['BaggageInformation'])
          : null,
      cabinClass: json['CabinClass'],
      classOfBooking: json['ClassOfBooking'],
      fareBasis: json['FareBasis'],
      mealIndicator: json['MealIndicator'], // fixed typo: removed space
      refundableType: json['RefundableType'],
      seatsRemaining: json['SeatsRemaining'],
      fareComponents: json['fareComponents'] != null
          ? FareComponents.fromJson(json['fareComponents'])
          : null,
      cb: json['cB'],
      ib: json['iB'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (additionalFareComponents != null)
        'AdditionalFareComponents': additionalFareComponents!.toJson(),
      if (baggageInformation != null)
        'BaggageInformation': baggageInformation!.toJson(),
      'CabinClass': cabinClass,
      'ClassOfBooking': classOfBooking,
      'FareBasis': fareBasis,
      'MealIndicator': mealIndicator,
      'RefundableType': refundableType,
      'SeatsRemaining': seatsRemaining,
      if (fareComponents != null) 'fareComponents': fareComponents!.toJson(),
      'cB': cb,
      'iB': ib,
    }..removeWhere((key, value) => value == null);
  }
}

class AdditionalFareComponents {
  TaxesAndFees? taxesAndFees;

  AdditionalFareComponents({this.taxesAndFees});

  factory AdditionalFareComponents.fromJson(Map<String, dynamic> json) {
    return AdditionalFareComponents(
      taxesAndFees: json['TaxesAndFees'] != null
          ? TaxesAndFees.fromJson(json['TaxesAndFees'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (taxesAndFees != null) 'TaxesAndFees': taxesAndFees!.toJson(),
    };
  }
}

class TaxesAndFees {
  int? airlineGSTComponent;
  int? carrierMiscFee;
  int? fuelSurcharge;
  int? managementFee;
  double? managementFeeTax;
  int? otherCharges;

  TaxesAndFees({
    this.airlineGSTComponent,
    this.carrierMiscFee,
    this.fuelSurcharge,
    this.managementFee,
    this.managementFeeTax,
    this.otherCharges,
  });

  factory TaxesAndFees.fromJson(Map<String, dynamic> json) {
    return TaxesAndFees(
      airlineGSTComponent: json['AirlineGSTComponent'],
      carrierMiscFee: json['CarrierMiscFee'],
      fuelSurcharge: json['FuelSurcharge'],
      managementFee: json['ManagementFee'],
      managementFeeTax: json['ManagementFeeTax']?.toDouble(),
      otherCharges: json['OtherCharges'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'AirlineGSTComponent': airlineGSTComponent,
      'CarrierMiscFee': carrierMiscFee,
      'FuelSurcharge': fuelSurcharge,
      'ManagementFee': managementFee,
      'ManagementFeeTax': managementFeeTax,
      'OtherCharges': otherCharges,
    }..removeWhere((key, value) => value == null);
  }
}

class BaggageInformation {
  String? cabinBaggage;
  String? checkingBaggage;

  BaggageInformation({this.cabinBaggage, this.checkingBaggage});

  factory BaggageInformation.fromJson(Map<String, dynamic> json) {
    return BaggageInformation(
      cabinBaggage: json['CabinBaggage'],
      checkingBaggage: json['CheckingBaggage'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'CabinBaggage': cabinBaggage,
      'CheckingBaggage': checkingBaggage,
    }..removeWhere((key, value) => value == null);
  }
}

class FareComponents {
  int? baseFare;
  double? netFare;
  double? taxesAndFees;
  double? totalFare;

  FareComponents({this.baseFare, this.netFare, this.taxesAndFees, this.totalFare});

  factory FareComponents.fromJson(Map<String, dynamic> json) {
    return FareComponents(
      baseFare: json['BaseFare'],
      netFare: json['NetFare']?.toDouble(),
      taxesAndFees: json['TaxesAndFees']?.toDouble(),
      totalFare: json['TotalFare']?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'BaseFare': baseFare,
      'NetFare': netFare,
      'TaxesAndFees': taxesAndFees,
      'TotalFare': totalFare,
    }..removeWhere((key, value) => value == null);
  }
}

class TripAdditionalInformation {
  TripBaggageInformation? tripBaggageInformation;

  TripAdditionalInformation({this.tripBaggageInformation});

  factory TripAdditionalInformation.fromJson(Map<String, dynamic> json) {
    return TripAdditionalInformation(
      tripBaggageInformation: json['TripBaggageInformation'] != null
          ? TripBaggageInformation.fromJson(json['TripBaggageInformation'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (tripBaggageInformation != null)
        'TripBaggageInformation': tripBaggageInformation!.toJson(),
    };
  }
}

// Critical fix: Instead of hundreds of List<Number> fields, use a Map
class TripBaggageInformation {
  Map<String, List<BaggageAllowance>> allowances = {};

  TripBaggageInformation();

  factory TripBaggageInformation.fromJson(Map<String, dynamic> json) {
    var obj = TripBaggageInformation();
    json.forEach((key, value) {
      if (value is List) {
        obj.allowances[key] = value
            .map((item) => BaggageAllowance.fromJson(item as Map<String, dynamic>))
            .toList();
      }
    });
    return obj;
  }

  Map<String, dynamic> toJson() {
    return allowances.map((key, value) =>
        MapEntry(key, value.map((e) => e.toJson()).toList()));
  }
}

// You need to define what each baggage item looks like
// Adjust this based on actual structure – common fields might be:
class BaggageAllowance {
  String? cB; // cabin baggage
  String? iB; // checked baggage

  BaggageAllowance({this.cB, this.iB});

  factory BaggageAllowance.fromJson(Map<String, dynamic> json) {
    return BaggageAllowance(
      cB: json['cB'],
      iB: json['iB'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'cB': cB,
      'iB': iB,
    }..removeWhere((key, value) => value == null);
  }
}

class Status {
  int? httpStatus;
  bool? success;

  Status({this.httpStatus, this.success});

  factory Status.fromJson(Map<String, dynamic> json) {
    return Status(
      httpStatus: json['httpStatus'],
      success: json['success'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'httpStatus': httpStatus,
      'success': success,
    }..removeWhere((key, value) => value == null);
  }
}