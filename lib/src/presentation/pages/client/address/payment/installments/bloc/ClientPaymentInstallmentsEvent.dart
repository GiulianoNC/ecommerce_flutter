import 'package:equatable/equatable.dart';

abstract class ClientPaymentInstallmentsEvent extends Equatable{

  const ClientPaymentInstallmentsEvent();

  @override
  List<Object?> get props => [];
}

class GetInstallments extends ClientPaymentInstallmentsEvent{

  final String firstSixDigits;
  final String amount;

  const GetInstallments({required this.firstSixDigits, required this.amount});

  @override
  // TODO: implement props
  List<Object?> get props => [firstSixDigits, amount];
}