import 'package:flutter/material.dart';
import 'package:moneywise_app/shared/theme.dart';
import 'package:moneywise_app/ui/widgets/buttons.dart';
import 'package:moneywise_app/ui/widgets/money_planner_item.dart';

class MoneyPlannerPage extends StatelessWidget {
  const MoneyPlannerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rencana Keuangan'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          const SizedBox(
            height: 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Total Rencana Keuangan',
                style: blackTextStyle.copyWith(
                  fontWeight: medium,
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                'Rp 0',
                style: blackTextStyle.copyWith(
                  fontWeight: semiBold,
                ),
              ),
              const SizedBox(height: 17),
              const Divider(),
              const SizedBox(height: 17),
              SizedBox(
                height: 395,
                child: Scrollbar(
                  child: SingleChildScrollView(
                    child: Column(
                      children: const [
                        MoneyPlannnerItem(
                          imageUrl: 'assets/ic_bag.png',
                          title: 'Tas Wanita',
                          amount: 250000,
                          total: 500000,
                          percentage: 50,
                          value: 0.50,
                        ),
                        MoneyPlannnerItem(
                          imageUrl: 'assets/ic_gadget.png',
                          title: 'Gadget',
                          amount: 250000,
                          total: 500000,
                          percentage: 60,
                          value: 0.40,
                        ),
                        MoneyPlannnerItem(
                          imageUrl: 'assets/ic_saving.png',
                          title: 'Tabungan',
                          amount: 250000,
                          total: 500000,
                          percentage: 70,
                          value: 0.85,
                        ),
                        MoneyPlannnerItem(
                          imageUrl: 'assets/ic_saving.png',
                          title: 'Tabungan',
                          amount: 250000,
                          total: 500000,
                          percentage: 70,
                          value: 0.85,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 17),
              const Divider(),
            ],
          ),
          const SizedBox(height: 20),
          CustomFilledButton(
            title: 'Create Plan',
            onPressed: () {
              Navigator.pushNamed(context, '/money-planner-create');
            },
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
