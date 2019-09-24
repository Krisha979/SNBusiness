class UserData {
 int userAccountId;
 int organizationId;
 String password;
 String fullName;
 int userTypeId;
 String userRowstamp;
 bool isValidated;
 String email;
 String organizationEmail;
 String organizationName;
 String logo;
 String orgRowstamp;
                          

UserData(
 {this.userAccountId,
 this.organizationId,
 this.password,
 this.fullName,
 this.userTypeId,
 this.userRowstamp,
 this.isValidated,
 this.email,
 this.organizationEmail,
 this.organizationName,
 this.logo,
 this.orgRowstamp});
 
 UserData.fromJson(Map<String, dynamic> json) {
 userAccountId = json['userAccountId'];
 organizationId = json['organizationId'];
 password = json['password'];
 fullName = json['fullName'];
 userTypeId = json['userTypeId'];
 userRowstamp = json['userRowstamp'];
 isValidated = json['isValidated'];
 email = json['email'];
 organizationEmail = json['organizationEmail'];
 organizationName = json['organizationName'];
 logo = json['logo'];
 orgRowstamp = json['orgRowstamp'];
 }
 
 Map<String, dynamic> toJson() {
 final Map<String, dynamic> data = new Map<String, dynamic>();
 data['userAccountId'] = this.userAccountId;
 data['organizationId'] = this.organizationId;
 data['password'] = this.password;
 data['fullName'] = this.fullName;
 data['userTypeId'] = this.userTypeId;
 data['userRowstamp'] = this.userRowstamp;
 data['isValidated'] = this.isValidated;
 data['email'] = this.email;
 data['organizationEmail'] = this.organizationEmail;
 data['organizationName'] = this.organizationName;
 data['logo'] = this.logo;
 data['orgRowstamp'] = this.orgRowstamp;
 return data;
 }
}