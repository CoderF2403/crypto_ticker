import 'package:flutter/material.dart';
import 'coin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {

  CoinData coinData = CoinData();

  String selectedCurrency = 'INR';

  String priceBTC = '?';
  String priceETC = '?';
  String priceLTH = '?';

  @override
  void initState(){
    super.initState();
    updateUI(selectedCurrency);
  }

  void updateUI(String selectedCurrency) async {
    List<String> coinPrice = await coinData.allCoinData(selectedCurrency);
    setState(() {
      priceBTC = coinPrice[0];
      priceETC = coinPrice[1];
      priceLTH = coinPrice[2];
    });
  }

  List<DropdownMenuItem<String>> selectCurrency(){
    List<DropdownMenuItem<String>> dropDownList = [];
    for(int i = 0; i < currenciesList.length; i++){
      String currency = currenciesList[i];
      var newItems = DropdownMenuItem(child: Text(currency), value: currency);
      dropDownList.add(newItems);
    }
    return dropDownList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = $priceBTC $selectedCurrency',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 ETH = $priceETC $selectedCurrency',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 LTC = $priceLTH $selectedCurrency',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    'Click Currency From Below',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                DropdownButton<String>(
                  value: selectedCurrency,
                  items: selectCurrency(),
                  onChanged: (value) {
                    setState(() {
                      selectedCurrency = value.toString();
                      updateUI(selectedCurrency);
                    });
                  },
                ),
              ],
            )
          ),
        ],
      ),
    );
  }
}
