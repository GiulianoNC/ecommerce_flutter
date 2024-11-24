import 'package:ecommerce_flutter/src/domain/models/MercadoPagoCardTokenResponse.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/address/payment/form/ClientPaymentFormContent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/address/payment/form/bloc/ClientPaymentFormBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/address/payment/form/bloc/ClientPaymentFormEvent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/address/payment/form/bloc/ClientPaymentFormState.dart';
import 'package:ecommerce_flutter/src/presentation/widgets/DefaultButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
      body: BlocListener<ClientPaymentFormBloc,ClientPaymentFormState>(
        listener: (context, state){
          final responseState = state.response;
          if(responseState is Success){
            //_bloc?.add(ResetForm());
            MercadoPagoCardTokenResponse response = responseState.data as MercadoPagoCardTokenResponse;
            Navigator.pushNamedAndRemoveUntil(
              context, 
              'client/payment/installments',
              (route) => false, 
              arguments:{
                "mercadoPagoCardTokenResponse" : response,
                "amount": state.totalToPay.toString()
              });
            print('Respuesta Card Token: ${response.toJson()}');
            //Fluttertoast.showToast(msg: "La categoria se creó correctamente", toastLength: Toast.LENGTH_LONG);
          }else if(responseState is Error){
            Fluttertoast.showToast(msg: responseState.message, toastLength: Toast.LENGTH_LONG);

          }    
      },
        child: BlocBuilder<ClientPaymentFormBloc, ClientPaymentFormState>(
          builder: (context,state){
            //return Container();
            return ClientPaymentFormContent(_bloc, state);
          }),
      )
    );
  }
}