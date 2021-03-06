import 'package:e_commerce_app/constants/global_variables.dart';
import 'package:e_commerce_app/features/commonWidgets/loader.dart';
import 'package:e_commerce_app/features/home/widgets/address_box.dart';
import 'package:e_commerce_app/features/product_detail/screens/product_detail_screen.dart';
import 'package:e_commerce_app/features/search/services/search_services.dart';
import 'package:e_commerce_app/features/search/widget/searched_product.dart';
import 'package:e_commerce_app/models/product_.dart';
import 'package:flutter/material.dart';

class SearchCreen extends StatefulWidget {
  static const String routeName = '/search-screen';
  final String searchQuery;
  const SearchCreen({Key? key, required this.searchQuery}) : super(key: key);

  @override
  State<SearchCreen> createState() => _SearchCreenState();
}

class _SearchCreenState extends State<SearchCreen> {
  List<Product>? products;
  SearchService searchService = SearchService();
  @override
  void initState() {
    getSearchProduct();
    super.initState();
  }

  getSearchProduct() async {
    products = await searchService.getSearchProducts(
        context: context, searchQuery: widget.searchQuery);
    setState(() {});
  }

  void navigateToSearchScreen(String query) {
    Navigator.pushNamed(context, SearchCreen.routeName, arguments: query);
  }

  @override
  Widget build(BuildContext context) {
    return products == null
        ? const Loader()
        : Scaffold(
            appBar: PreferredSize(
                preferredSize: const Size.fromHeight(60),
                child: AppBar(
                  flexibleSpace: Container(
                    decoration: const BoxDecoration(
                        gradient: GlobalVariables.appBarGradient),
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          height: 42,
                          margin: const EdgeInsets.only(left: 15),
                          child: Material(
                            borderRadius: BorderRadius.circular(7),
                            elevation: 1,
                            child: TextFormField(
                              onFieldSubmitted: navigateToSearchScreen,
                              decoration: InputDecoration(
                                prefixIcon: InkWell(
                                  onTap: () {},
                                  child: const Padding(
                                    padding: EdgeInsets.only(
                                      left: 6,
                                    ),
                                    child: Icon(
                                      Icons.search,
                                      color: Colors.black,
                                      size: 23,
                                    ),
                                  ),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                contentPadding: const EdgeInsets.only(top: 10),
                                border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(7),
                                  ),
                                  borderSide: BorderSide.none,
                                ),
                                enabledBorder: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(7),
                                  ),
                                  borderSide: BorderSide(
                                    color: Colors.black38,
                                    width: 1,
                                  ),
                                ),
                                hintText: 'Search Product',
                                hintStyle: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        color: Colors.transparent,
                        height: 42,
                        margin: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        child: const Icon(
                          Icons.mic,
                          color: Colors.black,
                          size: 25,
                        ),
                      )
                    ],
                  ),
                )),
            body: products == null
                ? const Loader()
                : Column(
                    children: [
                      const AddressBox(),
                      const SizedBox(
                        height: 10,
                      ),
                      Expanded(
                          child: ListView.builder(
                              itemCount: products!.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, ProductDetailScreen.routeName,
                                        arguments: products![index]);
                                  },
                                  child: SearchedProduct(
                                      product: products![index]),
                                );
                              }))
                    ],
                  ),
          );
  }
}
