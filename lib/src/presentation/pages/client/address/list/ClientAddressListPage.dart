import 'package:ecommerce_flutter/src/domain/models/Address.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/address/list/ClientAddressListItem.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/address/list/bloc/ClientAddressListBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/address/list/bloc/ClientAddressListEvent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/address/list/bloc/ClientAddressListState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ClientAddressListPage extends StatefulWidget {
  const ClientAddressListPage({super.key});

  @override
  State<ClientAddressListPage> createState() => _ClientAddressListPageState();
}

class _ClientAddressListPageState extends State<ClientAddressListPage> {

  ClientAddressListBloc? _bloc;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp){
      _bloc?.add(GetUserAddress());
    });
  }

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<ClientAddressListBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Mis direcciones'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushNamed(context, 'client/address/create');
        },
        backgroundColor: Colors.black,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: BlocListener<ClientAddressListBloc,ClientAddressListState>(
        listener: (context, state){
          final responseState = state.response;
          if(responseState is Success){ 
            if(responseState.data is bool){//si la direccion se borró correctamente
              _bloc?.add(GetUserAddress());
            }
            
          }
          if(responseState is Error){
            Fluttertoast.showToast(msg: responseState.message, toastLength: Toast.LENGTH_LONG);
          }
        },
        child:BlocBuilder<ClientAddressListBloc,ClientAddressListState>(
          builder: (context,state){
            final responseState = state.response;
           if(responseState is Success){ 
            List<Address> address = responseState.data as List<Address>;
            _bloc?.add(SetAddressSessions(addressList: address));
            return ListView.builder(
              itemCount: address.length,
              itemBuilder: (context, index){
                return ClientAddressListItem(_bloc,state,address[index],index); 
              });
            }else{
               return Center(child: Text('No se encontraron direcciones'));
            }
            //return Text('Direccion');
          }
        ) ,
        )
    );
  }
}