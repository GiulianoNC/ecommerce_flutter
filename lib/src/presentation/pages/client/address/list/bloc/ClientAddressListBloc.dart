import 'package:ecommerce_flutter/src/domain/models/Address.dart';
import 'package:ecommerce_flutter/src/domain/models/AuthResponse.dart';
import 'package:ecommerce_flutter/src/domain/userCases/address/AddressUseCases.dart';
import 'package:ecommerce_flutter/src/domain/userCases/address/DeleteAddressFromSessionUseCase.dart';
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
    on<ChangedRadioValue>(_onChangedRadioValue);
    on<SetAddressSessions>(_onSetAddressSessions);
    on<DeleteAddress>(_onDeleteAddress); 
    //on<DeleteAddressFromSessionUseCase>(_onDeleteAddressFromSessionUseCase);  
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

  Future<void> _onChangedRadioValue(ChangedRadioValue event,Emitter<ClientAddressListState> emit,) async {
    await addressUseCases.saveAdressInSession.run(event.address);
    emit(
      state.copyWith(
        radioValue: event.radioValue
      )
    );
    
  }

  Future<void> _onSetAddressSessions(SetAddressSessions event,Emitter<ClientAddressListState> emit,) async {
    Address? addressSession = await addressUseCases.getAddressSession.run();
    if(addressSession != null){
      int index = event.addressList.indexWhere((address)=>address.id == addressSession.id);
      if(index != -1){//ya hemos seleccionado una direccion y esta guaardada en sesion
        emit(
          state.copyWith(
            radioValue: index
          )
        );
      }
    }    
  }

  Future<void> _onDeleteAddress(DeleteAddress event,Emitter<ClientAddressListState> emit,) async {
      emit(
        state.copyWith(
          response: Loading()
        )
      );
      Resource response = await addressUseCases.delete.run(event.id);
      emit(
        state.copyWith(
          response: response
        )
      );
      Address? addressSession = await addressUseCases.getAddressSession.run();
      if(addressSession != null){
        if(addressSession.id == event.id){
          await addressUseCases.deleteFromSession.run();
          emit(
          state.copyWith(
            radioValue: null
          )
        );
        }
      }
    
  }

 /* Future<void> _onDeleteAddressFromSessionUseCase(DeleteAddressFromSessionUseCase event,Emitter<ClientAddressListState> emit,) async {

  }*/
}
