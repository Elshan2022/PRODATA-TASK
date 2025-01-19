abstract class BaseNavigationMethods {
  Future<void> pushNamedReplacement(String routeName, {Object? arguments});
  Future<void> pushNamed(String routeName, {Object? arguments});
  void pop();
}
