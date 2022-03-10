import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

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

    void evaluateWorkerImageTile(Key key) {}

    testWidgets('find images and text on the page',
        (WidgetTester tester) async {
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

      final Finder workerImageOneTileFinder =
          find.byKey(const Key('workerImageOne'));
      final Finder workerImageOneFinder = find.descendant(
          of: find.byKey(const Key('workerImageOne')),
          matching: find.byType(FadeInImage));
      expect(workerImageOneFinder, findsOneWidget);
      final FadeInImage workerImageOne =
          workerImageOneFinder.evaluate().single.widget as FadeInImage;
      print(workerImageOne.image);
      // expect(find.text('0'), findsOneWidget);
      // Verify the counter starts at 0.
      // final workerImages = find.byType(NetworkImage) as List;
      // print(workerImages);
      // expect(find.byType(NetworkImage), findsNWidgets(2));
      // expect(find.image(FileImage(File(workerOneImage))), findsOneWidget);

      // expect(find.image(FileImage(File(workerTwoImage))), findsOneWidget);

      // Finds the floating action button to tap on.
      // final Finder fab = find.byTooltip('Increment');

      // Emulate a tap on the floating action button.
      // await tester.tap(fab);

      // Trigger a frame.
      // await tester.pumpAndSettle();

      // // Verify the counter increments by 1.
      // expect(find.text('1'), findsOneWidget);
    });
  });
}
