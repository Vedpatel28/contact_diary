import 'dart:io';

class contacts {
  late String firstname;
  late String lastname;
  late int Contact;
  late String email;
  late File? image;

  contacts({
    required this.firstname,
    required this.lastname,
    required this.Contact,
    this.image,
  });
}
