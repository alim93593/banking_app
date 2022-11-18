import 'package:equatable/equatable.dart';

class Trasform extends Equatable {
  final String transferFrom;
  final String transferTo;
  final int total;

  const Trasform(
    this.transferFrom,
    this.transferTo,
    this.total,
  );
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
