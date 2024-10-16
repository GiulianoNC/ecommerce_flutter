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