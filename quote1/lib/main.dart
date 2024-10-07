import 'package:flutter/material.dart';
import 'quote.dart';
import 'quote_card.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: QuotesList(),
  ));
}

class QuotesList extends StatefulWidget {
  const QuotesList({super.key});

  @override
  State<QuotesList> createState() => _QuotesListState();
}

class _QuotesListState extends State<QuotesList> {
  List<Quote> quotes = [
    Quote('Hello, How are you?', 'Kyaw Kyaw'),
    Quote('Yes, I am fine. How about you?', 'Aung Aung'),
    Quote('Great. Have a nice day.', 'Kyaw Kyaw'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('Awesome Quotes'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 239, 210, 69),
      ),
      body: Column(
        children: quotes
            .map((quote) => QuoteCard(quote, delete: () {
                  setState(() {
                    quotes.remove(quote);
                  });
                }))
            .toList(),
      ),
    );
  }
}
