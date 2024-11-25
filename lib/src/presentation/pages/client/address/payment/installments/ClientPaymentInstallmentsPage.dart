import 'package:ecommerce_flutter/src/domain/models/MercadoPagoCardTokenResponse.dart';
import 'package:ecommerce_flutter/src/domain/models/MercadoPagoInstallments.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/address/payment/installments/ClientPaymentInstallmentsContent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/address/payment/installments/bloc/ClientPaymentInstallmentsBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/address/payment/installments/bloc/ClientPaymentInstallmentsEvent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/address/payment/installments/bloc/ClientPaymentInstallmentsState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClientPaymentInstallmentsPage extends StatefulWidget {
  const ClientPaymentInstallmentsPage({super.key});

  @override
  State<ClientPaymentInstallmentsPage> createState() => _PaymentInstallmentsPageState();
}

class _PaymentInstallmentsPageState extends State<ClientPaymentInstallmentsPage> {
  
  ClientPaymentInstallmentsBloc? _bloc;
  MercadoPagoCardTokenResponse? mercadoPagoCardTokenResponse;
  String? amount;
  
 @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Asegúrate de que `_bloc` no sea nulo antes de usarlo
      _bloc = BlocProvider.of<ClientPaymentInstallmentsBloc>(context);
      if (mercadoPagoCardTokenResponse != null && amount != null) {
         print('FirstSixDigits: ${mercadoPagoCardTokenResponse!.firstSixDigits}');
         print('Amount: $amount');
        _bloc?.add(GetInstallments(
          firstSixDigits: mercadoPagoCardTokenResponse!.firstSixDigits,
          amount: amount!,
        ));
      }else {
      print('mercadoPagoCardTokenResponse or amount is null');
    }
    });
  }

  @override
  Widget build(BuildContext context) {
     Map<String, dynamic> arguments = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    mercadoPagoCardTokenResponse = arguments['mercadoPagoCardTokenResponse'] as MercadoPagoCardTokenResponse;
    //amount = arguments['amount'];
    amount = '100000';
    print('Amount2: $amount');
    _bloc = BlocProvider.of<ClientPaymentInstallmentsBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Ultimo paso'),
        backgroundColor: Colors.grey[200],
      ),
      body: BlocBuilder<ClientPaymentInstallmentsBloc, ClientPaymentInstallmentsState>(
        builder: (context, state) {
          final responseState = state.response;
          print('respuesta :${responseState.toString()}');
          // Si el estado es Success
          if (responseState is Success) {
            // Puedes acceder a los datos de la respuesta
            MercadoPagoInstallments installments = responseState.data as MercadoPagoInstallments;
            return ClientPaymentInstallmentsContent(_bloc, state, installments);
          }
          
          // Si el estado es Loading
          else if (responseState is Loading) {
            return Center(child: CircularProgressIndicator());
          }

          // Si no hay respuesta válida
          return Center(child: Text('No data available'));
        },
      )
    );
  }
}