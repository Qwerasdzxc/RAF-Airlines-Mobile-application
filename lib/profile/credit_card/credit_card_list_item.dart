import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:raf_airlines_client/models/credit_card.dart';
import 'package:raf_airlines_client/profile/credit_card/bloc/credit_cards_bloc.dart';

class CreditCardListItem extends StatelessWidget {
  final CreditCard creditCard;

  const CreditCardListItem({Key key, @required this.creditCard}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.credit_card,
                  color: Colors.grey,
                  size: 32,
                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Text(
                    "Credit card",
                    style:
                        TextStyle(fontSize: 20, color: Theme.of(context).primaryColorDark, fontWeight: FontWeight.bold),
                  ),
                ),
                IconButton(
                    icon: Icon(
                      Icons.delete_forever,
                      color: Colors.red[800],
                    ),
                    onPressed: () =>
                        BlocProvider.of<CreditCardsBloc>(context).add(CreditCardRemoved(creditCard: creditCard)))
              ],
            ),
            Divider(
              height: 32,
            ),
            Center(
              child: Text(
                creditCard.number.length == 19
                    ? creditCard.number.substring(0, 5) + "**** **** ****"
                    : creditCard.number,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.grey[600]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
