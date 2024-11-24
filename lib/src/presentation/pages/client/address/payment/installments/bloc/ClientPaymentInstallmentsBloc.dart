import 'package:ecommerce_flutter/src/domain/userCases/mercadoPago/MercadoPagoUseCases.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/address/payment/installments/bloc/ClientPaymentInstallmentsEvent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/address/payment/installments/bloc/ClientPaymentInstallmentsState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClientPaymentInstallmentsBloc extends Bloc<ClientPaymentInstallmentsEvent, ClientPaymentInstallmentsState>{

  MercadoPagoUseCases mercadoPagoUseCases;

  ClientPaymentInstallmentsBloc(this.mercadoPagoUseCases): super(ClientPaymentInstallmentsState()){
    on<GetInstallments>(_onGetInstallments);
  } 

  Future<void> _onGetInstallments(GetInstallments event, Emitter<ClientPaymentInstallmentsState> emit) async {
    emit(state.copyWith(response: Loading())); // Emitir el estado de carga
    print('Sending to API: firstSixDigits=${event.firstSixDigits}, amount=${event.amount}');

    // Llamada a la API
    Resource response = await mercadoPagoUseCases.getInstallmentsUSeCase.run(event.firstSixDigits, event.amount);
    
    // Verifica si el estado es Success
    if (response is Success) {
      // Accede a los datos solo si la respuesta es un Success
      print('Response data: ${response.data}');
      emit(state.copyWith(response: response));
    } else if (response is Error) {
        // Si hay un error, imprime el mensaje
        print('Error: ${response.message}');
        emit(state.copyWith(response: response));
      } else {
        // Manejo adicional para otros casos si es necesario
        print('Estado inesperado: $response');
      }

  }

}