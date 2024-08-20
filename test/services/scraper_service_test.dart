import 'package:flutter_test/flutter_test.dart';
import 'package:upwork_freelancer_notifier/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('ScraperServiceTest -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
