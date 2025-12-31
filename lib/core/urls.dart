import '../env/env.dart';

class Urls {
  static String fetchAIContent = "ai-content";

  static var apiUrl = '${Env.instance.domainUrl}api/v1/';

  static const String voltageList = 'app/chiller/voltage/list';
  static const String chillerList = 'app/chiller/list';
  static const String chillerDetail = 'app/chiller/details';
  static const String orderValidate = 'app/order/validate';
  static const String userValidate = 'app/order/user/validate';
  static const String summeryDetail = 'app/order/summary';
  static const String infoDetail = 'app/order/summary/info';
  static const String sendEmail = 'app/order/pdf/send-mail';
  static const String chillerSizeList = 'app/chiller/size/list';
}
