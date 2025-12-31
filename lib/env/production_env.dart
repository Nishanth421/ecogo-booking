


import 'env.dart';

class ProductionEnv extends Env {
  ProductionEnv() : super(domainUrl: 'https://aggbeta.b2bmeta.com');
  @override
  String toString() {
    return 'Production';
  }
}
