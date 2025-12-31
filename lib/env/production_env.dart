


import 'env.dart';

class ProductionEnv extends Env {
  ProductionEnv() : super(domainUrl: 'https://www.smartrefrigeration.com/');
  @override
  String toString() {
    return 'Production';
  }
}
