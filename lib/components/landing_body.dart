import 'package:ecommerce/components/landing_card.dart';
import 'package:ecommerce/components/landing_categories.dart';
import 'package:ecommerce/constants.dart';
import 'package:ecommerce/models/categories.dart';
import 'package:ecommerce/models/product.dart';
import 'package:ecommerce/reducers/app_reducer.dart';
import 'package:ecommerce/screens/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const CategoriesTab(),
        StoreConnector<AppState, List<Categories>>(
            converter: (Store<AppState> store) => store.state.categories,
            builder: (context, List<Categories> catogories) {
              for (var category in catogories) {
                if (category.selected && category.value == 1) {
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: kDefaultPaddin),
                      child: GridView.builder(
                          itemCount: products.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: kDefaultPaddin,
                            crossAxisSpacing: kDefaultPaddin,
                            childAspectRatio: 0.75,
                          ),
                          itemBuilder: (context, index) => ItemCard(
                                product: products[index],
                                press: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailsScreen(
                                        product: products[index],
                                      ),
                                    )),
                              )),
                    ),
                  );
                } else if (category.selected && category.value == 2) {
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: kDefaultPaddin),
                      child: GridView.builder(
                          itemCount: products.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: kDefaultPaddin,
                            crossAxisSpacing: kDefaultPaddin,
                            childAspectRatio: 0.75,
                          ),
                          itemBuilder: (context, index) => ItemCard(
                                product: tablets[index],
                                press: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailsScreen(
                                        product: tablets[index],
                                      ),
                                    )),
                              )),
                    ),
                  );
                } else if (category.selected && category.value == 3) {
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: kDefaultPaddin),
                      child: GridView.builder(
                          itemCount: products.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: kDefaultPaddin,
                            crossAxisSpacing: kDefaultPaddin,
                            childAspectRatio: 0.75,
                          ),
                          itemBuilder: (context, index) => ItemCard(
                                product: computer[index],
                                press: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailsScreen(
                                        product: computer[index],
                                      ),
                                    )),
                              )),
                    ),
                  );
                } else if (category.selected && category.value == 4) {
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: kDefaultPaddin),
                      child: GridView.builder(
                          itemCount: products.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: kDefaultPaddin,
                            crossAxisSpacing: kDefaultPaddin,
                            childAspectRatio: 0.75,
                          ),
                          itemBuilder: (context, index) => ItemCard(
                                product: tablets[index],
                                press: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailsScreen(
                                        product: tablets[index],
                                      ),
                                    )),
                              )),
                    ),
                  );
                }
              }
              throw '';
            }),
      ],
    );
  }
}
