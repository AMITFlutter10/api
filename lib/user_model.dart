import 'package:equatable/equatable.dart';

class UserModel extends Equatable{
  List<Data>? data;

  UserModel({this.data});

  UserModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override

  List<Object?> get props => [data];
}

class Data extends Equatable {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;

  Data({this.id, this.email, this.firstName, this.lastName, this.avatar});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['avatar'] = this.avatar;
    return data;
  }

  @override
  List<Object?> get props =>[id,email,firstName,lastName,avatar];
}

// {
// "data": [
// {
// "id": 1,
// "email": "george.bluth@reqres.in",
// "first_name": "George",
// "last_name": "Bluth",
// "avatar": "https://reqres.in/img/faces/1-image.jpg"
// },
// {
// "id": 2,
// "email": "janet.weaver@reqres.in",
// "first_name": "Janet",
// "last_name": "Weaver",
// "avatar": "https://reqres.in/img/faces/2-image.jpg"
// },
// {
// "id": 3,
// "email": "emma.wong@reqres.in",
// "first_name": "Emma",
// "last_name": "Wong",
// "avatar": "https://reqres.in/img/faces/3-image.jpg"
// },
// {
// "id": 4,
// "email": "eve.holt@reqres.in",
// "first_name": "Eve",
// "last_name": "Holt",
// "avatar": "https://reqres.in/img/faces/4-image.jpg"
// },
// {
// "id": 5,
// "email": "charles.morris@reqres.in",
// "first_name": "Charles",
// "last_name": "Morris",
// "avatar": "https://reqres.in/img/faces/5-image.jpg"
// },
// {
// "id": 6,
// "email": "tracey.ramos@reqres.in",
// "first_name": "Tracey",
// "last_name": "Ramos",
// "avatar": "https://reqres.in/img/faces/6-image.jpg"
// }
// ]
// }