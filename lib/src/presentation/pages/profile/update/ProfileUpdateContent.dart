import 'package:ecommerce_flutter/src/domain/models/User.dart';
import 'package:ecommerce_flutter/src/presentation/pages/profile/update/bloc/ProfileUpdateEvent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/profile/update/bloc/ProfileUpdateBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/profile/update/bloc/ProfileUpdateState.dart';
import 'package:ecommerce_flutter/src/presentation/utils/BlocForItem.dart';
import 'package:ecommerce_flutter/src/presentation/utils/SelectOptionImageDialog.dart';
import 'package:ecommerce_flutter/src/presentation/widgets/Default_textfield.dart';
import 'package:flutter/material.dart';

class ProfileUpdateContent extends StatelessWidget {
  
  ProfileUpdateBloc? bloc;
  ProfileUpdateState state;
  User? user;

  ProfileUpdateContent(this.bloc,this.state,this.user);

  @override
  Widget build(BuildContext context) {
    return  Form(
      key: state.formKey,
      child: Stack(
        alignment: Alignment.center,
        children: [
          _imageBackGround(context),
          SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _imageProfile(context),
                  //Spacer(),
                  _cardProfileInfo(context)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _imageBackGround(BuildContext context){
    return Image.asset(
      'assets/img/background3.jpg',
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      fit: BoxFit.cover,
      color: Color.fromRGBO(0, 0, 0, 0.7),
      colorBlendMode: BlendMode.darken,
    );
  }

  Widget _imageProfile(BuildContext context){
    return GestureDetector(
      onTap: (){
        SelectOptionImageDialog(
          context,
          (){bloc?.add(ProfileUpdatePickImage());},//seleccionar imagen de la galeria
          (){bloc?.add(ProfileUpdateTakePhoto());}//tomar foto de la camara
        );
      },
      child: Container(
        margin: EdgeInsets.only(top:100),
        width: 150,
        child: AspectRatio(
          aspectRatio: 1/1,
          child: ClipOval(
            child:state.image != null 
            ?Image.file(state.image!,
            fit: BoxFit.cover
            ) : FadeInImage.assetNetwork(//si el ussuario eleijo de su galeria entonces vamos a msotrar la imagen seleccionada por el usuario, sino se quedara la imagen de la url o el asset img
              placeholder: 'assets/img/user_image.png',
              image: user!.image!,
              fit:BoxFit.cover,
              fadeInDuration: Duration(seconds: 1),
              ),
          ),
        ),
      ),
    );
  }

  Widget _fabSubmit(){
    return Container(
      margin: EdgeInsets.only(right: 10, top: 20),
      alignment: Alignment.centerRight,
      child: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: (){
          bloc?.add(ProfileUpdateFormSubmit());
        },
        child: Icon(Icons.check,
        color: Colors.white,
        ),
        ),
    );
  }

  Widget _textUpdateInfo(){
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(top:25, left:35, bottom: 10),
      child:Text('ACTUALIZAR INFORMACIÓN',
      style: TextStyle(
        fontSize: 17
      ),
      ),
    );
  }
  
  Widget _textFieldName(){
    return Container(
        margin: EdgeInsets.only(left: 25, right: 25),
        child: DefaultTextfield(
          label: 'Nombre',
          icon: Icons.person,
          color: Colors.black,
          initialValue: user?.name ?? '',
          //errorText: snapshot.error?.toString(),
          onChanged: (text){
            bloc?.add(ProfileUpdateNameChanged(name: BlocFormItem(value: text)));
          },
          validator: (value){
            return state.name.error;
          },
        )
    );
  }

  Widget _textFieldLastName(){
    return Container(
        margin: EdgeInsets.only(left: 25, right: 25),
        child: DefaultTextfield(
          label: 'Apellido',
          icon: Icons.person_outline,
          color: Colors.black,
          initialValue: user?.lastname ?? '',
          //errorText: snapshot.error?.toString(),
          onChanged: (text){
            bloc?.add(ProfileUpdateLastNameChanged(lastname: BlocFormItem(value: text)));
          },
          validator: (value){
            return state.lastname.error;
          },
        )
    );
  }

  Widget _textFieldPhone(){
    return Container(
        margin: EdgeInsets.only(left: 25, right: 25),
        child: DefaultTextfield(
          label: 'Telefono',
          icon: Icons.phone,
          color: Colors.black,
          initialValue: user?.phone ?? '',
          //errorText: snapshot.error?.toString(),
          onChanged: (text){
            bloc?.add(ProfileUpdatePhoneChanged(phone: BlocFormItem(value: text)));
          },
          validator: (value){
            return state.phone.error;
          },
        )
    );
  }

  Widget _cardProfileInfo(BuildContext context){
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height *0.45,
      decoration: BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 0.7),
        borderRadius: BorderRadius.only(
          topLeft:Radius.circular(35),
          topRight: Radius.circular(35) )
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              _textUpdateInfo(),
              _textFieldName(),
              _textFieldLastName(),
              _textFieldPhone(),
              _fabSubmit()
            ],
          ),
      ),
    );
  }

}