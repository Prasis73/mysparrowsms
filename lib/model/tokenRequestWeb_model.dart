// ignore_for_file: file_names


class TokenRequestModalWeb {
  String? name;
  String? phone;
  String? email;
  String? companyName;
  String? websiteApplication;
  String? requirement;
  List<int>? citizenImageFront;
  List<int>? citizenImageBack;
  List<int>? companyRegistration;
  List<int>? companyPanVat;
  String? citizenImageFrontExt;
  String? citizenImageBackExt;
  String? companyRegistrationExt;
  String? companyPanVatExt;

  TokenRequestModalWeb({
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
    this.citizenImageFrontExt,
    this.citizenImageBackExt,
    this.companyRegistrationExt,
    this.companyPanVatExt,
  });

  factory TokenRequestModalWeb.fromMap(Map<String, dynamic> map) {
    return TokenRequestModalWeb(
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
      citizenImageFrontExt: map["citizenImageFrontExt"],
      citizenImageBackExt: map["citizenImageBackExt"],
      companyRegistrationExt: map["companyRegistrationExt"],
      companyPanVatExt: map["companyPanVatExt"],
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
      "citizenImageFrontExt": citizenImageFrontExt,
      "citizenImageBackExt": citizenImageBackExt,
      "companyRegistrationExt": companyRegistrationExt,
      "companyPanVatExt": companyPanVatExt,
    };
  }
}
