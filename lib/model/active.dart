import 'package:sua_carteira_investimentos/model/time_of_investiment.dart';

class Active {
  int id;
  String name;
  int quantity;
  double unitaryValue;
  double amount;
  TimeInvestment timeInvestment;

  Active({this.id, this.name, this.quantity, this.unitaryValue, this.amount, this.timeInvestment});

  Active.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    quantity = json['quantity'];
    unitaryValue = json['unitaryValue'];
    amount = json['amount'];
    timeInvestment = json['timeInvestment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['quantity'] = this.quantity;
    data['unitaryValue'] = this.unitaryValue;
    data['amount'] = this.amount;
    data['timeInvestment'] = this.timeInvestment;
    return data;
  }
}

