class Account {
  int balance = 0;

  void deposit(int amount) {
    balance += amount;
    print("Deposited: \$${amount}. Current balance: \$${balance}");
  }

  void withdraw(int amount) {
    if (amount > balance) {
      print("Insufficient funds. Current balance: \$${balance}");
    } else {
      balance -= amount;
      print("Withdrew: \$${amount}. Current balance: \$${balance}");
    }
  }
}

void main() {
  Account account = Account();

  account.deposit(2000);
  account.withdraw(1500);
  account.deposit(700);

}

