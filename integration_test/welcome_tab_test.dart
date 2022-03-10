import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter/material.dart';

import 'package:wcdonalds_app/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('welcome tab test', () {
    const String workerOneImage =
        'https://testlaunchmynft.mypinata.cloud/ipfs/QmT5mjn82ivmNzykGcyQMmWhudUpvQwGhTQwSRozEj5Tbh/70.png';
    const String workerTwoImage =
        'https://testlaunchmynft.mypinata.cloud/ipfs/QmT5mjn82ivmNzykGcyQMmWhudUpvQwGhTQwSRozEj5Tbh/1525.png';
    const String welcomeImage = 'assets/images/welcome.png';
    const String franchiseOne = 'assets/images/franchise_1.jpeg';
    const String franchiseTwo = 'assets/images/franchise_2.jpeg';

    Future<ImageProvider> evaluateWorkerImageTile(Key key) async {
      final Finder workerImageFinder = find.descendant(
          of: find.byKey(key), matching: find.byType(FadeInImage));
      expect(workerImageFinder, findsOneWidget);

      final FadeInImage workerImage =
          workerImageFinder.evaluate().single.widget as FadeInImage;

      return workerImage.image;
    }

    testWidgets('Test welcome page', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Find welcome image
      expect(find.image(const AssetImage(welcomeImage)), findsOneWidget);

      // Test franchise widget, on tap changes image
      expect(find.image(const AssetImage(franchiseOne)), findsOneWidget);
      final Finder franchiseWidget = find.byKey(const Key('franchiseWidget'));
      await tester.tap(franchiseWidget);
      await tester.pumpAndSettle();
      expect(find.image(const AssetImage(franchiseTwo)), findsOneWidget);

      // Test WorkerImageTiles
      expect(
          await evaluateWorkerImageTile(
            const Key('workerImageOne'),
          ),
          const NetworkImage(workerOneImage));
      expect(
          await evaluateWorkerImageTile(
            const Key('workerImageTwo'),
          ),
          const NetworkImage(workerTwoImage));

      final Finder workerImageOneTileFinder =
          find.byKey(const Key('workerImageOne'));
      await tester.tap(workerImageOneTileFinder);
      await tester.pumpAndSettle();

      expect(
          await evaluateWorkerImageTile(
            const Key('workerImageOne'),
          ),
          isNot(const NetworkImage(workerOneImage)));

      final Finder workerImageTwoTileFinder =
          find.byKey(const Key('workerImageTwo'));
      await tester.tap(workerImageTwoTileFinder);
      await tester.pumpAndSettle();
      expect(
          await evaluateWorkerImageTile(
            const Key('workerImageTwo'),
          ),
          isNot(const NetworkImage(workerTwoImage)));
    });
  });
}
