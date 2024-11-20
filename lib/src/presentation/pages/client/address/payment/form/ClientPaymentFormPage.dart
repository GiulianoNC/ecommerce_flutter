import 'package:ecommerce_flutter/src/presentation/pages/client/address/payment/form/ClientPaymentFormContent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/address/payment/form/bloc/ClientPaymentFormBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/address/payment/form/bloc/ClientPaymentFormEvent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/address/payment/form/bloc/ClientPaymentFormState.dart';
import 'package:ecommerce_flutter/src/presentation/widgets/DefaultButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClientPaymentFormPage extends StatefulWidget {
  const ClientPaymentFormPage({super.key});

  @override
  State<ClientPaymentFormPage> createState() => _ClientPaymentFormPageState();
}

class _ClientPaymentFormPageState extends State<ClientPaymentFormPage> {

  ClientPaymentFormBloc? _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<ClientPaymentFormBloc>(context);
    _bloc?.add(ClientPaymentFormInitEvent()); 
  }


  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<ClientPaymentFormBloc>(context);
    return Scaffold(
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(bottom: 15, left: 30, right: 30),
        child: Defaultbutton(
          text: 'Continuar', 
          onPressed: (){
            _bloc?.add(FormSubmit());
          }),
      ),
      body: BlocBuilder<ClientPaymentFormBloc, ClientPaymentFormState>(
        builder: (context,state){
          //return Container();
          return ClientPaymentFormContent(_bloc, state);
        })
    );
  }
}