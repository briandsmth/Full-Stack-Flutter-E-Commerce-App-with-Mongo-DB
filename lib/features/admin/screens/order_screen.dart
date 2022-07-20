import 'package:e_commerce_app/features/account/widgets/product_view.dart';
import 'package:e_commerce_app/features/admin/services/admin_services.dart';
import 'package:e_commerce_app/features/commonWidgets/loader.dart';
import 'package:e_commerce_app/features/order_detail/screens/order_detail_screen.dart';
import 'package:e_commerce_app/models/order.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  List<Order>? orders;
  AdminServices adminServices = AdminServices();
  @override
  void initState() {
    getOrders();
    super.initState();
  }

  getOrders() async {
    orders = await adminServices.getAllOrders(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return orders == null
        ? const Loader()
        : GridView.builder(
            itemCount: orders!.length,
            gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (context, index) {
              final orderData = orders![index];
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, OrderDetailScreen.routeName,
                      arguments: orderData);
                },
                child: SizedBox(
                  height: 140,
                  child: ProductView(
                    link: orderData.products[0].images[0],
                  ),
                ),
              );
            },
          );
  }
}
