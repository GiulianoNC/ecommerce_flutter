import 'package:equatable/equatable.dart';

class AdminCategoryListEvent extends Equatable {

const AdminCategoryListEvent();

@override
  // TODO: implement props
  List<Object?> get props => [];
}

class GetCategories extends AdminCategoryListEvent{
  const GetCategories();
}

class DeleteCategory extends AdminCategoryListEvent{
  final int id;
  const DeleteCategory({required this.id});

  @override
  // TODO: implement props
  List<Object?> get props => [id];
}