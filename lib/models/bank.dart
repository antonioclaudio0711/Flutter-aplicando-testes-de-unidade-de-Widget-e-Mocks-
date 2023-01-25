class BankModel {
  double available = 0;
  double spent = 0;
  double earned = 0;
  double points = 0;

  void deposit(double money) {
    available = available + money;
    earned = earned + money;
    points = points + money;
  }

  void transfer(double money) {
    available = available - money;
    points = points + money;
    spent = spent + money;
  }
}
