class PointsToGiftCards {
  final points;
  final email;
  final sender;
  final receiver;
  final giftCardImageUrl;
  final productName;
  final currency;
  final quantity;

  PointsToGiftCards(
      {required this.points,
      required this.email,
      required this.sender,
      required this.receiver,
      required this.giftCardImageUrl,
      required this.productName,
      required this.currency,
      required this.quantity});
}
