import 'package:estilizacao_componentes/models/bank.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    'BankModel deposit tests',
    () {
      test(
        'BankModel deposit should turn points into 20',
        () {
          final BankModel depositPointsBank = BankModel();
          depositPointsBank.deposit(10);
          expect(depositPointsBank.points, 20);
        },
      );
      test(
        'BankModel deposit should turn available into 100',
        () {
          final BankModel depositAvailableBank = BankModel();
          depositAvailableBank.deposit(10);
          expect(depositAvailableBank.available, 100);
        },
      );

      test(
        'BankModel deposit should turn earned into 10',
        () {
          final BankModel depositEarnedBank = BankModel();
          depositEarnedBank.deposit(10);
          expect(depositEarnedBank.earned, 10);
        },
      );
    },
  );

  group(
    'BankModel transfer tests',
    () {
      test(
        'BankModel transfer should turn points into 10',
        () {
          final BankModel transferPointsBank = BankModel();
          transferPointsBank.transfer(10);
          expect(transferPointsBank.points, 10);
        },
      );

      test(
        'BankModel transfer should turn available into -10',
        () {
          final BankModel transferAvailableBank = BankModel();
          transferAvailableBank.transfer(10);
          expect(transferAvailableBank.available, -10);
        },
      );

      test(
        'BankModel transfer should turn spent into 20',
        () {
          final BankModel transferSpentBank = BankModel();
          transferSpentBank.transfer(10);
          expect(transferSpentBank.spent, 20);
        },
      );
    },
  );
}
