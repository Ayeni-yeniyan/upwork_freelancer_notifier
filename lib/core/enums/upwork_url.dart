import 'package:notifyme/core/app_strings.dart';

enum UpworkUrl {
  bestMatch(title: 'Best Match', url: AppStrings.upworkBestMatch),
  recent(title: 'Recent Feed', url: AppStrings.upworkRecent),
  upworkFeed(title: 'Upwork Feed', url: AppStrings.upworkFeed),
  ;

  final String title, url;
  const UpworkUrl({
    required this.title,
    required this.url,
  });
}
