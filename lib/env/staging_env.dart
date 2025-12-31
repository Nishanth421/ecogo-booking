



import 'env.dart';

class StagingEnv extends Env {
  StagingEnv() : super(domainUrl: 'https://aggbeta.b2bmeta.com');
  @override
  String toString() {
    return 'Staging';
  }
}
