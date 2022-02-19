import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../services/api.dart';

class EndpointCardData {
  EndpointCardData(this.title, this.assetName, this.color);
  final String title;
  final String assetName;
  final Color color;
}

class EndpointCard extends StatelessWidget {
  const EndpointCard({
    Key? key,
    required this.endpoint,
    this.value,
  }) : super(key: key);
  final Endpoint endpoint;
  final int? value;

  static final Map<Endpoint, EndpointCardData> _cardsData = {
    Endpoint.cases: EndpointCardData(
      'Cases',
      'assets/images/count.png',
      const Color(0xFFFFF492),
    ),
    Endpoint.casesSuspected: EndpointCardData(
      'Suspected Cases',
      'assets/images/suspect.png',
      const Color(0xFFEEDA28),
    ),
    Endpoint.casesConfirmed: EndpointCardData(
      'Confirmed Cases',
      'assets/images/fever.png',
      const Color(0xFFE99600),
    ),
    Endpoint.deaths: EndpointCardData(
      'Deaths',
      'assets/images/death.png',
      const Color(0xFFE40000),
    ),
    Endpoint.recovered: EndpointCardData(
      'Recovered',
      'assets/images/patient.png',
      const Color(0xFF70A901),
    ),
  };

  String get formattedValue {
    if (value == null) {
      return '';
    }
    return NumberFormat('#,###,###,###').format(value);
  }

  @override
  Widget build(BuildContext context) {
    final cardData = _cardsData[endpoint];
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 4.0,
      ),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cardData!.title,
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(color: cardData.color),
              ),
              const SizedBox(height: 4),
              SizedBox(
                height: 52,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(cardData.assetName, color: cardData.color),
                    value != null
                        ? Text(
                            formattedValue,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(
                                    color: cardData.color,
                                    fontWeight: FontWeight.w500),
                          )
                        : CircularProgressIndicator(color: cardData.color)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
