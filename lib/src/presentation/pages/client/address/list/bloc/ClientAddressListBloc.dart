import 'package:ecommerce_flutter/src/domain/models/AuthResponse.dart';
import 'package:ecommerce_flutter/src/domain/userCases/address/AddressUseCases.dart';
import 'package:ecommerce_flutter/src/domain/userCases/auth/AuthUseCases.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/address/list/bloc/ClientAddressListEvent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/address/list/bloc/ClientAddressListState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';

class ClientAddressListBloc extends Bloc<ClientAddressListEvent, ClientAddressListState> {

  AddressUseCases addressUseCases;
  Authusecases authusecases;

  ClientAddressListBloc(this.addressUseCases,this.authusecases) : super(ClientAddressListState()) {
    on<GetUserAddress>(_onGetUserAddress);
  }

  Future<void> _onGetUserAddress(GetUserAddress event,Emitter<ClientAddressListState> emit,) async {
    AuthResponse? authResponse = await authusecases.getUserSession.run();
    if(authResponse != null){
      emit(
      state.copyWith(
        response: Loading()
      )
    );
    Resource response = await addressUseCases.getUserAddress.run(authResponse.user.id!);
    emit(
      state.copyWith(
        response: response
      )
    );
    }
    
  }
}
