import 'package:ecommerce_flutter/src/domain/models/User.dart';
import 'package:ecommerce_flutter/src/presentation/widgets/Default_textfield.dart';
import 'package:flutter/material.dart';

class ProfileUpdateContent extends StatelessWidget {
  
  User? user;

  ProfileUpdateContent(this.user);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          _imageBackGround(context),
          Column(
            children: [
              _imageProfile(),
              Spacer(),
              _cardProfileInfo(context)
            ],
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

  Widget _imageProfile(){
    return Container(
      margin: EdgeInsets.only(top:100),
      width: 150,
      child: AspectRatio(
        aspectRatio: 1/1,
        child: ClipOval(
          child: FadeInImage.assetNetwork(
            placeholder: 'assets/img/user.png',
            image: 'https://kenkarlo.com/assets/images/author/61460-gary-b.jpeg',
            fit:BoxFit.cover,
            fadeInDuration: Duration(seconds: 1),
            ),
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
          //errorText: snapshot.error?.toString(),
          onChanged: (text){
            //bloc?.add(EmailChanged(email: BlocFormItem(value: text)));
          },
          /*validator: (value){
            return state.email.error;
          },*/
        )
    );
  }

  Widget _textFieldLastName(){
    return Container(
        margin: EdgeInsets.only(left: 25, right: 25),
        child: DefaultTextfield(
          label: 'Apellido',
          icon: Icons.person_outline,
          //errorText: snapshot.error?.toString(),
          onChanged: (text){
            //bloc?.add(EmailChanged(email: BlocFormItem(value: text)));
          },
          /*validator: (value){
            return state.email.error;
          },*/
        )
    );
  }

  Widget _textFieldPhone(){
    return Container(
        margin: EdgeInsets.only(left: 25, right: 25),
        child: DefaultTextfield(
          label: 'Telefono',
          icon: Icons.phone,
          //errorText: snapshot.error?.toString(),
          onChanged: (text){
            //bloc?.add(EmailChanged(email: BlocFormItem(value: text)));
          },
          /*validator: (value){
            return state.email.error;
          },*/
        )
    );
  }

  Widget _cardProfileInfo(BuildContext context){
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height *0.35,
      decoration: BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 0.7),
        borderRadius: BorderRadius.only(
          topLeft:Radius.circular(25),
          topRight: Radius.circular(25) )
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: Container(
          margin: EdgeInsets.only(top: 10),
          child: Column(
            children: [
              _textFieldName(),
              _textFieldLastName(),
              _textFieldPhone(),
              Container(
                margin: EdgeInsets.only(right: 10, bottom: 10),
                alignment: Alignment.centerRight,
                child: FloatingActionButton(
                  backgroundColor: Colors.black,
                  onPressed: (){
                
                  },
                  child: Icon(Icons.check,
                  color: Colors.white,
                  ),
                  ),
              ),
                
          
            ],
          ),
        ),
      ),
    );
  }

}