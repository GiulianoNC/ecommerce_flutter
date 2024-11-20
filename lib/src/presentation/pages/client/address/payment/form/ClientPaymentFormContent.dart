import 'package:ecommerce_flutter/src/presentation/pages/client/address/payment/form/bloc/ClientPaymentFormBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/address/payment/form/bloc/ClientPaymentFormEvent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/address/payment/form/bloc/ClientPaymentFormState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class ClientPaymentFormContent extends StatelessWidget {

  ClientPaymentFormBloc? bloc;
  ClientPaymentFormState state;

  ClientPaymentFormContent(this.bloc, this.state);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CreditCardWidget(
          cardNumber: state.cardNumber,
          expiryDate: state.expiredDate,
          cardHolderName: state.cardHolderName,
          cvvCode: state.cvvCode,
          showBackView: state.isCvvFocused, //true when you want to show cvv(back) view
          onCreditCardWidgetChange: (CreditCardBrand brand) {}, // Callback for anytime credit card brand is changed
        ),
        CreditCardForm(
          formKey: state.formKey ?? new GlobalKey(), // Required 
          cardNumber: state.cardNumber, // Required
          expiryDate: state.expiredDate, // Required
          cardHolderName: state.cardHolderName, // Required
          cvvCode: state.cvvCode, // Required
          onCreditCardModelChange: (CreditCardModel data) {
            bloc?.add(CreditCardChanged(
              cardNumber: data.cardNumber, 
              expiredDate: data.expiryDate, 
              cardHolderName: data.cardHolderName, 
              cvvCode: data.cvvCode, 
              isCvvFocused: data.isCvvFocused
            ));
          }, // acceso a todos los datos apra cambiar el stado de las variables
          obscureCvv: true, 
          obscureNumber: true,
          isHolderNameVisible: true,
          isCardNumberVisible: true,
          isExpiryDateVisible: true,
          enableCvv: true,
          cvvValidationMessage: 'Please input a valid CVV',
          dateValidationMessage: 'Please input a valid date',
          numberValidationMessage: 'Please input a valid number',
          cardNumberValidator: (String? cardNumber){},
          expiryDateValidator: (String? expiryDate){},
          cvvValidator: (String? cvv){},
          cardHolderValidator: (String? cardHolderName){},
          onFormComplete: () {
          // callback to execute at the end of filling card data
          },
          autovalidateMode: AutovalidateMode.always,
          disableCardNumberAutoFillHints: false,
          inputConfiguration: const InputConfiguration(
            cardNumberDecoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Number',
              hintText: 'XXXX XXXX XXXX XXXX',
            ),
            expiryDateDecoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Expired Date',
              hintText: 'XX/XX',
            ),
            cvvCodeDecoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'CVV',
              hintText: 'XXX',
            ),
            cardHolderDecoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Card Holder',
            ),
            cardNumberTextStyle: TextStyle(
              fontSize: 10,
              color: Colors.black,
            ),
            cardHolderTextStyle: TextStyle(
              fontSize: 10,
              color: Colors.black,
            ),
            expiryDateTextStyle: TextStyle(
              fontSize: 10,
              color: Colors.black,
            ),
            cvvCodeTextStyle: TextStyle(
              fontSize: 10,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}