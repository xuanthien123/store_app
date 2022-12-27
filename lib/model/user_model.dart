class UserModel{
  int? idUser;
  String? phoneNumber;
  String? email;
  String? password;
  String? userName;
  String? address;

  UserModel({this.idUser,this.phoneNumber,this.email,this.password,this.userName,this.address});

  factory UserModel.fromJson(Map<String,dynamic> obj){
    return UserModel(
      idUser: obj["idUser"],
      phoneNumber: obj["phoneNumber"],
      email: obj["email"],
      password: obj["password"],
      userName: obj["userName"],
      address: obj["address"],
    );
  }
}