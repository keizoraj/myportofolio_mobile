import 'package:flutter_test/flutter_test.dart';
import 'package:myportofolio_mobile/main.dart';
import 'package:myportofolio_mobile/services/api_client.dart';
import 'package:myportofolio_mobile/services/auth_state.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('MyPortfolio homepage smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          Provider<ApiClient>(create: (_) => ApiClient()),
          ChangeNotifierProvider<AuthState>(
            create: (context) => AuthState(context.read<ApiClient>()),
          ),
        ],
        child: const MyApp(),
      ),
    );

    // Memeriksa judul halaman
    expect(find.text('MyPortfolio'), findsOneWidget);

    // Memeriksa informasi pemilik portofolio
    expect(find.text('2506597510'), findsOneWidget);
    expect(find.text('Keizora Jelita Wohingati'), findsOneWidget);
    expect(find.text('PBP A'), findsOneWidget);

    // Memeriksa tombol menu
    expect(find.text('Lihat Proyek'), findsOneWidget);
    expect(find.text('Tambah Proyek'), findsOneWidget);
  });

  testWidgets('SnackBar appears when menu is pressed', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          Provider<ApiClient>(create: (_) => ApiClient()),
          ChangeNotifierProvider<AuthState>(
            create: (context) => AuthState(context.read<ApiClient>()),
          ),
        ],
        child: const MyApp(),
      ),
    );

    await tester.tap(find.text('Lihat Proyek'));
    await tester.pump();

    // Memeriksa pesan SnackBar
    expect(
      find.text('Kamu telah menekan tombol Lihat Proyek!'),
      findsOneWidget,
    );
  });
}
