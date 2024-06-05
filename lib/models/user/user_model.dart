
// class User {
//     int id;
//     String fname;
//     String lname;
//     String mobile;
//     String email;
//     String address;

//     User({
//         required this.id,
//         required this.fname,
//         required this.lname,
//         required this.mobile,
//         required this.email,
//         required this.address,
//     });

//     User copyWith({
//         int? id,
//         String? fname,
//         String? lname,
//         String? mobile,
//         String? email,
//         String? address,
//     }) => 
//         User(
//             id: id ?? this.id,
//             fname: fname ?? this.fname,
//             lname: lname ?? this.lname,
//             mobile: mobile ?? this.mobile,
//             email: email ?? this.email,
//             address: address ?? this.address,
//         );

//     factory User.fromJson(Map<String, dynamic> json) => User(
//         id: json["id"],
//         fname: json["fname"],
//         lname: json["lname"],
//         mobile: json["mobile"],
//         email: json["email"],
//         address: json["address"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "fname": fname,
//         "lname": lname,
//         "mobile": mobile,
//         "email": email,
//         "address": address,
//     };
// }
