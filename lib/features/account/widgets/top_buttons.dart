import 'package:e_commerce_app/features/account/widgets/account_button.dart';
import 'package:flutter/material.dart';

class TopButton extends StatefulWidget {
  const TopButton({Key? key}) : super(key: key);

  @override
  State<TopButton> createState() => _TopButtonState();
}

class _TopButtonState extends State<TopButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            AccountButton(txt: 'Your Orders', onTap: (){}),
            AccountButton(txt: 'Turn Seller', onTap: (){}),
          ],
        ),
        const SizedBox(height: 10,),
        Row(
          children: [
            AccountButton(txt: 'Log Out', onTap: (){}),
            AccountButton(txt: 'Your Wish List', onTap: (){}),
          ],
        ),
      ],
    );
  }
}