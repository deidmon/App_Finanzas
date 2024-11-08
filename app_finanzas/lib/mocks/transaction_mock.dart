import 'package:app_finanzas/widgets/transaction_detail.dart';

class TransactionsMocks {
  TransactionsMocks._();
  static const List<String> categories = [
    'All',
    'Transportation',
    'Shop',
    'Food and drink',
    'Electronics',
    'Bakey'
  ];
  static List<TransactionDetailByMonth> transactionDetailByMonth = [
    TransactionDetailByMonth(month: 'April', listofTransactions: [
      TransactionDetailByDayModel(
          day: 'TUE',
          dayNumber: 4,
          isToday: true,
          listofTransactions: [
            TransactionDetail(
                movementName: 'Movement Name',
                transactionDate: 'Tuesday 4th,  April 2023',
                typeTransaction: TypeTransaction.negative,
                amount: 420.16),
            TransactionDetail(
                movementName: 'Movement Name',
                transactionDate: 'Tuesday 4th,  April 2023',
                typeTransaction: TypeTransaction.positive,
                amount: 433.35),
          ]),
      TransactionDetailByDayModel(
          day: 'MON',
          dayNumber: 3,
          isToday: false,
          listofTransactions: [
            TransactionDetail(
                movementName: 'Movement Name',
                transactionDate: 'Monday 3th,  April 2023',
                typeTransaction: TypeTransaction.positive,
                amount: 720.92),
            TransactionDetail(
                movementName: 'Movement Name',
                transactionDate: 'Monday 3th,  April 2023',
                typeTransaction: TypeTransaction.negative,
                amount: 84.45),
            TransactionDetail(
                movementName: 'Movement Name',
                transactionDate: 'Monday 3th,  April 2023',
                typeTransaction: TypeTransaction.positive,
                amount: 137.26)
          ])
    ]),
    TransactionDetailByMonth(month: 'March', listofTransactions: [
      TransactionDetailByDayModel(
          day: 'MON',
          dayNumber: 7,
          isToday: false,
          listofTransactions: [
            TransactionDetail(
                movementName: 'Movement Name',
                transactionDate: 'Monday 7th,  March 2023',
                typeTransaction: TypeTransaction.negative,
                amount: 420.16),
            TransactionDetail(
                movementName: 'Movement Name',
                transactionDate: 'Monday 7th,  March 2023',
                typeTransaction: TypeTransaction.positive,
                amount: 433.35),
          ]),
      TransactionDetailByDayModel(
          day: 'SAT',
          dayNumber: 5,
          isToday: false,
          listofTransactions: [
            TransactionDetail(
                movementName: 'Movement Name',
                transactionDate: 'Saturday 5th,  March 2023',
                typeTransaction: TypeTransaction.positive,
                amount: 720.92),
            TransactionDetail(
                movementName: 'Movement Name',
                transactionDate: 'Saturday 5th,  March 2023',
                typeTransaction: TypeTransaction.negative,
                amount: 84.45),
            TransactionDetail(
                movementName: 'Movement Name',
                transactionDate: 'Saturday 5th,  March 2023',
                typeTransaction: TypeTransaction.positive,
                amount: 137.26)
          ])
    ]),
    TransactionDetailByMonth(month: 'February', listofTransactions: [
      TransactionDetailByDayModel(
          day: 'MON',
          dayNumber: 6,
          isToday: false,
          listofTransactions: [
            TransactionDetail(
                movementName: 'Movement Name',
                transactionDate: 'Monday 6th,  February 2023',
                typeTransaction: TypeTransaction.negative,
                amount: 420.16),
            TransactionDetail(
                movementName: 'Movement Name',
                transactionDate: 'Monday 6th,  February 2023',
                typeTransaction: TypeTransaction.positive,
                amount: 433.35),
          ]),
      TransactionDetailByDayModel(
          day: 'SAT',
          dayNumber: 4,
          isToday: false,
          listofTransactions: [
            TransactionDetail(
                movementName: 'Movement Name',
                transactionDate: 'Saturday 4th,  February 2023',
                typeTransaction: TypeTransaction.positive,
                amount: 720.92),
            TransactionDetail(
                movementName: 'Movement Name',
                transactionDate: 'Saturday 4th,  February 2023',
                typeTransaction: TypeTransaction.negative,
                amount: 84.45),
            TransactionDetail(
                movementName: 'Movement Name',
                transactionDate: 'Saturday 4th,  February 2023',
                typeTransaction: TypeTransaction.positive,
                amount: 137.26)
          ])
    ]),
    TransactionDetailByMonth(month: 'January', listofTransactions: [
      TransactionDetailByDayModel(
          day: 'MON',
          dayNumber: 6,
          isToday: false,
          listofTransactions: [
            TransactionDetail(
                movementName: 'Movement Name',
                transactionDate: 'Monday 6th,  January 2023',
                typeTransaction: TypeTransaction.negative,
                amount: 420.16),
            TransactionDetail(
                movementName: 'Movement Name',
                transactionDate: 'Monday 6th,  January 2023',
                typeTransaction: TypeTransaction.positive,
                amount: 433.35),
          ]),
      TransactionDetailByDayModel(
          day: 'SAT',
          dayNumber: 4,
          isToday: false,
          listofTransactions: [
            TransactionDetail(
                movementName: 'Movement Name',
                transactionDate: 'Saturday 4th,  January 2023',
                typeTransaction: TypeTransaction.positive,
                amount: 720.92),
            TransactionDetail(
                movementName: 'Movement Name',
                transactionDate: 'Saturday 4th,  January 2023',
                typeTransaction: TypeTransaction.negative,
                amount: 84.45),
            TransactionDetail(
                movementName: 'Movement Name',
                transactionDate: 'Saturday 4th,  January 2023',
                typeTransaction: TypeTransaction.positive,
                amount: 137.26)
          ])
    ]),
    TransactionDetailByMonth(month: 'December', listofTransactions: [
      TransactionDetailByDayModel(
          day: 'MON',
          dayNumber: 5,
          isToday: false,
          listofTransactions: [
            TransactionDetail(
                movementName: 'Movement Name',
                transactionDate: 'Monday 5th,  December 2023',
                typeTransaction: TypeTransaction.negative,
                amount: 420.16),
            TransactionDetail(
                movementName: 'Movement Name',
                transactionDate: 'Monday 5th,  December 2023',
                typeTransaction: TypeTransaction.positive,
                amount: 433.35),
          ]),
      TransactionDetailByDayModel(
          day: 'SAT',
          dayNumber: 3,
          isToday: false,
          listofTransactions: [
            TransactionDetail(
                movementName: 'Movement Name',
                transactionDate: 'Saturday 3th,  December 2023',
                typeTransaction: TypeTransaction.positive,
                amount: 720.92),
            TransactionDetail(
                movementName: 'Movement Name',
                transactionDate: 'Saturday 3th,  December 2023',
                typeTransaction: TypeTransaction.negative,
                amount: 84.45),
            TransactionDetail(
                movementName: 'Movement Name',
                transactionDate: 'Saturday 3th,  December 2023',
                typeTransaction: TypeTransaction.positive,
                amount: 137.26)
          ])
    ]),
  ];
}
