import 'dart:core';
/**
 * This class represents as Additional Costs which we add to the price of the property
 * The sum of those two numbers will make the "Kaufgesamtpreis" the final price
 * of the property
 */
class AdditionalCosts {
  double total;
  int totalPercent;

  AdditionalCosts({
    this.total,
    this.totalPercent,
  });

  factory AdditionalCosts.fromJson(dynamic json) {
    return AdditionalCosts(
      total: json['additionalCosts']['total'],
      totalPercent: json['additionalCosts']['totalPercent'],
    );
  }

  String getTotal() {
    return total.toString();
  }

  String getTotalPercent() {
    return totalPercent.toString();
  }

}