import 'package:ecommerce_flutter/src/domain/models/MercadoPagoInstallments.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/address/payment/installments/bloc/ClientPaymentInstallmentsBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/address/payment/installments/bloc/ClientPaymentInstallmentsEvent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/address/payment/installments/bloc/ClientPaymentInstallmentsState.dart';
import 'package:ecommerce_flutter/src/presentation/widgets/DefaultButton.dart';
import 'package:flutter/material.dart';

class ClientPaymentInstallmentsContent extends StatelessWidget {

  MercadoPagoInstallments mercadoPagoInstallments;
  ClientPaymentInstallmentsBloc? bloc;
  ClientPaymentInstallmentsState state;

  ClientPaymentInstallmentsContent(
    this.bloc,
    this.state,
    this.mercadoPagoInstallments
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20,right: 20, top: 20, bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _textInstallments(),
          _dropDownInstallments(),
          Spacer(),
          _buttonPay()
        ],
      ),
    );
  }

  Widget _buttonPay(){
    return Container(
      child: Defaultbutton(
        text: 'Pagar', 
        onPressed: (){

        }
      ),
    );
  }

  Widget _textInstallments(){
    return Text('Elije el numero de cuotas',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18
      ),
    );
  }

  Widget _dropDownInstallments(){
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 5),
      child: DropdownButton(
        hint: Text('Numero de cuotas ',
        style: TextStyle(
          color: Colors.grey,
          fontSize: 14
        ),
        ),
        value: state.installments,
        items: _dropdownMenuItem(), 
        onChanged: (value){
          bloc?.add(InstallmentsChanged(installment: value!));
        }
      ),
    );
  }

  List<DropdownMenuItem<String>> _dropdownMenuItem(){
    List<DropdownMenuItem<String>> list = [];
    mercadoPagoInstallments.payerCosts.forEach((installment){
      list.add(
        DropdownMenuItem(
          child: Container(
            margin: EdgeInsets.only(top:7),
            child: Text(installment.recommendedMessage),
          ),
          value: installment.installments.toString(),
        )
      );
    });
    return list;
  }
}