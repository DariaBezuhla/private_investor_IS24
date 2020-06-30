import 'dart:core';

class CalculatorAPIData {

  int purchasePrice;
  double totalAdditionalCosts;
  int totalPercentAdditionalCosts;
  double totalOwnFunds;
  int totalPercentOwnFunds;
  int loanAmount;
  double debitInterestRate;
  int amortizationRate;


  CalculatorAPIData({
    this.purchasePrice,
    this.totalAdditionalCosts,
    this.totalPercentAdditionalCosts,
    this.totalOwnFunds,
    this.totalPercentOwnFunds,
    this.loanAmount,
    this.amortizationRate,
    this.debitInterestRate,
  });


  factory CalculatorAPIData.fromJson(dynamic json) {
    return CalculatorAPIData(
      purchasePrice: json['purchasePrice'],
      totalAdditionalCosts: json['additionalCosts']['total'],
      totalPercentAdditionalCosts: json['additionalCosts']['totalPercent'],

      totalOwnFunds: json['ownFunds']['total'],
      totalPercentOwnFunds: json['ownFunds']['totalPercent'],

      loanAmount: json['loanAmount'],
      amortizationRate: json['amortizationRate'],
      debitInterestRate: json['averageInterestRate'],

    );
  }

  String getPurchasePrice() {
    return purchasePrice.toString();
  }

  String getTotalAdditionalCosts() {
    return totalAdditionalCosts.toString();
  }

  String getTotalPercent() {
    return totalPercentAdditionalCosts.toString();
  }

   String getTotalOwnFunds() {
    return totalOwnFunds.toString();
  }

   String getTotalPercentOwnFunds() {
    return totalPercentOwnFunds.toString();
  }

   String getLoanAmount() {
    return loanAmount.toString();
  }

   String getAmortizationRate() {
    return amortizationRate.toString();
  }

   String getAverageInterestRate() {
    return debitInterestRate.toString();
  }

}