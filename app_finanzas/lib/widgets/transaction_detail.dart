import 'package:app_finanzas/design/colors.dart';
import 'custom_money_display.dart';
import 'package:flutter/material.dart';

enum TypeTransaction { positive, negative }

class TransactionDetail {
  final String movementName;
  final String transactionDate;
  final TypeTransaction typeTransaction;
  final double amount;
  TransactionDetail(
      {required this.movementName,
      required this.transactionDate,
      required this.typeTransaction,
      required this.amount});
}

class TransactionDetailByMonth {
  final String month;
  final List<TransactionDetailByDayModel> listofTransactions;
  TransactionDetailByMonth(
      {required this.month, required this.listofTransactions});
}

class TransactionDetailByDayModel {
  final String day;
  final int dayNumber;
  final bool isToday;
  final List<TransactionDetail> listofTransactions;
  TransactionDetailByDayModel(
      {required this.day,
      required this.dayNumber,
      required this.isToday,
      required this.listofTransactions});
}

class TransactionDetailByDay extends StatelessWidget {
  final String day;
  final int dayNumber;
  final bool isToday;
  final List<TransactionDetail> listofTransactions;
  const TransactionDetailByDay(
      {super.key,
      required this.listofTransactions,
      required this.day,
      required this.isToday,
      required this.dayNumber});
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            children: [
              Text(
                day,
              ),
              Text(dayNumber.toString(),
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight:
                          isToday ? FontWeight.bold : FontWeight.normal)),
              isToday
                  ? const Icon(
                      Icons.lens,
                      size: 8,
                      color: AppColors.brandOnSuccessColor,
                    )
                  : const SizedBox(
                      height: 8,
                      width: 8,
                    )
            ],
          ),
        ),
        Container(
          width: 310,
          margin: const EdgeInsets.only(left: 16),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.brandLightColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, indice) {
              return listofTransactions[indice].typeTransaction ==
                      TypeTransaction.positive
                  ? TransactionDetailPositive(
                      transactionDetail: listofTransactions[indice])
                  : TransactionDetailNegative(
                      transactionDetail: listofTransactions[indice]);
            },
            separatorBuilder: (context, indice) => const Divider(
              color: AppColors.brandSecondaryColor,
              thickness: 2,
            ),
            itemCount: listofTransactions.length,
          ),
        )
      ],
    );
  }
}

class TransactionDetailPositive extends StatelessWidget {
  final TransactionDetail transactionDetail;
  const TransactionDetailPositive({super.key, required this.transactionDetail});
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 32,
          height: 32,
          margin: const EdgeInsets.only(right: 12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.brandSuccessColor),
          child: const Icon(
            Icons.expand_less,
            color: AppColors.brandOnSuccessColor,
          ),
        ),
        SizedBox(
          width: 180,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                transactionDetail.movementName,
                style: const TextStyle(
                  color: AppColors.brandDarkColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
              Text(
                transactionDetail.transactionDate,
                style: const TextStyle(
                  fontSize: 10,
                  color: AppColors.brandLightDarkColor,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: CustomMoneyDisplay(
            margin: const EdgeInsets.only(top: 7),
            leftSimbol: const Text(
              ' \$ ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.brandDarkColor,
                fontSize: 13,
              ),
            ),
            amount: transactionDetail.amount,
            amountStyle: const TextStyle(
              color: AppColors.brandDarkColor,
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
            amountStyleSmall: const TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.brandDarkColor,
              fontSize: 10,
            ),
          ),
        ),
      ],
    );
  }
}

class TransactionDetailNegative extends StatelessWidget {
  final TransactionDetail transactionDetail;
  const TransactionDetailNegative({super.key, required this.transactionDetail});
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 32,
          height: 32,
          margin: const EdgeInsets.only(right: 12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.brandErrorColor),
          child: const Icon(
            Icons.expand_more,
            color: AppColors.brandOnErrorColor,
          ),
        ),
        SizedBox(
          width: 180,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                transactionDetail.movementName,
                style: const TextStyle(
                  color: AppColors.brandDarkColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
              Text(
                transactionDetail.transactionDate,
                style: const TextStyle(
                  fontSize: 10,
                  color: AppColors.brandLightDarkColor,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: CustomMoneyDisplay(
            margin: const EdgeInsets.only(top: 7),
            amount: transactionDetail.amount,
            amountStyle: const TextStyle(
              color: AppColors.brandOnErrorColor,
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
            leftSimbol: const Text(
              '-\$ ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.brandOnErrorColor,
                fontSize: 13,
              ),
            ),
            amountStyleSmall: const TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.brandOnErrorColor,
              fontSize: 10,
            ),
          ),
        ),
      ],
    );
  }
}
