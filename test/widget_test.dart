import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:project_mobile/main.dart';

void main() {
  testWidgets('Test halaman utama', (WidgetTester tester) async {
    // Build app
    await tester.pumpWidget(const MyApp());

    // Cek apakah ada menu Beranda
    expect(find.text('Beranda'), findsOneWidget);

    // Cek apakah ada menu List
    expect(find.text('List'), findsOneWidget);

    // Cek apakah ada menu Profile
    expect(find.text('Profile'), findsOneWidget);
  });
}