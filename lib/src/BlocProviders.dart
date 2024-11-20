import 'package:ecommerce_flutter/injection.dart';
import 'package:ecommerce_flutter/src/domain/userCases/address/AddressUseCases.dart';
import 'package:ecommerce_flutter/src/domain/userCases/products/ProductstUseCases.dart';
import 'package:ecommerce_flutter/src/domain/userCases/auth/AuthUseCases.dart';
import 'package:ecommerce_flutter/src/domain/userCases/categories/CategoriesUseCases.dart';
import 'package:ecommerce_flutter/src/domain/userCases/shoppingBag/ShoppingBagUseCases.dart';
import 'package:ecommerce_flutter/src/domain/userCases/users/UsersUseCases.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/category/create/bloc/AdminCategoryCreateBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/category/create/bloc/AdminCategoryCreateEvent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/category/list/bloc/AdminCategoryListBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/category/update/bloc/AdminCategoryUpdateBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/home/bloc/AdminHomeBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/product/list/bloc/AdminProductListBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/product/create/bloc/AdminProductCreateBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/product/update/bloc/AdminProductUpdateBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/address/create/bloc/ClientAddressCreateBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/address/create/bloc/ClientAddressCreateEvent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/address/list/bloc/ClientAddressListBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/address/payment/form/bloc/ClientPaymentFormBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/address/payment/form/bloc/ClientPaymentFormEvent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/category/list/bloc/ClientCategoryListBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/home/bloc/ClientHomeBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/product/detail/bloc/ClientProductDetailBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/product/list/bloc/ClientProductListBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/shoppingBag/bloc/ClientShoppingBagBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/login/bloc/LoginBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/login/bloc/LoginEvent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/profile/info/bloc/ProfileInfoBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/profile/info/bloc/ProfileInfoEvent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/profile/update/bloc/ProfileUpdateBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/register/bloc/RegisterBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/register/bloc/RegisterEvent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/roles/RolesBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/roles/RolesEvent.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<BlocProvider> blocProviders =[
  BlocProvider<LoginBloc>(create: (context) => LoginBloc(locator<Authusecases>())..add(InitEvent())),
  BlocProvider<RegisterBloc>(create: (context) => RegisterBloc(locator<Authusecases>())..add(RegisterInitEvent())),
  BlocProvider<RolesBloc>(create: (context) => RolesBloc(locator<Authusecases>())..add(GetRolesList())),
  BlocProvider<AdminHomeBloc>(create: (context) => AdminHomeBloc(locator<Authusecases>())),
  BlocProvider<ProfileInfoBloc>(create: (context) => ProfileInfoBloc(locator<Authusecases>())..add(ProfileInfoGetUser())), 
  BlocProvider<ProfileUpdateBloc>(create: (context) => ProfileUpdateBloc(locator<UsersUseCases>(),locator<Authusecases>())),
  BlocProvider<AdminCategoryCreateBloc>(create: (context) => AdminCategoryCreateBloc(locator<CategoriesUseCases>())..add(AdminCategoryCreateInitEvent())),
  BlocProvider<AdminCategoryListBloc>(create: (context) => AdminCategoryListBloc(locator<CategoriesUseCases>())),
  BlocProvider<AdminCategoryUpdateBloc>(create: (context) => AdminCategoryUpdateBloc(locator<CategoriesUseCases>())),
  BlocProvider<AdminProductCreateBloc>(create: (context) => AdminProductCreateBloc(locator<ProductsUsesCases>())),
  BlocProvider<AdminProductListBloc>(create: (context) => AdminProductListBloc(locator<ProductsUsesCases>())),
  BlocProvider<AdminProductUpdateBloc>(create: (context) => AdminProductUpdateBloc(locator<ProductsUsesCases>())),
  BlocProvider<ClientHomeBloc>(create: (context) => ClientHomeBloc(locator<Authusecases>())),
  BlocProvider<ClientCategoryListBloc>(create: (context) => ClientCategoryListBloc(locator<CategoriesUseCases>())),
  BlocProvider<ClientProductListBloc>(create: (context) => ClientProductListBloc(locator<ProductsUsesCases>())),
  BlocProvider<ClientProductDetailBloc>(create: (context) => ClientProductDetailBloc(locator<ShoppingBagUseCases>())),
  BlocProvider<ClientShoppingBagBloc>(create: (context) => ClientShoppingBagBloc(locator<ShoppingBagUseCases>())),
  BlocProvider<ClientAddressCreateBloc>(create: (context) => ClientAddressCreateBloc(locator<AddressUseCases>(),locator<Authusecases>())..add(ClientAddressCreateInitEvent())),
  BlocProvider<ClientAddressListBloc>(create: (context) => ClientAddressListBloc(locator<AddressUseCases>(),locator<Authusecases>())),
  BlocProvider<ClientPaymentFormBloc>(create: (context) => ClientPaymentFormBloc()..add(ClientPaymentFormInitEvent())),

];