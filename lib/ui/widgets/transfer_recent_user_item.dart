import 'package:flutter/material.dart';
import 'package:moneywise_app/models/user_model.dart';

import '../../shared/theme.dart';

class TransferRecentUserItem extends StatelessWidget {
  final UserModel user;

  const TransferRecentUserItem({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      margin: const EdgeInsets.only(bottom: 18),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            height: 45,
            width: 45,
            margin: const EdgeInsets.only(right: 14),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: user.profilePicture != null
                    ? const AssetImage('assets/img_profile.png')
                    : NetworkImage(user.profilePicture!) as ImageProvider,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user.name.toString(),
                style: blackTextStyle.copyWith(
                  fontWeight: medium,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                '@${user.username}',
                style: greyTextStyle.copyWith(
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const Spacer(),
          if (user.verified == 1)
            Row(
              children: [
                Icon(
                  Icons.check_circle,
                  size: 14,
                  color: greenColor,
                ),
                const SizedBox(width: 4),
                Text(
                  'Verified',
                  style: greenTextStyle.copyWith(
                    fontSize: 11,
                    fontWeight: medium,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
