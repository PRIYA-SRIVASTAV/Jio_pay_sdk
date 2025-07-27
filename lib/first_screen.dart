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
      MediaQuery
          .of(navigatorKey.currentState!.context)
          .size
          .width;
  final screenHeight =
      MediaQuery
          .of(navigatorKey.currentState!.context)
          .size
          .height;
  final FocusNode _cardFocusNode = FocusNode();
  final FocusNode _cardFocusNode2 = FocusNode();
  final FocusNode _cardFocusNode3 = FocusNode();
  final List<Bank> bankList = [
    Bank(name: "SBI", logoPath: "assets/images/sbiBAnk.png", status: true),
    Bank(name: "HDFC", logoPath: "assets/images/sbiBAnk.png", status: false),
    Bank(name: "ICICI", logoPath: "assets/images/sbiBAnk.png", status: false),
    Bank(name: "Axis", logoPath: "assets/images/sbiBAnk.png", status: true),
    Bank(name: "PNB", logoPath: "assets/images/sbiBAnk.png", status: false),
    Bank(
        name: "Bank of Baroda",
        logoPath: "assets/images/sbiBAnk.png",
        status: false),
    Bank(
        name: "Canara Bank",
        logoPath: "assets/images/sbiBAnk.png",
        status: false),
    Bank(name: "IDFC", logoPath: "assets/images/sbiBAnk.png", status: false),
  ];

  @override
  void initState() {
    super.initState();
    _cardFocusNode.addListener(() {
      setState(() {});
    });
    _cardFocusNode2.addListener(() {
      setState(() {});
    });
    _cardFocusNode3.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _cardFocusNode.dispose();
    _cardFocusNode2.dispose();
    _cardFocusNode3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Checkout",
            style: TextStyle(
              fontFamily: 'Archivo',
              fontSize: SizeConfig.sp(20),
              fontWeight: FontWeight.w500,
            ),
          ),
          leading: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Divider(
                        color: Color.fromRGBO(239, 239, 239, 1),
                      ),
                      Padding(
                        padding: EdgeInsets.all(SizeConfig.w(2)),
                        child: Row(
                          children: [
                            Container(
                              height: SizeConfig.h(7),
                              width: SizeConfig.w(15),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color.fromRGBO(239, 239, 239, 1),
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(SizeConfig.w(2)),
                                child: Image.asset("assets/images/jioLogo.png"),
                              ),
                            ),
                            SizedBox(
                              width: SizeConfig.w(3),
                            ),
                            Text(
                              "Reliance Retail Limited - AJIO",
                              style: TextStyle(
                                fontFamily: 'Archivo',
                                fontSize: SizeConfig.sp(20),
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
                        height: SizeConfig.h(0.1),
                      ),
                      Padding(
                        padding: EdgeInsets.all(SizeConfig.w(2)),
                        child: Container(
                          width: screenWidth,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color.fromRGBO(239, 239, 239, 1),
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(SizeConfig.w(2)),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      "assets/images/choosePaymentMethod.png",
                                      scale: SizeConfig.w(0.75),
                                    ),
                                    SizedBox(
                                      width: SizeConfig.w(3),
                                    ),
                                    Text(
                                      "Choose a Payment Method",
                                      style: TextStyle(
                                        fontFamily: 'Archivo',
                                        fontSize: SizeConfig.sp(18),
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
                                SizedBox(
                                  height: SizeConfig.h(2),
                                ),
                                if (selectedMethod == PaymentMethod.card) ...[
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
                                      padding: EdgeInsets.all(SizeConfig.w(2)),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          buildPaymentMethodTitle(
                                            iconPath:
                                            "assets/images/creditDebitCardICon.png",
                                            title: "Card Information",
                                          ),
                                          Divider(
                                            color: Color.fromRGBO(239, 239, 239, 1),
                                          ),
                                          Text(
                                            "Card Number",
                                            style: TextStyle(
                                              fontFamily: 'Archivo',
                                              fontSize: SizeConfig.sp(10),
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          SizedBox(
                                            height: SizeConfig.h(0.1),
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: SizedBox(
                                                  height: SizeConfig.h(5),
                                                  child: TextFormField(
                                                    focusNode: _cardFocusNode,
                                                    keyboardType: TextInputType
                                                        .number,
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
                                                        fontSize: SizeConfig.sp(12),
                                                        fontWeight: FontWeight.w100,
                                                        color: Color.fromRGBO(
                                                            118, 115, 128, 1),
                                                      ),
                                                      labelStyle: TextStyle(
                                                        fontFamily: 'Archivo',
                                                        fontSize: SizeConfig.sp(16),
                                                      ),
                                                      enabledBorder: OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: Color.fromRGBO(
                                                              239, 239, 239, 1),
                                                        ),
                                                        borderRadius: BorderRadius
                                                            .only(
                                                          topLeft: Radius.circular(6),
                                                          bottomLeft: Radius.circular(
                                                              6),
                                                        ),
                                                      ),
                                                      focusedBorder: OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: Color.fromRGBO(
                                                              176, 176, 176, 1),
                                                          width: SizeConfig.w(0.25),
                                                        ),
                                                        borderRadius: BorderRadius
                                                            .only(
                                                          topLeft: Radius.circular(6),
                                                          bottomLeft: Radius.circular(
                                                              6),
                                                        ),
                                                      ),
                                                      suffixIcon:
                                                      Icon(Icons.lock_outline_sharp),
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
                                                height: SizeConfig.h(5),
                                                width: SizeConfig.w(15),
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: _cardFocusNode.hasFocus
                                                        ? Color.fromRGBO(
                                                        176, 176, 176, 1) // Focused
                                                        : Color.fromRGBO(
                                                        239, 239, 239, 1), // Default
                                                    width: _cardFocusNode.hasFocus
                                                        ? SizeConfig.w(0.25)
                                                        : SizeConfig.w(0.5),
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
                                            height: SizeConfig.h(0.99),
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
                                                      fontSize: SizeConfig.sp(10),
                                                      fontWeight: FontWeight.w400,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: SizeConfig.h(0.99),
                                                  ),
                                                  Row(
                                                    children: [
                                                      SizedBox(
                                                        height: SizeConfig.h(5),
                                                        width: SizeConfig.w(25),
                                                        child: TextFormField(
                                                          focusNode: _cardFocusNode2,
                                                          keyboardType:
                                                          TextInputType.number,
                                                          inputFormatters: [
                                                            LengthLimitingTextInputFormatter(
                                                                7),
                                                            ExpiryDateInputFormatter(),
                                                          ],
                                                          decoration: InputDecoration(
                                                            hintText: 'MM/YYYY',
                                                            hintStyle: TextStyle(
                                                              fontFamily: 'Archivo',
                                                              fontSize: SizeConfig.sp(
                                                                  12),
                                                              fontWeight: FontWeight
                                                                  .w100,
                                                              color: Color.fromRGBO(
                                                                  118, 115, 128, 1),
                                                            ),
                                                            labelStyle: TextStyle(
                                                              fontFamily: 'Archivo',
                                                              fontSize: SizeConfig.sp(
                                                                  16),
                                                            ),
                                                            enabledBorder:
                                                            OutlineInputBorder(
                                                              borderSide: BorderSide(
                                                                color: Color.fromRGBO(
                                                                    239, 239, 239, 1),
                                                              ),
                                                              borderRadius:
                                                              BorderRadius.only(
                                                                topLeft:
                                                                Radius.circular(6),
                                                                bottomLeft:
                                                                Radius.circular(6),
                                                              ),
                                                            ),
                                                            focusedBorder:
                                                            OutlineInputBorder(
                                                              borderSide: BorderSide(
                                                                color: Color.fromRGBO(
                                                                    176, 176, 176, 1),
                                                                width: SizeConfig.w(
                                                                    0.25),
                                                              ),
                                                              borderRadius:
                                                              BorderRadius.only(
                                                                topLeft:
                                                                Radius.circular(6),
                                                                bottomLeft:
                                                                Radius.circular(6),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        height: SizeConfig.h(5),
                                                        width: SizeConfig.w(15),
                                                        decoration: BoxDecoration(
                                                          border: Border.all(
                                                            color:
                                                            _cardFocusNode2.hasFocus
                                                                ? Color.fromRGBO(
                                                                176,
                                                                176,
                                                                176,
                                                                1) // Focused
                                                                : Color.fromRGBO(
                                                                239, 239, 239, 1),
                                                            // Default
                                                            width:
                                                            _cardFocusNode2.hasFocus
                                                                ? SizeConfig.w(0.25)
                                                                : SizeConfig.w(0.5),
                                                          ),
                                                          borderRadius: BorderRadius
                                                              .only(
                                                            topRight: Radius.circular(
                                                                4),
                                                            bottomRight:
                                                            Radius.circular(4),
                                                          ),
                                                        ),
                                                        child: Icon(Icons
                                                            .calendar_today_outlined),
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
                                                      fontSize: SizeConfig.sp(10),
                                                      fontWeight: FontWeight.w400,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: SizeConfig.h(0.99),
                                                  ),
                                                  Row(
                                                    children: [
                                                      SizedBox(
                                                        height: SizeConfig.h(5),
                                                        width: SizeConfig.w(25),
                                                        child: TextFormField(
                                                          focusNode: _cardFocusNode3,
                                                          keyboardType:
                                                          TextInputType.number,
                                                          inputFormatters: [
                                                            FilteringTextInputFormatter
                                                                .digitsOnly,
                                                            LengthLimitingTextInputFormatter(
                                                                4),
                                                          ],
                                                          decoration: InputDecoration(
                                                            hintText: '123',
                                                            hintStyle: TextStyle(
                                                              fontFamily: 'Archivo',
                                                              fontSize: SizeConfig.sp(
                                                                  12),
                                                              fontWeight: FontWeight
                                                                  .w100,
                                                              color: Color.fromRGBO(
                                                                  118, 115, 128, 1),
                                                            ),
                                                            labelStyle: TextStyle(
                                                              fontFamily: 'Archivo',
                                                              fontSize: SizeConfig.sp(
                                                                  16),
                                                            ),
                                                            enabledBorder:
                                                            OutlineInputBorder(
                                                              borderSide: BorderSide(
                                                                color: Color.fromRGBO(
                                                                    239, 239, 239, 1),
                                                              ),
                                                              borderRadius:
                                                              BorderRadius.only(
                                                                topLeft:
                                                                Radius.circular(6),
                                                                bottomLeft:
                                                                Radius.circular(6),
                                                              ),
                                                            ),
                                                            focusedBorder:
                                                            OutlineInputBorder(
                                                              borderSide: BorderSide(
                                                                color: Color.fromRGBO(
                                                                    176, 176, 176, 1),
                                                                width: SizeConfig.w(
                                                                    0.25),
                                                              ),
                                                              borderRadius:
                                                              BorderRadius.only(
                                                                topLeft:
                                                                Radius.circular(6),
                                                                bottomLeft:
                                                                Radius.circular(6),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        height: SizeConfig.h(5),
                                                        width: SizeConfig.w(15),
                                                        decoration: BoxDecoration(
                                                          border: Border.all(
                                                            color:
                                                            _cardFocusNode3.hasFocus
                                                                ? Color.fromRGBO(
                                                                176,
                                                                176,
                                                                176,
                                                                1) // Focused
                                                                : Color.fromRGBO(
                                                                239, 239, 239, 1),
                                                            // Default
                                                            width:
                                                            _cardFocusNode3.hasFocus
                                                                ? SizeConfig.w(0.25)
                                                                : SizeConfig.w(0.5),
                                                          ),
                                                          borderRadius: BorderRadius
                                                              .only(
                                                            topRight: Radius.circular(
                                                                4),
                                                            bottomRight:
                                                            Radius.circular(4),
                                                          ),
                                                        ),
                                                        child: Icon(
                                                            Icons
                                                                .info_outline_rounded),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: SizeConfig.h(0.99),
                                          ),
                                          Container(
                                            height: SizeConfig.h(5),
                                            decoration: BoxDecoration(
                                              color: Color.fromRGBO(16, 187, 0, 1)
                                                  .withOpacity(0.1),
                                              borderRadius: BorderRadius.circular(4),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.all(
                                                  SizeConfig.w(2)),
                                              child: Row(
                                                children: [
                                                  Image.asset(
                                                    "assets/images/securePayments.png",
                                                    scale: SizeConfig.w(1),
                                                  ),
                                                  SizedBox(
                                                    width: SizeConfig.w(3),
                                                  ),
                                                  Text(
                                                    "Payment is secure and encrypted",
                                                    style: TextStyle(
                                                      fontFamily: 'Archivo',
                                                      fontSize: SizeConfig.sp(14),
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
                                SizedBox(
                                  height: SizeConfig.h(2),
                                ),
                                if (selectedMethod == PaymentMethod.netBanking) ...[
                                  AnimatedContainer(
                                    duration: Duration(milliseconds: 400),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Color.fromRGBO(239, 239, 239, 1),
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(SizeConfig.w(2)),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          buildPaymentMethodTitle(
                                            iconPath: "assets/images/banks.png",
                                            title: "Banks",
                                          ),
                                          Divider(
                                            color: Color.fromRGBO(239, 239, 239, 1),
                                          ),
                                          SizedBox(
                                            height: SizeConfig.h(18),
                                            child: GridView.builder(
                                              shrinkWrap: true,
                                              gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 2,
                                                crossAxisSpacing: 2,
                                                mainAxisSpacing: 2,
                                                childAspectRatio: 2 / 0.5,
                                              ),
                                              itemCount: bankList.length > 6
                                                  ? 6
                                                  : bankList.length,
                                              itemBuilder: (context, index) {
                                                if (index == 5 &&
                                                    bankList.length > 6) {
                                                  return GestureDetector(
                                                    onTap: () {},
                                                    child: Container(
                                                      padding: EdgeInsets.all(8),
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: Colors.grey
                                                                .shade300),
                                                        borderRadius:
                                                        BorderRadius.circular(6),
                                                      ),
                                                      child: Center(
                                                        child: Row(
                                                          children: [
                                                            Icon(Icons
                                                                .more_horiz_outlined),
                                                            SizedBox(
                                                              width: SizeConfig.w(3),
                                                            ),
                                                            Text(
                                                              'More Banks',
                                                              style: TextStyle(
                                                                fontFamily: 'Archivo',
                                                                fontSize:
                                                                SizeConfig.sp(13),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }
                                                final bank = bankList[index];
                                                return Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    Image.asset(
                                                      bank.logoPath,
                                                      scale: SizeConfig.w(1),
                                                    ),
                                                    SizedBox(
                                                      width: SizeConfig.w(4),
                                                    ),
                                                    Column(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          bank.name,
                                                          style: TextStyle(
                                                            fontFamily: 'Archivo',
                                                            fontSize: SizeConfig.sp(
                                                                13.5),
                                                          ),
                                                        ),
                                                        if (bank.status == true) ...[
                                                          Row(
                                                            children: [
                                                              Image.asset(
                                                                "assets/images/facingIssue.png",
                                                                scale: SizeConfig.w(
                                                                    1),
                                                              ),
                                                              SizedBox(
                                                                  width: SizeConfig.w(
                                                                      2)),
                                                              Text(
                                                                "Facing issues",
                                                                style: TextStyle(
                                                                  fontFamily: 'Archivo',
                                                                  fontSize:
                                                                  SizeConfig.sp(10),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ],
                                                    ),
                                                  ],
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
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
              ),
              Padding(
                padding: EdgeInsets.all(SizeConfig.w(3),),
                child: Column(
                  children: [
                    Divider(
                      color: Color.fromRGBO(239, 239, 239, 1),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Total Payment  ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: SizeConfig.sp(16),
                                  fontFamily: 'Archivo',
                                ),
                              ),
                              TextSpan(
                                text: '(All-inclusive)',
                                style: TextStyle(
                                  fontFamily: 'Archivo',
                                  color: Colors.grey,
                                  fontSize: SizeConfig.sp(12),
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          "₹ 5050",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: SizeConfig.sp(16),
                            fontFamily: 'Inter',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: SizeConfig.h(2),
                    ),
                    Container(
                      height: SizeConfig.h(5),
                      width: SizeConfig.w(100),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Color.fromRGBO(243, 181, 97, 1),
                          Color.fromRGBO(246, 197, 134, 1)
                        ],),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text("Pay",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: SizeConfig.sp(16),
                            fontFamily: 'Archivo',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.h(2),
                    ),
                    Image.asset("assets/images/jioLogo.png", scale:SizeConfig.w(0.8),),
                    SizedBox(
                      height: SizeConfig.h(1),
                    ),
                  ],
                ),
              ),
            ],
          ),
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

  Widget buildPaymentMethodTitle({
    required String title,
    required String iconPath,
  }) {
    return Row(
      children: [
        Container(
          height: SizeConfig.h(2),
          width: SizeConfig.w(5),
          child: Image.asset(iconPath),
        ),
        SizedBox(
          width: SizeConfig.w(2),
        ),
        Text(
          title,
          style: TextStyle(
            fontFamily: 'Archivo',
            fontSize: SizeConfig.sp(16),
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}

enum PaymentMethod { card, netBanking, upi }

class Bank {
  final String name;
  final String logoPath;
  final bool status;

  Bank({required this.name, required this.logoPath, required this.status});
}
