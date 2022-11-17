import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:moneywise_app/ui/widgets/buttons.dart';
import 'package:moneywise_app/ui/widgets/forms.dart';
import 'package:moneywise_app/ui/widgets/money_planner_item_create.dart';

import '../../shared/theme.dart';

class MoneyPlannerCreatePage extends StatefulWidget {
  const MoneyPlannerCreatePage({Key? key}) : super(key: key);

  @override
  State<MoneyPlannerCreatePage> createState() => _MoneyPlannerCreatePageState();
}

class _MoneyPlannerCreatePageState extends State<MoneyPlannerCreatePage> {
  final planController = TextEditingController(text: '');
  final amountController = TextEditingController(text: '0');

  @override
  void initState() {
    super.initState();

    amountController.addListener(() {
      final text = amountController.text;

      amountController.value = amountController.value.copyWith(
        text: NumberFormat.currency(
          locale: 'id',
          decimalDigits: 0,
          symbol: '',
        ).format(
          int.parse(
            text.replaceAll('.', ''),
          ),
        ),
      );
    });
  }

  addAmount() {
    if (amountController.text == '0') {
      amountController.text = '';
    }
    setState(() {
      amountController.text = amountController.text;
    });
  }

  deleteAmount() {
    if (amountController.text.isNotEmpty) {
      setState(() {
        amountController.text = amountController.text
            .substring(0, amountController.text.length - 1);
        if (amountController.text == '') {
          amountController.text = '0';
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create New Plan'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          const SizedBox(height: 25),
          Text(
            'Send Again',
            style: blackTextStyle.copyWith(
              fontWeight: semiBold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 14),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: const [
                MoneyPlannerItemCreate(
                  imageUrl: 'assets/ic_img_error.png',
                  title: 'Tabungan',
                  isSelected: true,
                ),
                MoneyPlannerItemCreate(
                  imageUrl: 'assets/ic_img_error.png',
                  title: 'Travel',
                ),
                MoneyPlannerItemCreate(
                  imageUrl: 'assets/ic_img_error.png',
                  title: 'Gadget',
                ),
                MoneyPlannerItemCreate(
                  imageUrl: 'assets/ic_img_error.png',
                  title: 'Fashion',
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 14),
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: whiteColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomFormField(
                  title: 'Plan Name',
                  controller: planController,
                ),
                const SizedBox(height: 16),
                Text(
                  'Target Amount',
                  style: blackTextStyle.copyWith(fontWeight: medium),
                ),
                TextFormField(
                  controller: amountController.text == '0'
                      ? addAmount()
                      : amountController.text.isNotEmpty
                          ? deleteAmount()
                          : null,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(
                        left: 8,
                        top: 12,
                        bottom: 12,
                      ),
                      child: Text(
                        'Rp ',
                        style: blackTextStyle,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    hintStyle: greyTextStyle,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    contentPadding: const EdgeInsets.all(12),
                  ),
                ),
                // CustomFormField(
                //   title: 'Target Amount',
                //   controller: amountController,
                // ),
                const SizedBox(height: 20),
              ],
            ),
          ),
          const SizedBox(height: 150),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                backgroundColor: (planController.text.isNotEmpty &&
                        amountController.text.isNotEmpty)
                    ? purpleColor
                    : greyColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(56),
                ),
              ),
              child: Text(
                'Continue',
                style: whiteTextStyle.copyWith(
                  fontWeight: semiBold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
