import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:raf_airlines_client/profile/credit_card/bloc/credit_cards_bloc.dart';
import 'package:raf_airlines_client/profile/credit_card/credit_card_list_item.dart';
import 'package:raf_airlines_client/profile/credit_card/new_credit_card/bloc/new_credit_card_bloc.dart';
import 'package:raf_airlines_client/profile/credit_card/new_credit_card/new_credit_card_page.dart';
import 'package:raf_airlines_client/services/service_provider.dart';
import 'package:raf_airlines_client/services/user/user_service.dart';
import 'package:raf_airlines_client/ui/error_button_widget.dart';
import 'package:raf_airlines_client/ui/loading_icon.dart';

class CreditCardBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreditCardsBloc, CreditCardsState>(
        builder: (context, state) {
          if (state is CreditCardsLoaded)
            return Padding(
              padding: const EdgeInsets.only(top: 24, bottom: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: state.creditCards.isNotEmpty
                        ? ListView(
                            children: state.creditCards
                                .map((creditCard) => CreditCardListItem(creditCard: creditCard))
                                .toList(),
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.credit_card,
                                color: Colors.grey,
                                size: 42,
                              ),
                              SizedBox(
                                height: 24,
                              ),
                              Text(
                                "You don't have any credit cards",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 22),
                              )
                            ],
                          ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: FloatingActionButton.extended(
                      onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => BlocProvider<NewCreditCardBloc>(
                                create: (_) => NewCreditCardBloc(
                                    creditCardsBloc: BlocProvider.of<CreditCardsBloc>(context),
                                    service: getService<UserService>()),
                                child: NewCreditCardPage(),
                              ))),
                      backgroundColor: Theme.of(context).primaryColorDark,
                      label: Text(
                        "Add new",
                        style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
            );
          else if (state is CreditCardsLoading)
            return LoadingIcon();
          else
            return ErrorButtonWidget(callback: () => BlocProvider.of<CreditCardsBloc>(context).add(CreditCardsInit()));
        });
  }
}
