



import 'env.dart';

class DevelopmentEnv extends Env {
  DevelopmentEnv() : super(domainUrl: 'https://aggbeta.b2bmeta.com');
  @override
  String toString() {
    return 'Development';
  }
}
