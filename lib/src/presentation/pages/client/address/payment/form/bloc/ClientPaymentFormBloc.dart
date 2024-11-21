import 'package:ecommerce_flutter/src/domain/models/MercadoPagoIdentificationType.dart';
import 'package:ecommerce_flutter/src/domain/userCases/mercadoPago/MercadoPagoUseCases.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/address/payment/form/bloc/ClientPaymentFormEvent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/address/payment/form/bloc/ClientPaymentFormState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClientPaymentFormBloc extends Bloc<ClientPaymentFormEvent, ClientPaymentFormState>{

  MercadoPagoUseCases mercadoPagoUseCases;

  ClientPaymentFormBloc(this.mercadoPagoUseCases): super(ClientPaymentFormState()){
    on<ClientPaymentFormInitEvent>(_onClientPaymentFormInitEvent);
    on<CreditCardChanged>(_onCreditCardChanged);
    on<IdentificationTypeChanged>(_onIdentificationTypeChanged);
    on<IdentificationNumberChanged>(_onIdentificationNumberChanged);
    on<FormSubmit>(_onFormSubmit);
  }

  final formKey = GlobalKey<FormState>();


  Future<void> _onClientPaymentFormInitEvent(ClientPaymentFormInitEvent event,Emitter<ClientPaymentFormState> emit,) async {
    emit(
      state.copyWith(
        formKey: formKey
      )
    );

    Resource response = await mercadoPagoUseCases.getIdentificationTypes.run();
    if(response is Success){
      List<MercadoPagoIdentificationType> identificationType = response.data;
      identificationType.forEach((id){
        print('Identification: ${id.toJson()}');
      });
      emit(
        state.copyWith(
          identificationTypes: identificationType,
          formKey: formKey
        )
      );
    }

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
    print('identification type ${state.identificationType}');
    print('identification numer ${state.identificationNumber}');

  }

  Future<void> _onIdentificationTypeChanged(IdentificationTypeChanged event,Emitter<ClientPaymentFormState> emit,) async {
    emit(
        state.copyWith(
          identificationType: event.identificationType,
          formKey: formKey
        )
      );
  }

  Future<void> _onIdentificationNumberChanged(IdentificationNumberChanged event,Emitter<ClientPaymentFormState> emit,) async {  
    emit(
      state.copyWith(
        identificationNumber: event.identificationNumber,
        formKey: formKey
      )
    );  
  }

}
