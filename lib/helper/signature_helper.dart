import 'dart:convert';

import 'package:crypto/crypto.dart';

import '../env/env.dart';

class HmacSignatureGenerator{
  static String generateHmacsignature(
      String endPoint, String method, int timeStamp) {
    String baseurl = Env.instance.domainUrl; //"https://smrtdev.zoondia.org/api/v1";
    var formattedBaseString =
        '$baseurl::API::$endPoint::$method::$timeStamp';
  print("format"+formattedBaseString.toString());
    var  hmacSha1 = Hmac(sha1, Env.instance.signature!.codeUnits);

    final result = base64Encode(
        hmacSha1.convert(formattedBaseString.codeUnits).bytes.sublist(0, 16));

    String generatedSignature = result;
    if (generatedSignature.contains('+')) {
      generatedSignature = generatedSignature.replaceAll('+', '-');
    }
    if (generatedSignature.contains('/')) {
      generatedSignature = generatedSignature.replaceAll('/', '_');
    }

    return generatedSignature;
  }
}