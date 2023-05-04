import 'dart:io';

class TokenRequestModal {
  String? name;
  String? phone;
  String? email;
  String? companyName;
  String? websiteApplication;
  String? requirement;
  File? citizenImageFront;
  File? citizenImageBack;
  File? companyRegistration;
  File? companyPanVat;

  TokenRequestModal({
    this.name,
    this.phone,
    this.email,
    this.companyName,
    this.websiteApplication,
    this.requirement,
    this.citizenImageFront,
    this.citizenImageBack,
    this.companyRegistration,
    this.companyPanVat,
  });

  factory TokenRequestModal.fromMap(Map<String, dynamic> map) {
    return TokenRequestModal(
      name: map["name"],
      phone: map["phone"],
      email: map["email"],
      companyName: map["companyName"],
      websiteApplication: map["websiteApplication"],
      requirement: map["requirement"],
      citizenImageFront: map["citizenImageFront"],
      citizenImageBack: map["citizenImageBack"],
      companyRegistration: map["companyRegistration"],
      companyPanVat: map["companyPanVat"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "phone": phone,
      "email": email,
      "companyName": companyName,
      "websiteApplication": websiteApplication,
      "requirement": requirement,
      "citizenImageFront": citizenImageFront,
      "citizenImageBack": citizenImageBack,
      "companyRegistration": companyRegistration,
      "companyPanVat": companyPanVat,
    };
  }
}
