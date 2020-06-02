import 'dart:core';

class ContactDetails{
  String firstname;
  String lastname;
  String company;
  String realtorLogo;

  ContactDetails({
    this.firstname,
    this.lastname,
    this.company,
    this.realtorLogo
  });

  factory ContactDetails.fromJson(dynamic json){
    return ContactDetails(
        firstname: json['firstname'],
        lastname: json['lastname'],
        company: json['company'],
        realtorLogo: json['realtorLogo']
    );
  }

  String getFirstName() {
    return firstname;
  }

  String getLastName() {
    return lastname;
  }

  String getCompany() {
    return company;
  }

  String getRealTorLogo() {
    return realtorLogo;
  }
}