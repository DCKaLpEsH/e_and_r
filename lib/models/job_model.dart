class AllJobsModel {
  List<JobModel>? data;
  String? status;

  AllJobsModel({this.data, this.status});

  AllJobsModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <JobModel>[];
      json['data'].forEach((v) {
        data!.add(JobModel.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['status'] = status;
    return data;
  }
}

class JobModel {
  int? id;
  String? designation;
  String? experience;
  int? xiithpercent;
  int? gradgpa;
  String? description;
  int? nos;
  String? salpackage;
  String? createdon;
  Company? company;

  JobModel(
      {this.id,
      this.designation,
      this.experience,
      this.xiithpercent,
      this.gradgpa,
      this.description,
      this.nos,
      this.salpackage,
      this.createdon,
      this.company});

  JobModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    designation = json['designation'];
    experience = json['experience'];
    xiithpercent = json['xiithpercent'];
    gradgpa = json['gradgpa'];
    description = json['description'];
    nos = json['nos'];
    salpackage = json['salpackage'];
    createdon = json['createdon'];
    company =
        json['company'] != null ? Company.fromJson(json['company']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['designation'] = designation;
    data['experience'] = experience;
    data['xiithpercent'] = xiithpercent;
    data['gradgpa'] = gradgpa;
    data['description'] = description;
    data['nos'] = nos;
    data['salpackage'] = salpackage;
    data['createdon'] = createdon;
    if (company != null) {
      data['company'] = company!.toJson();
    }
    return data;
  }
}

class Company {
  int? id;
  String? cname;
  String? address;
  String? website;
  String? email;
  String? phone;
  String? createdon;

  Company(
      {this.id,
      this.cname,
      this.address,
      this.website,
      this.email,
      this.phone,
      this.createdon});

  Company.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cname = json['cname'];
    address = json['address'];
    website = json['website'];
    email = json['email'];
    phone = json['phone'];
    createdon = json['createdon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['cname'] = cname;
    data['address'] = address;
    data['website'] = website;
    data['email'] = email;
    data['phone'] = phone;
    data['createdon'] = createdon;
    return data;
  }
}
