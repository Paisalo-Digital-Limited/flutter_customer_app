import 'dart:convert';

Loandata loandataFromJson(String str) => Loandata.fromJson(json.decode(str));

String loandataToJson(Loandata data) => json.encode(data.toJson());

class Loandata {
  int statusCode;
  String message;
  Data? data;

  Loandata({
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory Loandata.fromJson(Map<String, dynamic> json) => Loandata(
    statusCode: json["statusCode"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "message": message,
    "data": data!.toJson(),
  };
}

class Data {
  String name;
  String address;
  String phoneNo;
  String pdlSanctionedAmt;
  String loanDuration;
  String emiStartingYear;
  String panNo;
  String aadharId;
  List<LoanEmi> loanEmi;

  Data({
    required this.name,
    required this.address,
    required this.phoneNo,
    required this.pdlSanctionedAmt,
    required this.loanDuration,
    required this.emiStartingYear,
    required this.panNo,
    required this.aadharId,
    required this.loanEmi,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    name: json["name"],
    address: json["address"],
    phoneNo: json["phoneNo"],
    pdlSanctionedAmt: json["pdlSanctionedAmt"],
    loanDuration: json["loanDuration"],
    emiStartingYear: json["emiStartingYear"],
    panNo: json["panNo"],
    aadharId: json["aadharId"],
    loanEmi: List<LoanEmi>.from(json["loanEmi"].map((x) => LoanEmi.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "address": address,
    "phoneNo": phoneNo,
    "pdlSanctionedAmt": pdlSanctionedAmt,
    "loanDuration": loanDuration,
    "emiStartingYear": emiStartingYear,
    "panNo": panNo,
    "aadharId": aadharId,
    "loanEmi": List<dynamic>.from(loanEmi.map((x) => x.toJson())),
  };
}

class LoanEmi {
  String amount;
  String? paid;
  DateTime emiDueDate;

  LoanEmi({
    required this.amount,
    this.paid,
    required this.emiDueDate,
  });

  factory LoanEmi.fromJson(Map<String, dynamic> json) => LoanEmi(
    amount: json["amount"],
    paid: json["paid"]??"null",
    emiDueDate: DateTime.parse(json["emiDueDate"]),
  );

  Map<String, dynamic> toJson() => {
    "amount": amount,
    "paid": paid??"null",
    "emiDueDate": emiDueDate.toIso8601String(),
  };
}

