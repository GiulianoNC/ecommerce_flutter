import 'package:ecommerce_flutter/src/domain/userCases/mercadoPago/MercadoPagoUseCases.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/address/payment/installments/bloc/ClientPaymentInstallmentsEvent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/address/payment/installments/bloc/ClientPaymentInstallmentsState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClientPaymentInstallmentsBloc extends Bloc<ClientPaymentInstallmentsEvent, ClientPaymentInstallmentsState>{

  MercadoPagoUseCases mercadoPagoUseCases;

  ClientPaymentInstallmentsBloc(this.mercadoPagoUseCases): super(ClientPaymentInstallmentsState()){
    on<GetInstallments>(_onGetInstallments);
    on<InstallmentsChanged>(_onInstallmentsChanged);
  } 

  Future<void> _onGetInstallments(GetInstallments event, Emitter<ClientPaymentInstallmentsState> emit) async {
    emit(
      state.copyWith(
        response: Loading()
      )
    ); 
    print('Sending to API: firstSixDigits=${event.firstSixDigits}, amount=${event.amount}');

    // Llamada a la API
    Resource response = await mercadoPagoUseCases.getInstallmentsUSeCase.run(event.firstSixDigits, event.amount);
    emit(
      state.copyWith(
        response: response
      )
    );
  }
  
  Future<void> _onInstallmentsChanged(InstallmentsChanged event, Emitter<ClientPaymentInstallmentsState> emit) async {
    emit(
      state.copyWith(
        installments: event.installment
      )
    );
  
  }
  
}