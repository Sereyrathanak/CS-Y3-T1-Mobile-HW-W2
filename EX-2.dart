class BankAccount {

  final int _accountId;
  final String _accountOwner;
  double _balance;

  BankAccount(this._accountId, this._accountOwner)
      : _balance = 0 ;

  int get accountId => _accountId;
  String get accountOwner => _accountOwner;
  double get balance => _balance;


  void credit(double amount) {
    if (amount <= 0) {
      throw Exception("Invalid amount");
    }
    _balance = _balance + amount;
  }

  void withdraw(double amount) {
    if (amount <= 0) {
      throw Exception("Invalid amount");
    }

    if (amount > _balance) {
      throw Exception("Not enough money");
    }

    _balance = _balance - amount;
  }
}
class Bank {
  String name;

  List<BankAccount> accounts = [];

  Bank(this.name);


  BankAccount createAccount(
    int accountId,
    String accountOwner,
  ) {
    
    for (BankAccount account in accounts) {
      if (account.accountId == accountId) {
        throw Exception("Account ID already exists");
      }
    }

 
    BankAccount newAccount = BankAccount(
      accountId,
      accountOwner,
    );
    accounts.add(newAccount);
    return newAccount;
  }
}
void main() {

  Bank myBank = Bank("CADT Bank");
  BankAccount ronanAccount = myBank.createAccount(100, 'Ronan');

  print(ronanAccount.balance); // Balance: $0
  ronanAccount.credit(100);
  print(ronanAccount.balance); // Balance: $100
  ronanAccount.withdraw(50);
  print(ronanAccount.balance); // Balance: $50

  try {
    ronanAccount.withdraw(75); // This will throw an exception
  } catch (e) {
    print(e); // Output: Insufficient balance for withdrawal!
  }

  try {
    myBank.createAccount(100, 'Honlgy'); // This will throw an exception
  } catch (e) {
    print(e); // Output: Account with ID 100 already exists!
  }
}
