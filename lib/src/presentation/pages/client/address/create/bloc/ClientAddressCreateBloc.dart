import 'package:ecommerce_flutter/src/presentation/pages/client/address/create/bloc/ClientAddressCreateEvent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/address/create/bloc/ClientAddressCreateState.dart';
import 'package:ecommerce_flutter/src/presentation/utils/BlocForItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClientAddressCreateBloc extends Bloc<ClientAddressCreateEvent, ClientAddressCreateState>{

    ClientAddressCreateBloc(): super (ClientAddressCreateState()){
      on<ClientAddressCreateInitEvent>(_onAddressCreateInitEvent);
      on<AddressChanged>(_onCAddressChanged);
      on<NeighborhoodChanged>(_onNeighborhoodChanged);
      on<FormSubmit>(_onFormSubmit);
    }

    final formKey = GlobalKey<FormState>();

    Future<void>_onAddressCreateInitEvent(ClientAddressCreateInitEvent event,Emitter<ClientAddressCreateState> emit )async{
      emit(
        state.copyWith(
          formKey: formKey
        )
      );
    }

    Future<void>_onCAddressChanged(AddressChanged event,Emitter<ClientAddressCreateState> emit )async{
      emit(
        state.copyWith(
          address: BlocFormItem(
            value: event.address.value,
            error: event.address.value.isNotEmpty ? null :'Ingresa la direccion'
          ),
          formKey: formKey
        )
      );
    }

    Future<void>_onNeighborhoodChanged(NeighborhoodChanged event,Emitter<ClientAddressCreateState> emit )async{
      emit(
        state.copyWith(
          address: BlocFormItem(
            value: event.neighborhood.value,
            error: event.neighborhood.value.isNotEmpty ? null :'Ingresa el barrio'
          ),
          formKey: formKey
        )
      );
    }

    Future<void>_onFormSubmit(FormSubmit event,Emitter<ClientAddressCreateState> emit )async{

    }
}