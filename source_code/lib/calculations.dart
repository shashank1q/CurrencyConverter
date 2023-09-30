class UserData {
  String previous = '';
  String curr = '';

  String eval() {
    switch (previous[previous.length - 1]) {
      case '+':
        previous = previous.substring(0, previous.length - 1);
        double res = double.parse(previous) + double.parse(curr);
        return res.toString();
      case '-':
        previous = previous.substring(0, previous.length - 1);
        double res = double.parse(previous) - double.parse(curr);
        return res.toString();
      case 'X':
        previous = previous.substring(0, previous.length - 1);
        double res = double.parse(previous) * double.parse(curr);
        return res.toString();
      case '/':
        previous = previous.substring(0, previous.length - 1);
        double res = double.parse(previous) / double.parse(curr);
        return res.toString();
    }
    return "error";
  }

  void operator(String op) {
    if (previous == '') {
      previous = curr + op;
      curr = '';
    } else {
      if (curr.isNotEmpty) {
        previous = eval() + op;
        curr = '';
      } else {
        previous = previous.substring(0, previous.length - 1) + op;
      }
    }
  }

  void operatorEqual() {
    if (previous.isEmpty || curr.isEmpty) return;
    curr = eval();
    previous = '';
  }

  void removelast() {
    if (curr.isNotEmpty) {
      curr = curr.substring(0, curr.length - 1);
    }
  }

  void addNumber(String s) {
    curr += s;
  }
}
