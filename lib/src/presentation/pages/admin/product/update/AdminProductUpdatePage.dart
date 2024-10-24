import 'package:ecommerce_flutter/src/domain/models/Category.dart';
import 'package:ecommerce_flutter/src/domain/models/Product.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/product/update/AdminProductUpdateContent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/product/update/bloc/AdminProductUpdateBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/product/update/bloc/AdminProductUpdateEvent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/product/update/bloc/AdminProductUpdateState.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AdminProductUpdatePage extends StatefulWidget {
  const AdminProductUpdatePage({super.key});

  @override
  State<AdminProductUpdatePage> createState() =>
     _AdminProductUpdatePageState();
}

class _AdminProductUpdatePageState extends State<AdminProductUpdatePage> {

  AdminProductUpdateBloc? _bloc;
  Product? product;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _bloc?.add(AdminProductUpdateInitEvent(product: product!));
    });
  }

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<AdminProductUpdateBloc>(context);
    product = ModalRoute.of(context)?.settings.arguments as Product?;
    return Scaffold(
      body:BlocListener<AdminProductUpdateBloc,AdminProductUpdateState>(
        listener: (context, state){
          final responseState = state.response;
          if(responseState is Success){
            //context.read<AdminCategoryListBloc>().add(GetCategories());//unja vez que es exitoso, traiga los cambios haciendo un refresh
            _bloc?.add(ResetForm());
            Fluttertoast.showToast(msg: "La categoria se creó correctamente", toastLength: Toast.LENGTH_LONG);
          }else if(responseState is Error){
            Fluttertoast.showToast(msg: responseState.message, toastLength: Toast.LENGTH_LONG);

          }          
        },
          child: BlocBuilder<AdminProductUpdateBloc,AdminProductUpdateState>(
            builder: (context,state) {
              return AdminProductUpdateContent(_bloc, state, product);
            }
          ),
      )
    );
  }
}