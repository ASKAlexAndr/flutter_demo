import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String name;

  const User(this.id, this.name);

  @override
  // TODO: implement props
  List<Object> get props => [id, name];

  static const empty = User(null, null);
}
