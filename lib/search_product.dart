import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/provider/search_product_provider.dart';

import 'function/get_grid_view_product.dart';
class SearchProduct extends StatefulWidget {
  final String searchingKey;
  const SearchProduct({
    required this.searchingKey, Key? key
}) : super(key: key);

  @override
  State<SearchProduct> createState() => _SearchProductState();
}
List<String> softList = <String>['Newest', 'A-Z', 'Low to high', 'High to low'];
List<String> brandList = <String>["All", "Apple", "Samsung", "Xiaomi","Oppo", "Vivo", "Sony","Lenovo"];
class _SearchProductState extends State<SearchProduct> {
  late TextEditingController _search;
  String dropdownSoftValue = softList.first;
  String dropdownBrandValue = brandList.first;

  @override
  void initState() {
    super.initState();
    _search = TextEditingController(text: widget.searchingKey);
  }
  @override
  Widget build(BuildContext context) {
    var productProvider = Provider.of<SearchProductProvider>(context);
    if(dropdownBrandValue == "All"){
      productProvider.getList(_search.text,dropdownSoftValue);
    }
    else{
      productProvider.getListBrand(dropdownBrandValue,_search.text,dropdownSoftValue);
    }
    List<Container> listSearchProduct = GetGridViewProduct.getGrid(context, productProvider.list);
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Theme.of(context).backgroundColor,
          child: Column(
            children: [
              Container(
                height: 50,
                margin: const EdgeInsets.only(left: 15,right: 15,bottom: 5,top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 310,
                      height: 40,
                      padding: const EdgeInsets.only(left: 10),

                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: const BorderRadius.all(Radius.circular(10))
                      ),
                      child: TextFormField(
                        initialValue: _search.text,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Typing at here",
                          icon: Image.asset("assets/images/search_icon.png"),
                        ),
                        autofocus: false,
                        onFieldSubmitted: (value){
                          setState(() {
                            _search.text = value;
                          });
                        },

                      ),
                    ),
                    InkWell(
                      onTap: (){},
                      child: const Icon(
                        Icons.shopping_bag_outlined,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    const Text(
                      "Soft by:   "
                    ),
                    DropdownButton(
                      value: dropdownSoftValue,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      elevation: 5,
                      onChanged: (String? value) {
                        // This is called when the user selects an item.
                        setState(() {
                          dropdownSoftValue = value!;
                        });
                      },
                      items: softList.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    const Text(
                        "       Brand:   "
                    ),
                    DropdownButton(
                      value: dropdownBrandValue,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      elevation: 5,
                      onChanged: (String? value) {
                        // This is called when the user selects an item.
                        setState(() {
                          dropdownBrandValue = value!;
                        });
                      },
                      items: brandList.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ...listSearchProduct
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}