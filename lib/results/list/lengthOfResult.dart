
import 'dart:core';

class ResultsLength {
  num numberOfListings;
  num pages;


  ResultsLength({
    this.numberOfListings,
    this.pages,
  });

  factory ResultsLength.fromJson(Map<String, dynamic> json) {
    return ResultsLength(
      numberOfListings: json['numberOfListings'],
      pages: json['pages'],
    );
  }


  num getNumberOfListings() {
    return numberOfListings;
  }

  num getPages() {
    return pages;
  }
}


