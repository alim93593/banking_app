import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int? id;
  final String name;
  final String email;
  final String transferFrom;
  final String transferTo;
  final int total;

  const User({
    this.id,
    required this.transferFrom,
    required this.transferTo,
    required this.total,
    required this.name,
    required this.email,
   });
  @override
  // TODO: implement props
  List<Object?> get props => [name,email,transferTo,transferFrom,total,id];
}
