import 'package:app/domain/services/database_services/account_service.dart';
import 'package:app/domain/services/locator.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  test('Counter value should be incremented', () {
    final ser = locator<AccountDatabaseService>();
    expect(ser != null, ser);
  });
}
