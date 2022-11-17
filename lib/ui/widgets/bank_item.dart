import 'package:flutter/material.dart';

import '../../models/payment_method_model.dart';
import '../../shared/theme.dart';

class BankItem extends StatelessWidget {
  final PaymentMethodModel paymentMethod;
  final bool isSelected;

  const BankItem({
    Key? key,
    required this.paymentMethod,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 18,
      ),
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: whiteColor,
        border: Border.all(
          width: 2,
          color: isSelected ? blueColor : whiteColor,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          paymentMethod.thumbnail == ''
              ? Column(
                  children: [
                    Image.asset(
                      'assets/ic_warning.png',
                      height: 30,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Unable to load icon',
                      style: greyTextStyle.copyWith(
                        fontSize: 10,
                      ),
                    ),
                  ],
                )
              : Image.network(
                  paymentMethod.thumbnail.toString(),
                  height: 30,
                ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                paymentMethod.name.toString(),
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                '50 mins',
                style: greyTextStyle.copyWith(
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
