import 'package:ecommerce_flutter/src/presentation/pages/client/shoppingBag/ClienShoppingBagItem.dart';
import 'package:ecommerce_flutter/src/presentation/widgets/DefaultButton.dart';
import 'package:flutter/material.dart';

class ClientShoppingBagPage extends StatefulWidget {
  const ClientShoppingBagPage({super.key});

  @override
  State<ClientShoppingBagPage> createState() => _ClientShoppingBagPageState();
}

class _ClientShoppingBagPageState extends State<ClientShoppingBagPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mi Orden'),
      ),
      body: ClienShoppingBagItem(null),
      bottomNavigationBar: Container(
        height: 100,
        color: Colors.grey[300],
        child: Column(
          children: [
            Divider(color: Colors.grey[400],height: 0),
            SizedBox(height: 20),
            Container(
              color: Colors.grey[300],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'TOTAL: \$0',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Container(
                    width: 180,
                    child: Defaultbutton(
                      text:'CONFIRMAR ORDEN' , 
                      onPressed: (){}
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}