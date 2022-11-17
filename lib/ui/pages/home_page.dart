import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moneywise_app/shared/shared_methods.dart';

import 'package:moneywise_app/shared/theme.dart';
import 'package:moneywise_app/ui/pages/history_page.dart';
import 'package:moneywise_app/ui/pages/money_planner_page.dart';
import 'package:moneywise_app/ui/pages/profile_page.dart';
import 'package:moneywise_app/ui/widgets/home_latest_transactions_item.dart';
import 'package:moneywise_app/ui/widgets/home_tips_item.dart';
import 'package:moneywise_app/ui/widgets/home_user_items.dart';
import 'package:moneywise_app/ui/widgets/home_service_item.dart';

import '../../blocs/auth/auth_bloc.dart';
import '../../blocs/tip/tip_bloc.dart';
import '../../blocs/transaction/transaction_bloc.dart';
import '../../blocs/user/user_bloc.dart';
import '../../models/transfer_form_model.dart';
import 'transfer_amount_page.dart';

class HomePageNavbar extends StatefulWidget {
  const HomePageNavbar({Key? key}) : super(key: key);

  @override
  _HomePageNavbarState createState() => _HomePageNavbarState();
}

class _HomePageNavbarState extends State<HomePageNavbar> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    HistoryPage(),
    MoneyPlannerPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: whiteColor,
        shape: const CircularNotchedRectangle(),
        clipBehavior: Clip.antiAlias,
        notchMargin: 6,
        elevation: 0,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: whiteColor,
          elevation: 0,
          selectedItemColor: blueColor,
          unselectedItemColor: blackColor,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedLabelStyle: blueTextStyle.copyWith(
            fontSize: 10,
            fontWeight: medium,
          ),
          unselectedLabelStyle: blackTextStyle.copyWith(
            fontSize: 10,
            fontWeight: medium,
          ),
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/ic_overview.png',
                width: 20,
                height: 20,
                color: _selectedIndex == 0 ? blueColor : blackColor,
              ),
              label: 'Overview',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/ic_history.png',
                width: 20,
                height: 20,
                color: _selectedIndex == 1 ? blueColor : blackColor,
              ),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/ic_money_plan.png',
                width: 20,
                height: 20,
                color: _selectedIndex == 2 ? blueColor : blackColor,
              ),
              label: 'Money Planner',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/ic_edit_profile.png',
                width: 20,
                height: 20,
                color: _selectedIndex == 3 ? blueColor : blackColor,
              ),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: purpleColor,
        onPressed: () {
          Navigator.pushNamed(context, '/topup');
        },
        child: Image.asset(
          'assets/ic_plus_circle.png',
          width: 24,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          children: [
            buildProfile(context),
            buildWalletCard(),
            //buildLevel(),
            buildServices(context),
            buildLatestTransactions(),
            buildSendAgain(),
            buildFriendlyTips(),
          ],
        ),
      ),
    );
  }

  Widget buildProfile(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthSuccess) {
          return Container(
            margin: const EdgeInsets.only(top: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Howdy,',
                      style: greyTextStyle.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      state.user.name.toString(),
                      style: blackTextStyle.copyWith(
                        fontWeight: semiBold,
                        fontSize: 20,
                      ),
                    )
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/profile');
                  },
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: state.user.profilePicture == null
                            ? const AssetImage(
                                'assets/ic_img_error.png',
                              )
                            : NetworkImage(
                                state.user.profilePicture!,
                              ) as ImageProvider,
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: whiteColor,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.check_circle,
                            color: greenColor,
                            size: 14,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
        return Container();
      },
    );
  }

  Widget buildWalletCard() {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthSuccess) {
          return Container(
            width: double.infinity,
            padding: const EdgeInsets.all(30),
            height: 220,
            margin: const EdgeInsets.only(top: 30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/img_bg_card.png'),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  state.user.name.toString(),
                  style: whiteTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: medium,
                  ),
                ),
                const SizedBox(height: 28),
                Text(
                  '*****',
                  // '**** **** **** ${state.user.cardNumber!.substring(12, 16)}',
                  style: whiteTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: medium,
                    letterSpacing: 6,
                  ),
                ),
                const SizedBox(height: 21),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Balance',
                      style: whiteTextStyle,
                    ),
                    Text(
                      formatCurrency(state.user.balance ?? 0),
                      style: whiteTextStyle.copyWith(
                        fontWeight: semiBold,
                        fontSize: 24,
                      ),
                    )
                  ],
                ),
              ],
            ),
          );
        }
        return Container();
      },
    );
  }

  Widget buildLevel() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: whiteColor,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Level 1',
                style: blackTextStyle.copyWith(
                  fontWeight: medium,
                ),
              ),
              const Spacer(),
              Text(
                '55%',
                style: greenTextStyle.copyWith(fontWeight: semiBold),
              ),
              Text(
                ' of ${formatCurrency(20000)}',
                style: blackTextStyle.copyWith(
                  fontWeight: semiBold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(55),
            child: LinearProgressIndicator(
              value: 0.55,
              minHeight: 5,
              valueColor: AlwaysStoppedAnimation(greenColor),
              backgroundColor: lightBgColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildServices(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Do Something',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HomeServiceItem(
                iconUrl: 'assets/ic_topup.png',
                title: 'Top Up',
                onTap: () {
                  Navigator.pushNamed(context, '/topup');
                },
              ),
              HomeServiceItem(
                iconUrl: 'assets/ic_send.png',
                title: 'Send',
                onTap: () {
                  Navigator.pushNamed(context, '/transfer');
                },
              ),
              HomeServiceItem(
                iconUrl: 'assets/ic_withdraw.png',
                title: 'Withdraw',
                onTap: () {},
              ),
              HomeServiceItem(
                iconUrl: 'assets/ic_more.png',
                title: 'More',
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => const MoreDialog(),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildLatestTransactions() {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Latest Transactions',
            style: blackTextStyle.copyWith(
              fontWeight: semiBold,
              fontSize: 16,
            ),
          ),
          Container(
            width: double.infinity,
            height: 395,
            margin: const EdgeInsets.only(top: 14),
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: whiteColor,
            ),
            child: BlocProvider(
              create: (context) => TransactionBloc()..add(TransactionGet()),
              child: BlocBuilder<TransactionBloc, TransactionState>(
                builder: (context, state) {
                  if (state is TransactionSuccess) {
                    return state.transactions.isEmpty
                        ? Center(
                            child: Text(
                              'Belum ada transaksi.',
                              style: blackTextStyle.copyWith(
                                fontWeight: medium,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          )
                        : Scrollbar(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                  children:
                                      state.transactions.map((transaction) {
                                return HomeLatestTransactionItem(
                                    transaction: transaction);
                              }).toList()),
                            ),
                          );
                  }

                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSendAgain() {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Send Again',
            style: blackTextStyle.copyWith(
              fontWeight: semiBold,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          BlocProvider(
            create: (context) => UserBloc()..add(UserGetRecent()),
            child: BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                if (state is UserSuccess) {
                  return state.users.isEmpty
                      ? Text(
                          'Belum ada transfer.',
                          style: blackTextStyle.copyWith(
                            fontWeight: medium,
                          ),
                          textAlign: TextAlign.center,
                        )
                      : SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: state.users.map((user) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => TransferAmountPage(
                                        data: TransferFormModel(
                                          sendTo: user.username,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                child: HomeUserItem(user: user),
                              );
                            }).toList(),
                          ),
                        );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildFriendlyTips() {
    return Container(
      margin: const EdgeInsets.only(
        top: 30,
        bottom: 50,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Friendly Tips',
            style: blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 16),
          ),
          const SizedBox(height: 14),
          BlocProvider(
            create: (context) => TipBloc()..add(TipGet()),
            child: BlocBuilder<TipBloc, TipState>(
              builder: (context, state) {
                if (state is TipSuccess) {
                  return state.tips.isEmpty
                      ? Text(
                          'Nantikan tips terbaru dari kami.',
                          style: blackTextStyle.copyWith(
                            fontWeight: medium,
                          ),
                          textAlign: TextAlign.center,
                        )
                      : Wrap(
                          spacing: 17,
                          runSpacing: 18,
                          children: state.tips.map((tip) {
                            return HomeTipsItem(tip: tip);
                          }).toList(),
                        );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MoreDialog extends StatelessWidget {
  const MoreDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      alignment: Alignment.bottomCenter,
      content: Container(
        padding: const EdgeInsets.all(30),
        width: MediaQuery.of(context).size.width,
        height: 477,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: lightBgColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Do More With Us',
              style:
                  blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
            ),
            const SizedBox(height: 13),
            Wrap(
              spacing: 29,
              runSpacing: 25,
              children: [
                HomeServiceItem(
                  iconUrl: 'assets/ic_product_data.png',
                  title: 'Data',
                  onTap: () {
                    Navigator.pushNamed(context, '/data-provider');
                  },
                ),
                HomeServiceItem(
                  iconUrl: 'assets/ic_product_water.png',
                  title: 'Water',
                  onTap: () {},
                ),
                HomeServiceItem(
                  iconUrl: 'assets/ic_product_stream.png',
                  title: 'Stream',
                  onTap: () {},
                ),
                HomeServiceItem(
                  iconUrl: 'assets/ic_product_movie.png',
                  title: 'Movie',
                  onTap: () {},
                ),
                HomeServiceItem(
                  iconUrl: 'assets/ic_product_food.png',
                  title: 'Food',
                  onTap: () {},
                ),
                HomeServiceItem(
                  iconUrl: 'assets/ic_product_travel.png',
                  title: 'Travel',
                  onTap: () {},
                ),
                HomeServiceItem(
                  iconUrl: 'assets/ic_money_plan.png',
                  title: 'Rencana\nKeuangan',
                  onTap: () {
                    Navigator.pushNamed(context, '/money-planner');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
