import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jio_pay_sdk/utils/common_methods.dart';

class FirstScreen extends StatefulWidget {
  String merchantName;
  String merchantImage;

  FirstScreen(
      {super.key, required this.merchantName, required this.merchantImage});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  PaymentMethod? selectedMethod;
  final screenWidth =
      MediaQuery.of(navigatorKey.currentState!.context).size.width;
  final screenHeight =
      MediaQuery.of(navigatorKey.currentState!.context).size.height;
  final FocusNode _cardFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _cardFocusNode.addListener(() {
      setState(() {}); // Rebuild when focus changes
    });
  }

  @override
  void dispose() {
    _cardFocusNode.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Checkout",
            style: TextStyle(
              fontFamily: 'Archivo',
              fontSize: screenWidth * 0.055,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        body: Column(
          children: [
            Divider(
              color: Color.fromRGBO(239, 239, 239, 1),
            ),
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.025),
              child: Row(
                children: [
                  Container(
                    height: screenHeight * 0.07,
                    width: screenWidth * 0.15,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color.fromRGBO(239, 239, 239, 1),
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Image.asset("assets/images/jioLogo.png"),
                    ),
                  ),
                  SizedBox(
                    width: screenWidth * 0.03,
                  ),
                  Text(
                    "Reliance Retail Limited - AJIO",
                    style: TextStyle(
                      fontFamily: 'Archivo',
                      fontSize: screenWidth * 0.045,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: Color.fromRGBO(239, 239, 239, 1),
            ),
            SizedBox(
              height: screenWidth * 0.03,
            ),
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.025),
              child: Container(
                width: screenWidth,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromRGBO(239, 239, 239, 1),
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "assets/images/choosePaymentMethod.png",
                            scale: screenWidth * 0.008,
                          ),
                          SizedBox(
                            width: screenWidth * 0.03,
                          ),
                          Text(
                            "Choose a Payment Method",
                            style: TextStyle(
                              fontFamily: 'Archivo',
                              fontSize: screenWidth * 0.045,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        color: Color.fromRGBO(239, 239, 239, 1),
                      ),
                      buildPaymentTile(
                        method: PaymentMethod.card,
                        title: "Credit or debit card",
                        iconPath: "assets/images/creditDebitCardICon.png",
                        logos: [
                          "assets/images/Visa.png",
                          "assets/images/Amex.png",
                          "assets/images/Mastercard.png",
                        ],
                      ),
                      if (selectedMethod == PaymentMethod.card) ...[
                        SizedBox(
                          height: screenHeight * 0.015,
                        ),
                        AnimatedContainer(
                          duration: Duration(milliseconds: 400),
                          width: screenWidth,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color.fromRGBO(239, 239, 239, 1),
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: screenHeight * 0.03,
                                      width: screenWidth * 0.07,
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Image.asset(
                                            "assets/images/creditDebitCardICon.png"),
                                      ),
                                    ),
                                    SizedBox(
                                      width: screenWidth * 0.03,
                                    ),
                                    Text(
                                      "Card Information",
                                      style: TextStyle(
                                        fontFamily: 'Archivo',
                                        fontSize: screenWidth * 0.045,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                                Divider(
                                  color: Color.fromRGBO(239, 239, 239, 1),
                                ),
                                Text(
                                  "Card Number",
                                  style: TextStyle(
                                    fontFamily: 'Archivo',
                                    fontSize: screenWidth * 0.025,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(
                                  height: screenWidth * 0.003,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: SizedBox(
                                        height: screenHeight * 0.05,
                                        child: TextFormField(
                                          focusNode: _cardFocusNode,
                                          keyboardType: TextInputType.number,
                                          inputFormatters: [
                                            FilteringTextInputFormatter
                                                .digitsOnly,
                                            LengthLimitingTextInputFormatter(
                                                19),
                                            CardNumberInputFormatter(),
                                          ],
                                          decoration: InputDecoration(
                                            hintText: '1234 5678 9012 3456',
                                            hintStyle: TextStyle(
                                              fontFamily: 'Inter',
                                              fontSize: screenWidth * 0.035,
                                              fontWeight: FontWeight.w100,
                                              color: Color.fromRGBO(118, 115, 128, 1),
                                            ),
                                            labelStyle: TextStyle(
                                              fontFamily: 'Archivo',
                                              fontSize: screenWidth * 0.035,
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color.fromRGBO(239, 239, 239, 1),
                                              ),
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(6),
                                                bottomLeft: Radius.circular(6),
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color.fromRGBO(176, 176, 176, 1),
                                                width: 1.5,
                                              ),
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(6),
                                                bottomLeft: Radius.circular(6),
                                              ),
                                            ),
                                            suffixIcon: Icon(Icons.lock_outline_sharp),
                                          ),
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Card number is required';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: screenHeight * 0.05,
                                      width: screenWidth * 0.13,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: _cardFocusNode.hasFocus
                                              ? Color.fromRGBO(176, 176, 176, 1) // Focused
                                              : Color.fromRGBO(239, 239, 239, 1), // Default
                                          width: _cardFocusNode.hasFocus ? 1.5 : 1,
                                        ),
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(4),
                                          bottomRight: Radius.circular(4),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: screenWidth * 0.005,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    // Expiry Date
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,

                                      children: [
                                        Text(
                                          "Expiry Date",
                                          style: TextStyle(
                                            fontFamily: 'Archivo',
                                            fontSize: screenWidth * 0.025,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        SizedBox(height: screenWidth * 0.01),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: screenWidth * 0.25,
                                              height: screenHeight * 0.05,
                                              child: TextFormField(
                                                keyboardType: TextInputType.number,
                                                inputFormatters: [
                                                  LengthLimitingTextInputFormatter(
                                                      5),
                                                  ExpiryDateInputFormatter(),
                                                ],
                                                decoration: InputDecoration(
                                                  hintText: 'MM/YY',
                                                  hintStyle: TextStyle(
                                                    fontFamily: 'Archivo',
                                                    fontSize: screenWidth * 0.035,
                                                    fontWeight: FontWeight.w100,
                                                    color: Color.fromRGBO(
                                                        118, 115, 128, 1),
                                                  ),
                                                  enabledBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color.fromRGBO(239, 239, 239, 1),
                                                    ),
                                                    borderRadius: BorderRadius.only(
                                                      topLeft: Radius.circular(6),
                                                      bottomLeft: Radius.circular(6),
                                                    ),
                                                  ),
                                                  focusedBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color.fromRGBO(176, 176, 176, 1),
                                                      width: 1.5,
                                                    ),
                                                    borderRadius: BorderRadius.only(
                                                      topLeft: Radius.circular(6),
                                                      bottomLeft: Radius.circular(6),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              height: screenHeight * 0.05,
                                              width: screenWidth * 0.13,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: _cardFocusNode.hasFocus
                                                      ? Color.fromRGBO(176, 176, 176, 1) // Focused
                                                      : Color.fromRGBO(239, 239, 239, 1), // Default
                                                  width: _cardFocusNode.hasFocus ? 1.5 : 1,
                                                ),
                                                borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(4),
                                                  bottomRight: Radius.circular(4),
                                                ),
                                              ),
                                              child: Icon(Icons.calendar_today_outlined),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    // CVV
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "CVC/CVV",
                                          style: TextStyle(
                                            fontFamily: 'Archivo',
                                            fontSize: screenWidth * 0.025,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        SizedBox(height: screenWidth * 0.01),
                                        SizedBox(
                                          width: screenWidth * 0.4,
                                          height: screenHeight * 0.05,
                                          child: TextField(
                                            keyboardType: TextInputType.number,
                                            inputFormatters: [
                                              FilteringTextInputFormatter
                                                  .digitsOnly,
                                              LengthLimitingTextInputFormatter(
                                                  4),
                                            ],
                                            decoration: InputDecoration(
                                              hintText: '123',
                                              hintStyle: TextStyle(
                                                fontFamily: 'Inter',
                                                fontSize: screenWidth * 0.035,
                                                fontWeight: FontWeight.w100,
                                                color: Color.fromRGBO(
                                                    118, 115, 128, 1),
                                              ),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: screenHeight * 0.015,
                                ),
                                Container(
                                  height: screenHeight * 0.035,
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(16, 187, 0, 1)
                                        .withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          "assets/images/securePayments.png",
                                          scale: screenWidth * 0.005,
                                        ),
                                        SizedBox(
                                          width: screenWidth * 0.025,
                                        ),
                                        Text(
                                          "Payment is secure and encrypted",
                                          style: TextStyle(
                                            fontFamily: 'Archivo',
                                            fontSize: screenWidth * 0.035,
                                            color:
                                                Color.fromRGBO(16, 187, 0, 1),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                      buildPaymentTile(
                        method: PaymentMethod.netBanking,
                        title: "Net Banking",
                        iconPath: "assets/images/banks.png",
                        logos: [
                          "assets/images/Visa.png",
                          "assets/images/Amex.png",
                          "assets/images/Mastercard.png",
                        ],
                      ),
                      buildPaymentTile(
                        method: PaymentMethod.upi,
                        title: "UPI",
                        iconPath: "assets/images/creditDebitCardICon.png",
                        logos: [
                          "assets/images/Visa.png",
                          "assets/images/Amex.png",
                          "assets/images/Mastercard.png",
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPaymentTile({
    required PaymentMethod method,
    required String title,
    required String iconPath,
    required List<String> logos,
  }) {
    bool isSelected = selectedMethod == method;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedMethod = method;
        });
      },
      child: Container(
        width: screenWidth,
        decoration: BoxDecoration(
          border: Border.all(
            color: Color.fromRGBO(239, 239, 239, 1),
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children: [
              Container(
                height: screenHeight * 0.03,
                width: screenWidth * 0.07,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromRGBO(239, 239, 239, 1),
                  ),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Image.asset(iconPath),
                ),
              ),
              SizedBox(
                width: screenWidth * 0.03,
              ),
              Text(
                title,
                style: TextStyle(
                  fontFamily: 'Archivo',
                  fontSize: screenWidth * 0.035,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                width: screenWidth * 0.03,
              ),
              ...logos.map((imgPath) {
                return Padding(
                  padding: EdgeInsets.only(left: screenWidth * 0.01),
                  child: Container(
                    height: screenHeight * 0.03,
                    width: screenWidth * 0.07,
                    child: Image.asset(imgPath),
                  ),
                );
              }).toList(),
              Spacer(),
              Icon(
                isSelected
                    ? Icons.radio_button_checked
                    : Icons.radio_button_unchecked,
                color: isSelected ? Colors.black : Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum PaymentMethod { card, netBanking, upi }
