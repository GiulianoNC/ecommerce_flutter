import 'package:equatable/equatable.dart';

class ClientCategoryListEvent extends Equatable {

const ClientCategoryListEvent();

@override
  // TODO: implement props
  List<Object?> get props => [];
}

class GetCategories extends ClientCategoryListEvent{
  const GetCategories();
}

