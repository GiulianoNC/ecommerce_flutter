import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/address/create/ClientAdressCreateContent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/address/create/bloc/ClientAddressCreateBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/address/create/bloc/ClientAddressCreateState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ClientAddressCreatePage extends StatefulWidget {
  const ClientAddressCreatePage({super.key});

  @override
  State<ClientAddressCreatePage> createState() => _ClientAddressCreatePageState();
}

class _ClientAddressCreatePageState extends State<ClientAddressCreatePage> {

  ClientAddressCreateBloc? _bloc;

  @override
    Widget build(BuildContext context) {
      _bloc = BlocProvider.of<ClientAddressCreateBloc>(context);
      return Scaffold(
        body: BlocListener<ClientAddressCreateBloc, ClientAddressCreateState>(
          listener: (context, state) {
            final responseState = state.response;
            if (responseState is Success) {
              Fluttertoast.showToast(msg: "La dirección se creó correctamente", toastLength: Toast.LENGTH_LONG);
            } else if (responseState is Error) {
              Fluttertoast.showToast(msg: responseState.message, toastLength: Toast.LENGTH_LONG);
            }
          },
          child: BlocBuilder<ClientAddressCreateBloc, ClientAddressCreateState>(
            builder: (context, state) {
              return ClientAdressCreateContent(_bloc, state);
            },
          ),
        ),
      );
    }

}