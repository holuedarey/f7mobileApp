import 'package:f7apparel_mobile/blocs/product/product_cubit.dart';
import 'package:f7apparel_mobile/features/common/basket_icon.dart';
import 'package:f7apparel_mobile/features/dashboard/presentation/widgets/feature_product.dart';
import 'package:f7apparel_mobile/features/shimmer_loading/shimmer_loading.dart';
import 'package:f7apparel_mobile/global_bloc_provider.dart';
import 'package:f7apparel_mobile/models/product_list/top_brand.dart';
import 'package:f7apparel_mobile/widgets/colors.dart';
import 'package:f7apparel_mobile/widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/app_bar.dart';

class ShopBody extends StatelessWidget {
  const ShopBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => IconsCubit()..fetchIconsRequest(),
      child: const ShopWidget(),
    );
  }
}

class ShopWidget extends StatefulWidget {
  const ShopWidget({Key? key}) : super(key: key);

  @override
  State<ShopWidget> createState() => _ShopWidgetState();
}

class _ShopWidgetState extends State<ShopWidget> {
  @override
  Widget build(BuildContext context) {
    String? _dropDownValue;
    final theme = Theme.of(context);
    const bool isLoading = false;
    RangeValues _currentRangeValues = const RangeValues(10, 80);
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: const AppBarHeader(isLogo: false, title: "Shop"),
          actions: const [BasketIcon()],
        ),
        // drawer: const DashboardSidebar(),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              color: Color(0xFFE0E0E0),
              // border: Border.all(color: Colors.grey.shade200)
            ),
            child: Column(
              children: [
                Row(children: [
                  GestureDetector(
                    onTap: () {
                      print("Tapped a Container");
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.brandBtn,
                        borderRadius: BorderRadius.circular(60),
                        // border: Border.all(color: index == 0 ? Colors.grey.shade200 : Colors.grey.shade200)
                      ),
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      height: 30,
                      child: Row(
                        children: [
                          Text('All Brands',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                fontFamily: 'WokSans',
                                fontFamilyFallback: const <String>['OpenSans'],
                              )),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: BlocProvider(
                        create: (context) => ProductCubit()..getTopBrand({}),
                        child: BlocBuilder<ProductCubit, ProductState>(
                          builder: (context, state) {
                            if (state is ProductInitialisedState) {
                              return  Container();
                            } else if (state is ProductLoadingState) {
                              return  Container();
                            } else if (state is TopBrandSuccessfulState) {
                              return SizedBox(
                                  height: 30,
                                  width: MediaQuery.of(context).size.width * 0.96,
                                  child: ListView.builder(
                                    physics: const AlwaysScrollableScrollPhysics(),
                                      itemCount: state.topBrands.length,
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      clipBehavior: Clip.none,
                                      itemBuilder: (context, index) {
                                        TopBrandModel product =
                                            state.topBrands[index];
                                        return GestureDetector(
                                          onTap: () {
                                            print("Tapped a Container");
                                          },
                                          child: AspectRatio(
                                            aspectRatio: 16 / 5.5,
                                            child: Container(
                                              // width: 100,
                                              decoration: BoxDecoration(
                                                color: Colors.grey.shade200,
                                                borderRadius:
                                                    BorderRadius.circular(60),
                                                // border: Border.all(color: index == 0 ? Colors.grey.shade200 : Colors.grey.shade200)
                                              ),
                                              margin: const EdgeInsets.symmetric(
                                                  horizontal: 5),
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 8),
                                              height: 30,
                                              child: Row(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Text(product.name,
                                                      textAlign: TextAlign.center,
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 14.sp,
                                                        overflow: TextOverflow.ellipsis,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontFamily: 'WokSans',
                                                        fontFamilyFallback: const <
                                                            String>['OpenSans'],
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      }));
                            } else if (state is ProductFailedState) {
                              return const SizedBox.shrink();
                            }
                            return Container();
                          },
                        )),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    icon: const Icon(Icons.more_horiz),
                  )
                ]),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      padding: const EdgeInsets.only(left: 5),
                      height: 30,
                      child: Row(
                        children: [
                          Text('Filter',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: const Color(0xdd3E4352),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                fontFamily: 'WokSans',
                                fontFamilyFallback: const <String>['OpenSans'],
                              )),
                          IconButton(
                            onPressed: () {
                              showGeneralDialog(
                                context: context,
                                barrierDismissible: true,
                                transitionDuration: Duration(milliseconds: 500),
                                barrierLabel: MaterialLocalizations.of(context)
                                    .dialogLabel,
                                barrierColor: Colors.black.withOpacity(0.5),
                                pageBuilder: (context, _, __) {
                                  return Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        margin: const EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 30,
                                        ),
                                        color: Colors.white,
                                        child: Card(
                                          margin: const EdgeInsets.all(10),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  const Text("Filter",
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xFF000000),
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w800,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontFamily: 'WokSans',
                                                        fontFamilyFallback: <
                                                            String>['OpenSans'],
                                                      )),
                                                  const Spacer(),
                                                  Container(
                                                    height: 40,
                                                    width: 40,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          Colors.grey.shade200,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50),
                                                    ),
                                                    child: IconButton(
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      icon: const Icon(
                                                          Icons.close,
                                                          size: 18,
                                                          weight: 600),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              const Divider(
                                                  color: Color(0XFFE5E5E5),
                                                  thickness: 1.0),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  const Text("FILTER BY PRICE",
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xFF000000),
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w800,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontFamily: 'WokSans',
                                                        fontFamilyFallback: <
                                                            String>['OpenSans'],
                                                      )),
                                                  const Spacer(),
                                                  Container(
                                                    height: 30,
                                                    width: 80,
                                                    child: ElevatedButton(
                                                        onPressed: null,
                                                        style: OutlinedButton
                                                            .styleFrom(
                                                          elevation: 1,
                                                          textStyle:
                                                              const TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontFamily:
                                                                'WokSans',
                                                          ),
                                                          backgroundColor:
                                                              Colors.white,
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  vertical:
                                                                      6.0),
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30.0),
                                                          ),
                                                          minimumSize:
                                                              const Size(
                                                                  10, 30),
                                                          maximumSize:
                                                              const Size(
                                                                  10, 30),
                                                          side: const BorderSide(
                                                              color:
                                                                  Colors.black,
                                                              width: 1.0,
                                                              style: BorderStyle
                                                                  .solid),
                                                        ),
                                                        child: const Text(
                                                          "Clear",
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              color:
                                                                  Colors.black),
                                                        )),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              RangeSlider(
                                                activeColor: AppColors.brandBtn,
                                                values: _currentRangeValues,
                                                max: 100,
                                                divisions: 5,
                                                labels: RangeLabels(
                                                  _currentRangeValues.start
                                                      .round()
                                                      .toString(),
                                                  _currentRangeValues.end
                                                      .round()
                                                      .toString(),
                                                ),
                                                onChanged:
                                                    (RangeValues values) {
                                                  setState(() {
                                                    _currentRangeValues =
                                                        values;
                                                  });
                                                },
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  const Text(
                                                      "FILTER BY CATEGORIES",
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xFF000000),
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w800,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontFamily: 'WokSans',
                                                        fontFamilyFallback: <
                                                            String>['OpenSans'],
                                                      )),
                                                  const Spacer(),
                                                  Container(
                                                    height: 30,
                                                    width: 80,
                                                    child: ElevatedButton(
                                                        onPressed: null,
                                                        style: OutlinedButton
                                                            .styleFrom(
                                                          elevation: 1,
                                                          textStyle:
                                                              const TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontFamily:
                                                                'WokSans',
                                                          ),
                                                          backgroundColor:
                                                              Colors.white,
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  vertical:
                                                                      6.0),
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30.0),
                                                          ),
                                                          minimumSize:
                                                              const Size(
                                                                  10, 30),
                                                          maximumSize:
                                                              const Size(
                                                                  10, 30),
                                                          side: const BorderSide(
                                                              color:
                                                                  Colors.black,
                                                              width: 1.0,
                                                              style: BorderStyle
                                                                  .solid),
                                                        ),
                                                        child: const Text(
                                                          "Clear",
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              color:
                                                                  Colors.black),
                                                        )),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              ListView(
                                                shrinkWrap: true,
                                                children: <Widget>[
                                                  ListTile(
                                                    title: Text('On Sale'),
                                                    onTap: () =>
                                                        Navigator.of(context)
                                                            .pop('item1'),
                                                  ),
                                                  ListTile(
                                                    title: Text('New Arrivals'),
                                                    onTap: () =>
                                                        Navigator.of(context)
                                                            .pop('item2'),
                                                  ),
                                                  ListTile(
                                                    title: Text('Bracelets'),
                                                    onTap: () =>
                                                        Navigator.of(context)
                                                            .pop('item3'),
                                                  ),
                                                  ListTile(
                                                    title: Text('Necklace'),
                                                    onTap: () =>
                                                        Navigator.of(context)
                                                            .pop('item3'),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                                transitionBuilder: (context, animation,
                                    secondaryAnimation, child) {
                                  return SlideTransition(
                                    position: CurvedAnimation(
                                      parent: animation,
                                      curve: Curves.easeOut,
                                    ).drive(Tween<Offset>(
                                      begin: Offset(0, -1.0),
                                      end: Offset.zero,
                                    )),
                                    child: child,
                                  );
                                },
                              );
                            },
                            icon: const Icon(
                              Icons.filter_list,
                              size: 15,
                              weight: 60,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      padding: const EdgeInsets.only(left: 5),
                      height: 30,
                      child: Row(
                        children: [
                          Text('Sort By Price:',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: const Color(0xdd3E4352),
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                fontFamily: 'WokSans',
                                fontFamilyFallback: const <String>['OpenSans'],
                              )),
                          Container(
                            width: 80,
                            padding: const EdgeInsets.only(left: 3),
                            margin: const EdgeInsets.only(left: 4, right: 3),
                            child: DropdownButton<String>(
                              value: _dropDownValue,
                              isExpanded: true,
                              iconSize: 20.0,
                              hint: _dropDownValue == null
                                  ? const Text('Dropdown',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xdd3E4352),
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                        fontFamily: 'WokSans',
                                        fontFamilyFallback: <String>[
                                          'OpenSans'
                                        ],
                                      ))
                                  : Text(_dropDownValue,
                                      style: TextStyle(
                                        color: const Color(0xdd3E4352),
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                        fontFamily: 'WokSans',
                                        fontFamilyFallback: const <String>[
                                          'OpenSans'
                                        ],
                                      )),
                              items: <String>[
                                'High to low',
                                'Low to High',
                                'All'
                              ].map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child:
                                      Text(value, textAlign: TextAlign.center),
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                setState(() {
                                  _dropDownValue = newValue;
                                });
                                print(_dropDownValue);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      padding: const EdgeInsets.only(left: 5),
                      height: 30,
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              // Scaffold.of(context).openDrawer();
                            },
                            icon: const Icon(
                              Icons.grid_view_outlined,
                              size: 18,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              // Scaffold.of(context).openDrawer();
                            },
                            icon: const Icon(
                              Icons.view_column,
                              size: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const VerticalSpace(size: 5),
                const FeaturedProducts(),
              ],
            ),
          ),
        ));
  }
}

class CustomSearch extends SearchDelegate {
  List<String> allData = [
    "Afghanistan",
    "Albania",
    "Algeria",
    "Andorra",
    "Angola",
    "Anguilla",
    "Antigua &amp; Barbuda",
    "Argentina",
    "Armenia",
    "Aruba",
    "Australia",
    "Austria",
    "Azerbaijan",
    "Bahamas",
    "Bahrain",
    "Bangladesh",
    "Barbados",
    "Belarus",
    "Belgium",
    "Belize",
    "Benin",
    "Bermuda",
    "Bhutan",
    "Bolivia",
    "Bosnia &amp; Herzegovina",
    "Botswana",
    "Brazil",
    "British Virgin Islands",
    "Brunei",
    "Bulgaria",
    "Burkina Faso",
    "Burundi",
    "Cambodia",
    "Cameroon",
    "Cape Verde",
    "Cayman Islands",
    "Chad",
    "Chile",
    "China",
    "Colombia",
    "Congo",
    "Cook Islands",
    "Costa Rica",
    "Cote D Ivoire",
    "Croatia",
    "Cruise Ship",
    "Cuba",
    "Cyprus",
    "Czech Republic",
    "Denmark",
    "Djibouti",
    "Dominica",
    "Dominican Republic",
    "Ecuador",
    "Egypt",
    "El Salvador",
    "Equatorial Guinea",
    "Estonia",
    "Ethiopia",
    "Falkland Islands",
    "Faroe Islands",
    "Fiji",
    "Finland",
    "France",
    "French Polynesia",
    "French West Indies",
    "Gabon",
    "Gambia",
    "Georgia",
    "Germany",
    "Ghana",
    "Gibraltar",
    "Greece",
    "Greenland",
    "Grenada",
    "Guam",
    "Guatemala",
    "Guernsey",
    "Guinea",
    "Guinea Bissau",
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
    "Ireland",
    "Isle of Man",
    "Israel",
    "Italy",
    "Jamaica",
    "Japan",
    "Jersey",
    "Jordan",
    "Kazakhstan",
    "Kenya",
    "Kuwait",
    "Kyrgyz Republic",
    "Laos",
    "Latvia",
    "Lebanon",
    "Lesotho",
    "Liberia",
    "Libya",
    "Liechtenstein",
    "Lithuania",
    "Luxembourg",
    "Macau",
    "Macedonia",
    "Madagascar",
    "Malawi",
    "Malaysia",
    "Maldives",
    "Mali",
    "Malta",
    "Mauritania",
    "Mauritius",
    "Mexico",
    "Moldova",
    "Monaco",
    "Mongolia",
    "Montenegro",
    "Montserrat",
    "Morocco",
    "Mozambique",
    "Namibia",
    "Nepal",
    "Netherlands",
    "Netherlands Antilles",
    "New Caledonia",
    "New Zealand",
    "Nicaragua",
    "Niger",
    "Nigeria",
    "Norway",
    "Oman",
    "Pakistan",
    "Palestine",
    "Panama",
    "Papua New Guinea",
    "Paraguay",
    "Peru",
    "Philippines",
    "Poland",
    "Portugal",
    "Puerto Rico",
    "Qatar",
    "Reunion",
    "Romania",
    "Russia",
    "Rwanda",
    "Saint Pierre &amp; Miquelon",
    "Samoa",
    "San Marino",
    "Satellite",
    "Saudi Arabia",
    "Senegal",
    "Serbia",
    "Seychelles",
    "Sierra Leone",
    "Singapore",
    "Slovakia",
    "Slovenia",
    "South Africa",
    "South Korea",
    "Spain",
    "Sri Lanka",
    "St Kitts &amp; Nevis",
    "St Lucia",
    "St Vincent",
    "St. Lucia",
    "Sudan",
    "Suriname",
    "Swaziland",
    "Sweden",
    "Switzerland",
    "Syria",
    "Taiwan",
    "Tajikistan",
    "Tanzania",
    "Thailand",
    "Timor L'Este",
    "Togo",
    "Tonga",
    "Trinidad &amp; Tobago",
    "Tunisia",
    "Turkey",
    "Turkmenistan",
    "Turks &amp; Caicos",
    "Uganda",
    "Ukraine",
    "United Arab Emirates",
    "United Kingdom",
    "Uruguay",
    "Uzbekistan",
    "Venezuela",
    "Vietnam",
    "Virgin Islands (US)",
    "Yemen",
    "Zambia",
    "Zimbabwe"
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var item in allData) {
      if (item.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    return ListView.builder(itemBuilder: (context, index) {
      var result = '';
      if (matchQuery != null && matchQuery.length > index) {
        result = matchQuery[index];
      }
      return ListTile(
        title: Text(result),
      );
    });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var item in allData) {
      if (item.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    return ListView.builder(itemBuilder: (context, index) {
      var result = '';
      if (matchQuery != null && matchQuery.length > index) {
        result = matchQuery[index];
      }
      // return Text("");
      return ListTile(
        title: Text(result),
      );
    });
  }
}
