class BankModel {
  double available = 0;
  double spent = 0;
  double earned = 0;
  double points = 0;

  void deposit(double money) {
    available = available + (10 * money);
    earned = earned + money;
    points = points + (2 * money);
  }

  void transfer(double money) {
    available = available - money;
    points = points + money;
    spent = spent + (2 * money);
  }
}
