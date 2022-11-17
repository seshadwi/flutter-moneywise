import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:moneywise_app/shared/shared_methods.dart';
import 'package:moneywise_app/shared/theme.dart';

import '../../models/transaction_model.dart';

class HomeLatestTransactionItem extends StatelessWidget {
  final TransactionModel transaction;

  const HomeLatestTransactionItem({
    Key? key,
    required this.transaction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      child: Row(
        children: [
          transaction.transactionType!.thumbnail == ''
              ? Image.asset(
                  'assets/ic_img_error.png',
                  width: 48,
                )
              : Image.network(
                  transaction.transactionType!.thumbnail!,
                  width: 48,
                ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction.transactionType!.name.toString(),
                  style: blackTextStyle.copyWith(
                    fontWeight: medium,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  DateFormat('MMM dd')
                      .format(transaction.createdAt ?? DateTime.now()),
                  style: greyTextStyle.copyWith(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Text(
            formatCurrency(
              transaction.amount ?? 0,
              symbol: transaction.transactionType?.action == 'cr' ? '+ ' : '- ',
            ),
            style: blackTextStyle.copyWith(
              fontWeight: medium,
              fontSize: 16,
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}
