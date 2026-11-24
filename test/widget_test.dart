import 'package:flutter_test/flutter_test.dart';
import 'package:luxy/main.dart';
void main() {
  testWidgets('Luxy login shows', (tester) async {
    await tester.pumpWidget(const LuxyApp());
    expect(find.text('LUXY'), findsOneWidget);
  });
}
