import 'package:app_finanzas/design/colors.dart';
import 'package:app_finanzas/widgets/custom_money_display.dart';
import 'package:app_finanzas/widgets/home_app_bar_title.dart';
import 'package:app_finanzas/widgets/product_detail.dart';
import 'package:app_finanzas/widgets/summary_card.dart';
import 'package:flutter/material.dart';

var buttonStyleInactive = ElevatedButton.styleFrom(
  elevation: 0,
  backgroundColor: AppColors.brandLightColor,
  shadowColor: AppColors.brandLightColor,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(12), // <-- Radius
  ),
);
var buttonStyleActive = ElevatedButton.styleFrom(
  backgroundColor: AppColors.brandSecondaryColor,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(12), // <-- Radius
  ),
);

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
        ),
        toolbarHeight: 97,
        backgroundColor: AppColors.brandLightColor,
        title: const Padding(
          padding: EdgeInsets.fromLTRB(16, 45, 16, 12),
          child: HomeAppBarTitle(),
        ),
      ),
      body: Column(
        children: [
          const TopHomePageBody(),
          MidHomePageBody(
            categorieBtnStyle: buttonStyleActive,
            recentTransactionsBtnStyle: buttonStyleInactive,
            categoriesBtnAction: () => print('categories'),
            recentBtnAction: () => print('recent'),
          ),
          const Expanded(
            child: CategoriesWidget(),
          )
        ],
      ),
    );
  }
}

class TopHomePageBody extends StatelessWidget {
  const TopHomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      height: 389,
      width: MediaQuery.of(context).size.width,
      transform: Matrix4.translationValues(0, -12, 0),
      decoration: const BoxDecoration(
        color: AppColors.brandPrimaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 56),
            child: Text(
              'Your Budget',
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ),
          CustomMoneyDisplay(
            amount: 2868000.12,
            padding: const EdgeInsets.only(top: 8, right: 4),
            amountStyle: Theme.of(context).textTheme.displayLarge!,
            amountStyleSmall: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.brandLightColor,
            ),
          ),
          SummaryCard(
            typeSummaryCard: TypeSummaryCard.incomes,
            amount: 700000,
            period: 'From January 1 to January 31',
            action: () => print('incomes'),
          ),
          SummaryCard(
            typeSummaryCard: TypeSummaryCard.spending,
            amount: 90000,
            period: 'From January 1 to January 31',
            action: () => print('spending'),
          ),
        ],
      ),
    );
  }
}

class MidHomePageBody extends StatelessWidget {
  final ButtonStyle categorieBtnStyle;
  final ButtonStyle recentTransactionsBtnStyle;
  final void Function()? categoriesBtnAction;
  final void Function()? recentBtnAction;
  const MidHomePageBody(
      {super.key,
      required this.categorieBtnStyle,
      required this.recentTransactionsBtnStyle,
      required this.categoriesBtnAction,
      required this.recentBtnAction});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16),
      height: 104,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        shape: BoxShape.rectangle,
        color: AppColors.brandLightColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ElevatedButton(
              style: categorieBtnStyle,
              onPressed: categoriesBtnAction,
              child: const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 40,
                ),
                child: Text(
                  'Categories',
                  style: TextStyle(
                    color: AppColors.brandDarkColor,
                    fontSize: 14,
                  ),
                ),
              )),
          ElevatedButton(
            style: recentTransactionsBtnStyle,
            onPressed: recentBtnAction,
            child: const Padding(
              padding: EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 20,
              ),
              child: Text(
                'Recent transaction',
                style: TextStyle(
                  color: AppColors.brandLigthDarkColor,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        TextButton(
          style: const ButtonStyle(alignment: Alignment.centerRight),
          child: const Text(
            'View All',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(53, 97, 254, 1)),
          ),
          onPressed: () {
            print('le diste clic a view all');
          },
        ),
        const ProductDetailCard(
          pathToProductImage: 'assets/images/pizza.png',
          amount: 391254.01,
          productName: 'Food & Drink',
          currentSells: '2250',
          percentage: '1.8',
          typeProductDetailCard: TypeProductDetailCard.incomes,
        ),
        const ProductDetailCard(
          typeProductDetailCard: TypeProductDetailCard.incomes,
          pathToProductImage: 'assets/images/tv.png',
          amount: 3176254.01,
          productName: 'Electronics',
          currentSells: '2250',
          percentage: '43.6',
        ),
        const ProductDetailCard(
          typeProductDetailCard: TypeProductDetailCard.outcomes,
          pathToProductImage: 'assets/images/health.png',
          amount: 38.01,
          productName: 'Health',
          currentSells: '110',
          percentage: '25.8',
        ),
      ],
    );
  }
}