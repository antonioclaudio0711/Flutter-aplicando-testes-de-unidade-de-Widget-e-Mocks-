import 'package:estilizacao_componentes/components/box_card.dart';
import 'package:estilizacao_componentes/data/bank_inherited.dart';
import 'package:estilizacao_componentes/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
    'My widget has a text "Spent"',
    (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BankInherited(
            child: const Home(),
          ),
        ),
      );

      final spentFinder = find.text('Spent');
      expect(spentFinder, findsOneWidget);
    },
  );

  testWidgets(
    'My widget has a LinearProgressIndicator',
    (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BankInherited(
            child: const Home(),
          ),
        ),
      );

      final linearProgressIndicatorFinder = find.byType(
        LinearProgressIndicator,
      );
      expect(linearProgressIndicatorFinder, findsOneWidget);
    },
  );

  testWidgets(
    'My widget has a key widget "testKey"',
    (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BankInherited(
            child: const Home(),
          ),
        ),
      );

      final keyFinder = find.byKey(
        const Key('testKey'),
      );
      expect(keyFinder, findsOneWidget);
    },
  );

  testWidgets(
    'My widget has 5 BoxCard widgets',
    (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BankInherited(
            child: const Home(),
          ),
        ),
      );

      final boxCardFinder = find.byWidgetPredicate(
        (widget) {
          if (widget is BoxCard) {
            return true;
          } else {
            return false;
          }
        },
      );
      expect(boxCardFinder, findsNWidgets(5));
    },
  );
}
