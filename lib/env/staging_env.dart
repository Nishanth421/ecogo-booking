



import 'env.dart';

class StagingEnv extends Env {
  StagingEnv() : super(domainUrl: '');
  @override
  String toString() {
    return 'Staging';
  }
}
