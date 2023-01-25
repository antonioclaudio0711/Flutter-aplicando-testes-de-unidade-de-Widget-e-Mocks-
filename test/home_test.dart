import 'package:estilizacao_componentes/components/box_card.dart';
import 'package:estilizacao_componentes/data/bank_http.mocks.dart';
import 'package:estilizacao_componentes/data/bank_inherited.dart';
import 'package:estilizacao_componentes/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

void main() {
  final MockBankHttp httpMock = MockBankHttp();
  testWidgets(
    'My widget has a text "Spent"',
    (tester) async {
      when(httpMock.dolarToReal()).thenAnswer((_) async => ('Êxito'));

      await tester.pumpWidget(
        MaterialApp(
          home: BankInherited(
            child: Home(
              api: httpMock.dolarToReal(),
            ),
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
      when(httpMock.dolarToReal()).thenAnswer((_) async => ('Êxito'));

      await tester.pumpWidget(
        MaterialApp(
          home: BankInherited(
            child: Home(
              api: httpMock.dolarToReal(),
            ),
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
      when(httpMock.dolarToReal()).thenAnswer((_) async => ('Êxito'));

      await tester.pumpWidget(
        MaterialApp(
          home: BankInherited(
            child: Home(
              api: httpMock.dolarToReal(),
            ),
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
      when(httpMock.dolarToReal()).thenAnswer((_) async => ('Êxito'));

      await tester.pumpWidget(
        MaterialApp(
          home: BankInherited(
            child: Home(
              api: httpMock.dolarToReal(),
            ),
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

  group(
    'Deposit actions test',
    () {
      testWidgets(
        'When tap Deposit should upload earned in 10',
        (tester) async {
          when(httpMock.dolarToReal()).thenAnswer((_) async => ('Êxito'));

          await tester.pumpWidget(
            MaterialApp(
              home: BankInherited(
                child: Home(
                  /*Avisar que isso é um teste lá para o elemento-filho Header()*/
                  api: httpMock.dolarToReal(),
                ),
              ),
            ),
          );

          await tester.tap(find.text('Deposit'));
          await tester.tap(find.text('Earned'));

          await tester.pumpAndSettle();

          expect(find.text('\$10.0'), findsOneWidget);
        },
      );
      testWidgets(
        'When tap Deposit should upload available in 10',
        (tester) async {
          when(httpMock.dolarToReal()).thenAnswer((_) async => ('Êxito'));

          await tester.pumpWidget(
            MaterialApp(
              home: BankInherited(
                child: Home(
                  api: httpMock.dolarToReal(),
                ),
              ),
            ),
          );

          await tester.tap(find.text('Deposit'));
          await tester.tap(find.text('Available balance'));

          await tester.pumpAndSettle();

          expect(find.text('\$10.0'), findsOneWidget);
        },
      );
    },
  );

  group(
    'Transfer actions test',
    () {
      testWidgets(
        'When tap Transfer should upload spent in 10',
        (tester) async {
          when(httpMock.dolarToReal()).thenAnswer((_) async => ('Êxito'));

          await tester.pumpWidget(
            MaterialApp(
              home: BankInherited(
                child: Home(
                  api: httpMock.dolarToReal(),
                ),
              ),
            ),
          );

          await tester.tap(find.text('Transfer'));
          await tester.tap(find.text('Spent'));

          await tester.pumpAndSettle();

          expect(find.text('\$10.0'), findsOneWidget);
        },
      );

      testWidgets(
        'When tap Transfer should upload available in -10',
        (tester) async {
          when(httpMock.dolarToReal()).thenAnswer((_) async => ('Êxito'));

          await tester.pumpWidget(
            MaterialApp(
              home: BankInherited(
                child: Home(
                  api: httpMock.dolarToReal(),
                ),
              ),
            ),
          );

          await tester.tap(find.text('Transfer'));
          await tester.tap(find.text('Available balance'));

          await tester.pumpAndSettle();

          expect(find.text('\$-10.0'), findsOneWidget);
        },
      );
    },
  );
  testWidgets(
    'Testing MockHttp dolarToReal()',
    (tester) async {
      when(httpMock.dolarToReal()).thenAnswer((_) async => ('Êxito'));

      await tester.pumpWidget(
        MaterialApp(
          home: BankInherited(
            child: Home(
              api: httpMock.dolarToReal(),
            ),
          ),
        ),
      );

      verify(httpMock.dolarToReal()).called(9);
    },
  );
}
