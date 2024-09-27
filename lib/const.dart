import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

//Colors
const Color darkBlackColor = Color(0xFF191919);
const Color midBlackColor = Color(0xFF757575);
const Color lightBlackColor = Color(0xFFE8E8E8);
Color? lightBlueColor = Colors.blue.withOpacity(0.06);
Color? cardBlueColor = whiteColor;
const Color whiteColor = Colors.white;
const Color redColor = Color(0xFF592222);
const Color lightRedColor = Color(0xFF934646);
const Color orangeColor = Color(0xFFFE8833);
const Color lightGreenColor = Color(0xFFCCEDCE);
const Color mainBlueColor = Color(0xFF002D62);

//Value
const mainPadding = EdgeInsets.fromLTRB(20, 0, 20, 10);

nextPage(BuildContext context, Widget page) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}

screenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

screenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

copyText(String text) {
  Clipboard.setData(ClipboardData(text: text));
}

String formatDate(String date) {
  DateTime parsedDate = DateTime.parse(date);
  DateFormat formatter = DateFormat('dd MMM, yyyy');
  return formatter.format(parsedDate);
}

class CustomButton extends StatelessWidget {
  String? text;
  Function()? onPressed;
  CustomButton({
    required this.text,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: redColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            // side: BorderSide(
            //     color: ,
            //     width: 1),
          ),
        ),
        child: Text(
          text!,
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(
        Icons.arrow_back_ios_new,
        size: 20,
        color: midBlackColor,
      ),
    );
  }
}

class CellContainer extends StatelessWidget {
  Widget child;
  CellContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2),
      decoration: BoxDecoration(
        color: lightBlackColor,
        borderRadius: BorderRadius.circular(10),
        // border:
        //     Border.all(color: darkBlackColor)
      ),
      child: child,
    );
  }
}

class MainContainer extends StatelessWidget {
  Widget child;
  MainContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: whiteColor, borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.all(10),
      child: child,
    );
  }
}

class LoaderWidget extends StatelessWidget {
  const LoaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(
      color: redColor,
    );
  }
}

toast(BuildContext context, {String? msg}) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: midBlackColor,
      content: Text(
        msg ?? "copied",
        style: const TextStyle(
            fontWeight: FontWeight.w600, fontSize: 15, color: Colors.white),
      )));
}

AppBar AppBarWidget(
    {bool backButton = true, String? title, List<Widget>? action}) {
  return AppBar(
    toolbarHeight: 75,
    leading: backButton ? const BackButtonWidget() : const SizedBox(),
    backgroundColor: mainBlueColor,
    title: Text(
      title!,
      style: const TextStyle(
          fontSize: 14, fontWeight: FontWeight.w600, color: whiteColor),
    ),
    centerTitle: true,
    actions: action,
  );
}

List<String> countriesList = [
  "Abkhazia",
  "Afghanistan",
  "Albania",
  "Alderney",
  "Algeria",
  "Ambazonia",
  "American Samoa",
  "Andalusia",
  "Andorra",
  "Angola",
  "Anguilla",
  "Antigua and Barbuda",
  "Argentina",
  "Armenia",
  "Artsakh",
  "Aruba",
  "Asturias",
  "Australia",
  "Austria",
  "Azerbaijan",
  "Bahamas",
  "Bahrain",
  "Bangladesh",
  "Barawa",
  "Barbados",
  "Basque Country",
  "Belarus",
  "Belgium",
  "Belize",
  "Benin",
  "Bermuda",
  "Bhutan",
  "Bolivia",
  "Bonaire",
  "Bosnia and Herzegovina",
  "Botswana",
  "Brazil",
  "British Virgin Islands",
  "Brittany",
  "Brunei",
  "Bulgaria",
  "Burkina Faso",
  "Burundi",
  "Cambodia",
  "Cameroon",
  "Canada",
  "Canary Islands",
  "Cape Verde",
  "Cascadia",
  "Catalonia",
  "Cayman Islands",
  "Central African Republic",
  "Central Spain",
  "Chad",
  "Chagos Islands",
  "Chechnya",
  "Chile",
  "China PR",
  "Cilento",
  "Colombia",
  "Comoros",
  "Congo",
  "Cook Islands",
  "Corsica",
  "Costa Rica",
  "Croatia",
  "Cuba",
  "Curaçao",
  "Cyprus",
  "Czech Republic",
  "Czechoslovakia",
  "DR Congo",
  "Denmark",
  "Djibouti",
  "Dominica",
  "Dominican Republic",
  "Donetsk PR",
  "Ecuador",
  "Egypt",
  "El Salvador",
  "Elba Island",
  "Ellan Vannin",
  "England",
  "Equatorial Guinea",
  "Eritrea",
  "Estonia",
  "Eswatini",
  "Ethiopia",
  "Faroe Islands",
  "Fiji",
  "Finland",
  "France",
  "Franconia",
  "French Guiana",
  "Gabon",
  "Galicia",
  "Gambia",
  "Georgia",
  "German DR",
  "Germany",
  "Ghana",
  "Gibraltar",
  "Gozo",
  "Greece",
  "Greenland",
  "Grenada",
  "Guadeloupe",
  "Guam",
  "Guatemala",
  "Guernsey",
  "Guinea",
  "Guinea-Bissau",
  "Guyana",
  "Haiti",
  "Honduras",
  "Hong Kong",
  "Hungary",
  "Iceland",
  "India",
  "Indonesia",
  "Iran",
  "Iraq",
  "Israel",
  "Italy",
  "Ivory Coast",
  "Jamaica",
  "Japan",
  "Jersey",
  "Jordan",
  "Kazakhstan",
  "Kenya",
  "Kernow",
  "Kosovo",
  "Kuwait",
  "Kyrgyzstan",
  "Laos",
  "Latvia",
  "Lebanon",
  "Lesotho",
  "Liberia",
  "Libya",
  "Liechtenstein",
  "Lithuania",
  "Luhansk PR",
  "Luxembourg",
  "Macau",
  "Madagascar",
  "Madrid",
  "Malawi",
  "Malaysia",
  "Maldives",
  "Mali",
  "Malta",
  "Manchukuo",
  "Martinique",
  "Mauritania",
  "Mauritius",
  "Mayotte",
  "Mexico",
  "Micronesia",
  "Moldova",
  "Monaco",
  "Mongolia",
  "Montenegro",
  "Morocco",
  "Mozambique",
  "Myanmar",
  "Namibia",
  "Nepal",
  "Netherlands",
  "New Caledonia",
  "New Zealand",
  "Nicaragua",
  "Niger",
  "Nigeria",
  "North Korea",
  "North Macedonia",
  "North Vietnam",
  "Northern Cyprus",
  "Northern Ireland",
  "Northern Mariana Islands",
  "Norway",
  "Occitania",
  "Oman",
  "Padania",
  "Pakistan",
  "Palau",
  "Palestine",
  "Panama",
  "Panjab",
  "Papua New Guinea",
  "Paraguay",
  "Parishes of Jersey",
  "Peru",
  "Philippines",
  "Poland",
  "Portugal",
  "Provence",
  "Puerto Rico",
  "Qatar",
  "Raetia",
  "Republic of Ireland",
  "Romani people",
  "Romania",
  "Russia",
  "Rwanda",
  "Ryūkyū",
  "Réunion",
  "Saarland",
  "Saint Barthélemy",
  "Saint Helena",
  "Saint Kitts and Nevis",
  "Saint Lucia",
  "Saint Martin",
  "Saint Vincent and the Grenadines",
  "Samoa",
  "San Marino",
  "Saudi Arabia",
  "Saugeais",
  "Scotland",
  "Sealand",
  "Seborga",
  "Senegal",
  "Serbia",
  "Seychelles",
  "Sierra Leone",
  "Silesia",
  "Singapore",
  "Sint Maarten",
  "Slovakia",
  "Slovenia",
  "Solomon Islands",
  "Somalia",
  "Somaliland",
  "South Africa",
  "South Korea",
  "South Ossetia",
  "South Sudan",
  "Spain",
  "Sri Lanka",
  "Sudan",
  "Suriname",
  "Surrey",
  "Sweden",
  "Switzerland",
  "Syria",
  "Székely Land",
  "Sápmi",
  "São Tomé and Príncipe",
  "Tahiti",
  "Taiwan",
  "Tajikistan",
  "Tamil Eelam",
  "Tanzania",
  "Thailand",
  "Tibet",
  "Ticino",
  "Timor-Leste",
  "Togo",
  "Tonga",
  "Trinidad and Tobago",
  "Tunisia",
  "Turkey",
  "Turkmenistan",
  "Turks and Caicos Islands",
  "Tuvalu",
  "Uganda",
  "Ukraine",
  "United Arab Emirates",
  "United Koreans of Japan",
  "United States",
  "United States Virgin Islands",
  "Uruguay",
  "Uzbekistan",
  "Vanuatu",
  "Vatican City",
  "Venezuela",
  "Vietnam",
  "Vietnam Republic",
  "Wales",
  "West Papua",
  "Yemen",
  "Yemen DPR",
  "Ynys Môn",
  "Yorkshire",
  "Yugoslavia",
  "Zambia",
  "Zanzibar",
  "Zimbabwe",
  "Åland"
];
