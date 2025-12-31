



import 'env.dart';

class DevelopmentEnv extends Env {
  DevelopmentEnv() : super(domainUrl: 'https://smrtdev.zoondia.org/');
  @override
  String toString() {
    return 'Development';
  }
}
