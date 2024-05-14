class Vendor {
  int? id;
  String? email;
  String? profileImage;
  String? companyName;
  String? address;
  String? city;
  String? state;
  String? country;
  String? gstNumber;
  String? gstCopy;
  String? contactNumber;
  String? alternateContactNumber;
  String? natureOfBusiness;
  String? legalStateOfFirm;
  String? directorsName;
  String? bankName;
  String? bankAccountNumber;
  String? ifscCode;
  String? beneficiaryName;
  String? yearOfEstablishment;
  String? createdAt;
  String? updatedAt;

  Vendor(
      {this.id,
      this.email,
      this.profileImage,
      this.companyName,
      this.address,
      this.city,
      this.state,
      this.country,
      this.gstNumber,
      this.gstCopy,
      this.contactNumber,
      this.alternateContactNumber,
      this.natureOfBusiness,
      this.legalStateOfFirm,
      this.directorsName,
      this.bankName,
      this.bankAccountNumber,
      this.ifscCode,
      this.beneficiaryName,
      this.yearOfEstablishment,
      this.createdAt,
      this.updatedAt});

  Vendor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    profileImage = json['profile_image'];
    companyName = json['company_name'];
    address = json['address'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    gstNumber = json['gst_number'];
    gstCopy = json['gst_copy'];
    contactNumber = json['contact_number'];
    alternateContactNumber = json['alternate_contact_number'];
    natureOfBusiness = json['nature_of_business'];
    legalStateOfFirm = json['legal_state_of_firm'];
    directorsName = json['directors_name'];
    bankName = json['bank_name'];
    bankAccountNumber = json['bank_account_number'];
    ifscCode = json['ifsc_code'];
    beneficiaryName = json['beneficiary_name'];
    yearOfEstablishment = json['year_of_establishment'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['email'] = email;
    data['profile_image'] = profileImage;
    data['company_name'] = companyName;
    data['address'] = address;
    data['city'] = city;
    data['state'] = state;
    data['country'] = country;
    data['gst_number'] = gstNumber;
    data['gst_copy'] = gstCopy;
    data['contact_number'] = contactNumber;
    data['alternate_contact_number'] = alternateContactNumber;
    data['nature_of_business'] = natureOfBusiness;
    data['legal_state_of_firm'] = legalStateOfFirm;
    data['directors_name'] = directorsName;
    data['bank_name'] = bankName;
    data['bank_account_number'] = bankAccountNumber;
    data['ifsc_code'] = ifscCode;
    data['beneficiary_name'] = beneficiaryName;
    data['year_of_establishment'] = yearOfEstablishment;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
