import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final String productId =
        ModalRoute.of(context).settings.arguments as String;
    final selectedProduct =
        Provider.of<Products>(context, listen: false).findById(productId);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedProduct.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              child: Image.network(selectedProduct.imageUrl, fit: BoxFit.cover),
              height: 300.0,
              width: double.infinity,
            ),
            SizedBox(height: 10.0),
            Text(
              '\$${selectedProduct.price}',
              style: TextStyle(color: Colors.grey, fontSize: 20.0),
            ),
            SizedBox(height: 10.0),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                selectedProduct.description,
                textAlign: TextAlign.center,
                softWrap: true,
              ),
            )
          ],
        ),
      ),
    );
  }
}
