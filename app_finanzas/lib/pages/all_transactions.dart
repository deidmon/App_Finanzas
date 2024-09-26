import 'package:app_finanzas/design/colors.dart';
import 'package:app_finanzas/design/copy.dart';
import 'package:app_finanzas/mocks/transaction_mock.dart';
import 'package:app_finanzas/widgets/divider_with_text.dart';
import 'package:app_finanzas/widgets/transaction_detail.dart';
import 'package:flutter/material.dart';

class AllTransactions extends StatelessWidget {
  const AllTransactions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.brandLightBackgroundColor,
      appBar: AppBar(
        toolbarHeight: 97,
        leadingWidth: 56,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
        ),
        backgroundColor: AppColors.brandLightColor,
        leading: Container(
          height: 40,
          width: 40,
          margin: const EdgeInsets.fromLTRB(16, 45, 0, 12),
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.brandLightColorBorder,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(
              Icons.arrow_back,
              color: AppColors.brandPrimaryColor,
            ),
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.fromLTRB(0, 45, 16, 12),
          child: Text(
            AppCopys.recenTrx,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: 32,
            ),
            height: 56,
            child: ListView.separated(
              padding: const EdgeInsets.all(10),
              scrollDirection: Axis.horizontal,
              itemCount: TransactionsMocks.categories.length,
              itemBuilder: (context, index) {
                return MaterialButton(
                  onPressed: () {},
                  height: 35,
                  minWidth: 35,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  color: index == 0
                      ? AppColors.brandPrimaryColor
                      : AppColors.brandLightColor,
                  child: Text(
                    TransactionsMocks.categories[index],
                    style: TextStyle(
                      fontSize: 12,
                      color: index != 0
                          ? AppColors.brandPrimaryColor
                          : AppColors.brandLightColor,
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(
                width: 16,
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              child: ListView.separated(
                itemBuilder: (contex, month) {
                  var dataPerMonth =
                      TransactionsMocks.transactionDetailByMonth[month];
                  return ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (contex, day) {
                      var dataPerDay = dataPerMonth.listofTransactions[day];
                      return Padding(
                        padding: const EdgeInsets.all(16),
                        child: TransactionDetailByDay(
                          day: dataPerDay.day,
                          isToday: dataPerDay.isToday,
                          dayNumber: dataPerDay.dayNumber,
                          listofTransactions: dataPerDay.listofTransactions,
                        ),
                      );
                    },
                    separatorBuilder: (contex, day) => const SizedBox(
                      height: 24,
                    ),
                    itemCount: dataPerMonth.listofTransactions.length,
                  );
                },
                separatorBuilder: (context, month) {
                  /*  print(month + 1);
                  print(TransactionsMocks
                      .transactionDetailByMonth[month + 1].month); */
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: DividerWithText(
                      title: TransactionsMocks
                          .transactionDetailByMonth[month + 1].month,
                    ),
                  );
                },
                itemCount: TransactionsMocks.transactionDetailByMonth.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
