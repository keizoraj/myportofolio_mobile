import 'package:flutter_test/flutter_test.dart';
import 'package:myportofolio_mobile/main.dart';

void main() {
  testWidgets('MyPortfolio homepage smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Memeriksa judul halaman
    expect(find.text('MyPortfolio'), findsOneWidget);

    // Memeriksa informasi pemilik portofolio
    expect(find.text('2506597510'), findsOneWidget);
    expect(find.text('Keizora Jelita Wohingati'), findsOneWidget);
    expect(find.text('PBP A'), findsOneWidget);

    // Memeriksa tombol menu
    expect(find.text('Lihat Proyek'), findsOneWidget);
    expect(find.text('Tambah Proyek'), findsOneWidget);
    expect(find.text('Logout'), findsOneWidget);
  });

  testWidgets('SnackBar appears when menu is pressed', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.text('Lihat Proyek'));
    await tester.pump();

    // Memeriksa pesan SnackBar
    expect(
      find.text('Kamu telah menekan tombol Lihat Proyek!'),
      findsOneWidget,
    );
  });
}
