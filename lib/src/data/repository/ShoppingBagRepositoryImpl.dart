import 'package:ecommerce_flutter/src/data/dataSource/local/SharedPref.dart';
import 'package:ecommerce_flutter/src/domain/models/Product.dart';
import 'package:ecommerce_flutter/src/domain/repository/ShoppingBagRepository.dart';


class ShoppingBagRepositoryImpl implements ShoppingBagRepository{
  
  SharedPref sharedPref;

  ShoppingBagRepositoryImpl(this.sharedPref);

  @override
  Future<void>add(Product product) async {
    final data = await sharedPref.read('shopping_bag');
    List<Product> selectedProducts=[];
    if(data == null){
      await sharedPref.save('shopping_bag', selectedProducts);
    }else{
      selectedProducts = Product.fromJsonList(data).toList();//obetenemos una llista de productos donde se almacena en la lsita de productos
      int index = selectedProducts.indexWhere((p)=> p.id == product.id);//nos devuelve el producto donde valida si el product es igual al que me envian al parametro
      if(index == -1){//el producto no existe en la bolsa de compras(añadir)
        product.quantity ??= 1; //si viene nulo el producto, se le asigna 1
        selectedProducts.add(product);
      }else{//ya existe el producto dentro de la lista(actualizar)
        selectedProducts[index].quantity = product.quantity;
      }
      await sharedPref.save('shopping_bag', selectedProducts);
    }
  }
  
  @override
  Future<void> deleteItem(Product product)async {
    final data = await sharedPref.read('shopping_bag');
    if(data == null){return;}
    List<Product> selectedProducts=  Product.fromJsonList(data).toList();
    selectedProducts.removeWhere((p) =>p.id == product.id);
    await sharedPref.save('shopping_bag', selectedProducts);
  }
  
  @override
  Future<void> deleteShoppingBag() async{
    await sharedPref.remove('shopping_bag'); 
  }
  
  @override
  Future<List<Product>> getProducts() async {
    final data = await sharedPref.read('shopping_bag');
    print('Data read from SharedPref: $data');
    if(data == null){
      return [];
    }
    List<Product> selectedProducts= Product.fromJsonList(data).toList();
    return selectedProducts;
  }
  
  @override
  Future<double> getTotal() async{
    final data = await sharedPref.read('shopping_bag');
    print('Data read from SharedPref: $data');
    if(data == null){
      return 0;
    }
    double total =0;
    List<Product> selectedProducts= Product.fromJsonList(data).toList();
     selectedProducts.forEach((product){
      total = total +(product.quantity! * product.price);
    });
    return total;
    
  }
  

}