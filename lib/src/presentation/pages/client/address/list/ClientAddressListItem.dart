import 'package:ecommerce_flutter/src/domain/models/Address.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/address/list/bloc/ClientAddressListBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/address/list/bloc/ClientAddressListEvent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/address/list/bloc/ClientAddressListState.dart';
import 'package:flutter/material.dart';

class ClientAddressListItem extends StatelessWidget {
  
  ClientAddressListBloc? bloc;
  ClientAddressListState state;
  Address address;
  int index;//manejar el radio button

  ClientAddressListItem(this.bloc,this.state, this.address, this.index);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Radio(value:index , 
            groupValue: state.radioValue, 
            onChanged: (value){
              bloc?.add(ChangedRadioValue(radioValue: value!, address:address ));
            }
          ),
          title: Text(address.address,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
         ),
         subtitle:Text(address.neighborhood,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
         ),
        ),
        Divider(color: Colors.grey[300],indent: 30, endIndent: 30)//margenes
      ],
    );
  }
}