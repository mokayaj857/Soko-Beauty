
import 'package:soko_beauty/feautures/auth/views/widgets/card_type.dart';

class SavedCard {
  String cardNumber;
  String cardHolderName;
  String expirationDate;
  String cvv;
  CardType cardType;

  SavedCard({
    required this.cardNumber,
    required this.cardHolderName,
    required this.expirationDate,
    required this.cvv,
    required this.cardType,
  });
}

