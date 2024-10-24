import 'package:ecommerce_flutter/src/domain/models/Product.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/product/update/bloc/AdminProductUpdateBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/product/update/bloc/AdminProductUpdateEvent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/product/update/bloc/AdminProductUpdateState.dart';
import 'package:ecommerce_flutter/src/presentation/utils/BlocForItem.dart';
import 'package:ecommerce_flutter/src/presentation/utils/SelectOptionImageDialog.dart';
import 'package:ecommerce_flutter/src/presentation/widgets/DefaultIconBack.dart';
import 'package:ecommerce_flutter/src/presentation/widgets/Default_textfield.dart';
import 'package:flutter/material.dart';

class AdminProductUpdateContent extends StatelessWidget {

  AdminProductUpdateBloc? bloc;
  AdminProductUpdateState state;
  Product? product;

  AdminProductUpdateContent(this.bloc, this.state, this.product);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: state.formKey,
      child: Stack(
        alignment: Alignment.center,
        children: [
          _imageBackground(context),
          SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,//separa lso elementos al extremo inferior
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _imageProductOne(context),
                      SizedBox(width: 20),
                      _imageProductTwoo(context),                      
                    ],
                  ),                   
                   _cardProductForm(context)
                ],
              ),
            ),
          ),
          DefaultIconBack(left: 15, top: 50)
        ],
      )
    );
  }



  Widget _cardProductForm(BuildContext context){
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height *0.5,
      decoration: BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 0.7),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35),
          topRight: Radius.circular(35)
        )
      ),
      child: Container(
        margin:EdgeInsets.symmetric(horizontal: 35),
        child: Column(
          children: [
            _textNewProduct(),
            _textFieldName(),
            _textFieldDescription(),
            _textFieldPrice(),
            _fabSubmit()
          ],),
      ),
    );
  }

  Widget _fabSubmit(){
    return Container(
      alignment: Alignment.centerRight,
      margin: EdgeInsets.only(top:30),
      child: FloatingActionButton(
        onPressed: (){
          if(state.formKey!.currentState!.validate()){
            bloc?.add(FormSubmit());
          }
          
        },
        backgroundColor: Colors.black,
        child: Icon(
          Icons.check,
          color: Colors.white,
          ),
      ),
    );
  }

  Widget _textNewProduct(){
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(top: 35, left:10, bottom: 10),
      child: Text(
        'NUEVO PRODUCTO',
        style: TextStyle(
          fontSize: 17
        ),
      ),
    );
  }

  Widget _textFieldName(){
    return DefaultTextfield(
      label: 'Nombre del producto',
      icon: Icons.category,
      onChanged: (text){
        bloc?.add(NameChanged(name: BlocFormItem(value: text)));
      },
      initialValue: product?.name ?? '',
      validator: (value){
        return state.name.error;
      },
      color: Colors.black,
    );
  }

  Widget _textFieldDescription(){
    return DefaultTextfield(
      label: 'Descripcion',
      icon: Icons.list,
      onChanged: (text){
        bloc?.add(DescriptionChanged(description: BlocFormItem(value: text)));
      },
      initialValue: product?.description ?? '',
      validator: (value){
        return state.description.error;
      },
      color: Colors.black,
    );
  }

  Widget _textFieldPrice(){
    return DefaultTextfield(
      label: 'precio del producto',
      icon: Icons.money,
      TextInputType: TextInputType.number,
      onChanged: (text){
        bloc?.add(PriceChanged(price: BlocFormItem(value: text)));
      },
      initialValue: product?.price.toString() ?? '',
      validator: (value){
        return state.price.error;
      },
      color: Colors.black,
    );
  }

  Widget _imageProductOne(BuildContext context){
    return GestureDetector(
      onTap: (){
        SelectOptionImageDialog(
          context,
          (){bloc?.add(PickImage(numberFile: 1));}, 
          (){bloc?.add(TakePhoto(numberFile:1));}, 
        );
      },
      child: Container(
        width: 150,
        margin: EdgeInsets.only(top:100),
        child: AspectRatio(
          aspectRatio: 1/1,
          child: ClipOval(
            child:state.file1 != null 
              ? Image.file(
                state.file1!,
                fit: BoxFit.cover,
                )
              :product != null 
              ?FadeInImage.assetNetwork(
                placeholder: 'assets/img/user_image.png',
                image: product!.image1!,
                fit:BoxFit.cover,
                fadeInDuration: Duration(seconds: 1),
              )
              :Image.asset('assets/img/no-image.png',
              fit: BoxFit.cover),
              ),
            ),
        ),
    );
  }

  Widget _imageProductTwoo(BuildContext context){
    return GestureDetector(
      onTap: (){
        SelectOptionImageDialog(
          context,
          (){bloc?.add(PickImage(numberFile: 2));}, 
          (){bloc?.add(TakePhoto(numberFile:2));}, 
        );
      },
      child: Container(
        width: 150,
        margin: EdgeInsets.only(top:100),
        child: AspectRatio(
          aspectRatio: 1/1,
          child: ClipOval(
            child:state.file2 != null 
              ? Image.file(
                state.file2!,
                fit: BoxFit.cover,
                )
              :product != null 
              ?FadeInImage.assetNetwork(
                placeholder: 'assets/img/user_image.png',
                image: product!.image2!,
                fit:BoxFit.cover,
                fadeInDuration: Duration(seconds: 1),
              )
              :Image.asset('assets/img/no-image.png',
              fit: BoxFit.cover),
              ),
            ),
        ),
    );
  }

  Widget _imageBackground(BuildContext context){
    return Image.asset(
      'assets/img/background.jpg',
      width: MediaQuery.of(context).size.width,
      height:MediaQuery.of(context).size.height,
      fit: BoxFit.cover,
      color: Color.fromRGBO(0,0,0,0.7),
      colorBlendMode: BlendMode.darken,
    );
  }
}