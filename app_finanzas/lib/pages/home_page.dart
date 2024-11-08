import 'package:app_finanzas/config/app_routes.dart';
import 'package:app_finanzas/design/colors.dart';
import 'package:app_finanzas/providers/user_provider.dart';
import 'package:app_finanzas/widgets/custom_money_display.dart';
import 'package:app_finanzas/widgets/home_app_bar_title.dart';
import 'package:app_finanzas/widgets/product_detail.dart';
import 'package:app_finanzas/widgets/summary_card.dart';
import 'package:app_finanzas/widgets/transaction_detail.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  /* final String storeName; */
  const HomePage({
    super.key,
    /*  required this.storeName, */
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
  Widget currentDetailWitget = const CategoriesWidget();
  late ButtonStyle categorieBtnStyle;
  late ButtonStyle recentTransactionsBtnStyle;

  @override
  void initState() {
    super.initState();
    categorieBtnStyle = buttonStyleActive;
    recentTransactionsBtnStyle = buttonStyleInactive;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.brandLightBackgroundColor,
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
        ),
        toolbarHeight: 67,
        backgroundColor: AppColors.brandLightColor,
        title: Padding(
          padding: const EdgeInsets.fromLTRB(16, 25, 16, 12),
          child: HomeAppBarTitle(
            //storeName: widget.storeName,
            storeName: UserProvider.of(context).userData.name,
          ),
        ),
      ),
      body: Column(
        children: [
          const TopHomePageBody(),
          MidHomePageBody(
            categorieBtnStyle: categorieBtnStyle,
            recentTransactionsBtnStyle: recentTransactionsBtnStyle,
            categoriesBtnAction: () {
              setState(() {
                currentDetailWitget = const CategoriesWidget();
                categorieBtnStyle = buttonStyleActive;
                recentTransactionsBtnStyle = buttonStyleInactive;
              });
            },
            recentBtnAction: () {
              setState(() {
                currentDetailWitget = const RecentTransactions();
                categorieBtnStyle = buttonStyleInactive;
                recentTransactionsBtnStyle = buttonStyleActive;
              });
            },
          ),
          Expanded(
            child: currentDetailWitget,
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
      /* height: 359, */
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
            margin: const EdgeInsets.only(top: 16),
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
      padding: const EdgeInsets.all(16),
      /* height: 104, */
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            style: categorieBtnStyle,
            onPressed: categoriesBtnAction,
            child: const Padding(
              padding: EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 30,
              ),
              child: Text(
                'Categories',
                style: TextStyle(
                  color: AppColors.brandDarkColor,
                  fontSize: 14,
                ),
              ),
            ),
          ),
          ElevatedButton(
            style: recentTransactionsBtnStyle,
            onPressed: recentBtnAction,
            child: const Padding(
              padding: EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 5,
              ),
              child: Text(
                'Recent transaction',
                style: TextStyle(
                  color: AppColors.brandLightDarkColor,
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
          style: const ButtonStyle(
            alignment: Alignment.centerRight,
          ),
          child: const Text(
            /* textScaler: TextScaler.linear(1), */
            'View All',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13,
              color: Color.fromRGBO(53, 97, 254, 1),
            ),
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

class RecentTransactions extends StatelessWidget {
  const RecentTransactions({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      child: ListView(
        padding: const EdgeInsets.only(
          bottom: 16,
        ),
        children: [
          TextButton(
            style: const ButtonStyle(alignment: Alignment.centerRight),
            child: const Text(
              'View All',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  color: Color.fromRGBO(53, 97, 254, 1)),
            ),
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.allTransactions);
            },
          ),
          TransactionDetailByDay(
            day: 'TUE',
            isToday: true,
            dayNumber: 4,
            listofTransactions: [
              TransactionDetail(
                  movementName: 'Movement Name',
                  transactionDate: 'Tuesday 4th,  September 2023',
                  typeTransaction: TypeTransaction.negative,
                  amount: 420.16),
              TransactionDetail(
                  movementName: 'Movement Name',
                  transactionDate: 'Tuesday 4th,  September 2023',
                  typeTransaction: TypeTransaction.positive,
                  amount: 433.35)
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          TransactionDetailByDay(
            day: 'MON',
            isToday: false,
            dayNumber: 3,
            listofTransactions: [
              TransactionDetail(
                  movementName: 'Movement Name',
                  transactionDate: 'Monday 3th,  September 2023',
                  typeTransaction: TypeTransaction.positive,
                  amount: 720.92),
              TransactionDetail(
                  movementName: 'Movement Name',
                  transactionDate: 'Monday 3th,  September 2023',
                  typeTransaction: TypeTransaction.negative,
                  amount: 84.45),
              TransactionDetail(
                  movementName: 'Movement Name',
                  transactionDate: 'Monday 3th,  September 2023',
                  typeTransaction: TypeTransaction.positive,
                  amount: 137.26)
            ],
          )
        ],
      ),
    );
  }
}
