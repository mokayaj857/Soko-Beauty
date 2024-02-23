class PaymentDetails {
  String paymentMethod; // e.g., "Credit Card", "PayPal", etc.
  String accountNumber; // Account number or card number

  PaymentDetails({
    required this.paymentMethod,
    required this.accountNumber,
  });
}
