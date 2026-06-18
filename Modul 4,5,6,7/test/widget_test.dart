import 'package:flutter_test/flutter_test.dart';

import 'package:modul_flutter/main.dart';

void main() {
  testWidgets('Home page shows menu and form button', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const KafeNusantaraApp());

    expect(find.text('Kafe Nusantara'), findsOneWidget);
    expect(find.text('Menu Favorit Hari Ini'), findsOneWidget);
    expect(find.text('Nasi Goreng Rempah'), findsOneWidget);
    expect(find.text('Form Pesan'), findsOneWidget);
  });
}
