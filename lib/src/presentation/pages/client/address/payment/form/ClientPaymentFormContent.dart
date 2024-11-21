import 'package:ecommerce_flutter/src/presentation/pages/client/address/payment/form/bloc/ClientPaymentFormBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/address/payment/form/bloc/ClientPaymentFormEvent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/address/payment/form/bloc/ClientPaymentFormState.dart';
import 'package:ecommerce_flutter/src/presentation/widgets/Default_textfield.dart';
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
        _creditCardWidget(),
        _creditCardForm(),
        _dropDownIdentificationTypes(),
        _textfieldIdentificationNumber()        
      ],
    );
  }

  Widget _textfieldIdentificationNumber(){
    return Container(
      margin: EdgeInsets.only(right: 17, left: 20, top: 5),
      child: DefaultTextfield(
        label: 'Identification number', 
        icon: Icons.document_scanner,
        color: Colors.grey, 
        onChanged: (text){
          bloc?.add(IdentificationNumberChanged(identificationNumber: text));
        }
      ),
    );
  }

  Widget _dropDownIdentificationTypes(){
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 5),
      child: DropdownButton(
        hint: Text('Document type',
        style: TextStyle(
          color: Colors.grey,
          fontSize: 14
        ),
        ),
        value: state.identificationType,
        items: _dropdownMenuItem(), 
        onChanged: (value){
          bloc?.add(IdentificationTypeChanged(identificationType: value!));
        }
      ),
    );
  }

  List<DropdownMenuItem<String>> _dropdownMenuItem(){
    List<DropdownMenuItem<String>> list = [];
    state.identificationTypes.forEach((identification){
      list.add(
        DropdownMenuItem(
          child: Container(
            margin: EdgeInsets.only(top:7),
            child: Text(identification.name),
          ),
          value: identification.id,
        )
      );
    });
    return list;
  }

  Widget _creditCardForm(){
    return CreditCardForm(
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
    );
  }

  Widget _creditCardWidget(){
    return CreditCardWidget(
      cardNumber: state.cardNumber,
      expiryDate: state.expiredDate,
      cardHolderName: state.cardHolderName,
      cvvCode: state.cvvCode,
      showBackView: state.isCvvFocused, //true when you want to show cvv(back) view
      onCreditCardWidgetChange: (CreditCardBrand brand) {}, // Callback for anytime credit card brand is changed
      );
  }
}