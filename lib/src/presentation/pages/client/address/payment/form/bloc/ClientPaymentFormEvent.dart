import 'package:equatable/equatable.dart';

abstract class ClientPaymentFormEvent extends Equatable{
  const ClientPaymentFormEvent();

  @override
  List<Object?> get props => [];
}

class ClientPaymentFormInitEvent extends ClientPaymentFormEvent{
  const ClientPaymentFormInitEvent();
}

class CreditCardChanged extends ClientPaymentFormEvent{

  final String cardNumber;
  final String expiredDate;
  final String cardHolderName;
  final String cvvCode;
  final bool isCvvFocused;

  const CreditCardChanged({
   required this.cardNumber,
   required this.expiredDate,
   required this.cardHolderName,
   required this.cvvCode,
   required this.isCvvFocused
  });

  @override
  List<Object?> get props => [cardNumber,expiredDate,cardHolderName, cvvCode, isCvvFocused];
}

class FormSubmit extends ClientPaymentFormEvent{
  const FormSubmit();
}