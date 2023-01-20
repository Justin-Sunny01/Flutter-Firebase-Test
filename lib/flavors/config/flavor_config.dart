import 'build_flavor.dart';

/// Initialise and assign values to each specific flavor here
/// Current flavors [dev, prod]
class FlavorConfig {
  static final FlavorConfig _obj = FlavorConfig._internal();

  static FlavorConfig get instance => _obj;

  //flavor variables
  BuildFlavor? buildFlavor;

  String? baseUrl;
  String? appName;
  String? appStoreId;
  String? dynamicLink;
  String? packageName;
  String? fcmKey;

  factory FlavorConfig() {
    return _obj;
  }

  FlavorConfig._internal();

  Future<void> setupFlavor({required BuildFlavor flavorConfig}) async {
    switch (flavorConfig) {
      case BuildFlavor.dev:
        {
          buildFlavor = BuildFlavor.dev;
          // baseUrl = '';
          appName = "Dev Flutter Firebase";
          packageName = 'com.example.flutter_firebase_test_app.dev';
          // dynamicLink = '';
          // appStoreId = '';
          // fcmKey = '';
        }
        break;
      case BuildFlavor.prod:
        {
          buildFlavor = BuildFlavor.prod;
          // baseUrl = '';
          appName = "Flutter Firebase";
          packageName = 'com.example.flutter_firebase_test_app';
          // dynamicLink = '';
          // appStoreId = '';
          // fcmKey = "";
        }
        break;
    }
  }
}
