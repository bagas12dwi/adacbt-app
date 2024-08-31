class User {
  int? id;
  String? fullName;
  String email;
  String? phoneNumber;
  String? role;
  String password;
  int isActive;

  User({
    this.id,
    this.fullName,
    required this.email,
    required this.password,
    this.phoneNumber,
    this.role,
    required this.isActive
  });

  factory User.fromJson(Map<String, dynamic> json){
    return User(
        id: (json['id'] ?? "") as int,
        fullName: (json['full_name']??"") as String,
        email: (json['email']??"")as String,
        phoneNumber: (json['phone_number']??"")as String,
        role: (json['role']??"")as String,
        password: (json['password']??"")as String,
        isActive: (json['is_active']??0) as int
    );
  }

  Map<String, dynamic> toJson(){
    return{
      'id': id,
      'full_name': fullName,
      'email': email,
      'phone_number': phoneNumber,
      'password' : password
    };
  }

}