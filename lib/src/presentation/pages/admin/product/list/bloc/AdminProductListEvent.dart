import 'package:equatable/equatable.dart';

abstract class AdminProductListEvent extends Equatable{

const AdminProductListEvent();

@override
  // TODO: implement props
  List<Object?> get props => [];
}

class GetProductsByCategory extends AdminProductListEvent{
  final int idCategory;

  const GetProductsByCategory({ required this.idCategory});

  @override
  // TODO: implement props
  List<Object?> get props => [idCategory];

}