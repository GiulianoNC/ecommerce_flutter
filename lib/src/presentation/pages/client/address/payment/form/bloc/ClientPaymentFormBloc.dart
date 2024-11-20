import 'package:ecommerce_flutter/src/presentation/pages/client/address/payment/form/bloc/ClientPaymentFormEvent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/address/payment/form/bloc/ClientPaymentFormState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClientPaymentFormBloc extends Bloc<ClientPaymentFormEvent, ClientPaymentFormState>{

  ClientPaymentFormBloc(): super(ClientPaymentFormState()){
    on<ClientPaymentFormInitEvent>(_onClientPaymentFormInitEvent);
    on<CreditCardChanged>(_onCreditCardChanged);
    on<FormSubmit>(_onFormSubmit);
  }

  final formKey = GlobalKey<FormState>();


  Future<void> _onClientPaymentFormInitEvent(ClientPaymentFormInitEvent event,Emitter<ClientPaymentFormState> emit,) async {
    emit(
      state.copyWith(formKey: formKey)
    );
  }

  Future<void> _onCreditCardChanged(CreditCardChanged event,Emitter<ClientPaymentFormState> emit,) async {
    emit(
      state.copyWith(
        cardNumber:  event.cardNumber,
        expiredDate:  event.expiredDate,
        cardHolderName:  event.cardHolderName,
        cvvCode:  event.cvvCode,
        isCvvFocused:  event.isCvvFocused,
        formKey: formKey
      )
    );
  }

  Future<void> _onFormSubmit(FormSubmit event,Emitter<ClientPaymentFormState> emit,) async {
    print('cardNumber ${state.cardNumber}');
    print('expiredDate ${state.expiredDate}');
    print('cardHolderName ${state.cardHolderName}');
    print('cvvCode ${state.cvvCode}');

  }

}
