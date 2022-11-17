import 'package:flutter/material.dart';
import 'package:moneywise_app/shared/theme.dart';

import '../../shared/shared_methods.dart';

class MoneyPlannnerItem extends StatelessWidget {
  const MoneyPlannnerItem({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.amount,
    required this.total,
    required this.percentage,
    this.isSelected = false,
    this.value = 0.0,
  }) : super(key: key);

  final String imageUrl;
  final String title;
  final int amount;
  final int percentage;
  final int total;
  final double value;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      margin: const EdgeInsets.only(
        bottom: 18,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: whiteColor,
        border: isSelected
            ? Border.all(
                width: 2,
                color: blueColor,
              )
            : null,
      ),
      child: Row(
        children: [
          Image.asset(
            imageUrl,
            height: 48,
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
              const SizedBox(height: 5),
              SizedBox(
                width: 227,
                height: 5,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(55),
                  child: LinearProgressIndicator(
                    value: value,
                    minHeight: 5,
                    valueColor: AlwaysStoppedAnimation(purpleColor),
                    backgroundColor: lightBgColor,
                  ),
                ),
              ),
              const SizedBox(height: 7),
              SizedBox(
                height: 20,
                width: 227,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      formatCurrency(amount),
                      style: blackTextStyle.copyWith(
                        fontWeight: semiBold,
                        fontSize: 12,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          '$percentage%',
                          style: greyTextStyle.copyWith(
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          ' of Rp ${formatCurrency(total)}',
                          style: greyTextStyle.copyWith(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
