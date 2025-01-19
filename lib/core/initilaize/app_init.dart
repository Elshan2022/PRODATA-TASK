import 'package:flutter/services.dart';
import 'package:flutter_prodata_task/presentation/theme/app_colors.dart';

class AppInit {
  static Future<void> init() async {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: AppColors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
  }
}
