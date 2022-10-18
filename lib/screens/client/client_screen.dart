import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:novanas/screens/core/constants.dart';
import 'package:novanas/screens/core/dimensions.dart';
import '../../services/controllers/client_controller.dart';
import '../core/colors.dart';
import '../core/widget/tile_client_visit.dart';
import '../core/widget/title_page.dart';
import 'add_client.dart';

class ClientScreen extends StatefulWidget {
  ClientScreen({Key? key}) : super(key: key);

  @override
  State<ClientScreen> createState() => _ClientScreenState();
}

class _ClientScreenState extends State<ClientScreen> {
  ClientController clientController = Get.find();

  TextEditingController searchController = TextEditingController();

  var _foundClients = [].obs;
  var allClientList = [].obs;

  @override
  void initState() {
    allClientList.value = clientController.clientList.obs;
    _foundClients.value = allClientList;

    setState(() {});

    super.initState();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    var results = [].obs;
    if (enteredKeyword.isEmpty) {
      results = allClientList;
    } else {
      results.value = allClientList.where((clients) {
        return clients.customerName.toLowerCase().contains(enteredKeyword);
      }).toList();
    }
    _foundClients.value = results;
  }

  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Dimensions.width20, vertical: Dimensions.height10),
          child: ListView(
            children: [
              const TitlePage(
                title: 'Client',
              ),
              kHeight20,
              TextField(
                controller: searchController,
                onChanged: (value) {
                  _runFilter(value.toLowerCase());
                },
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.acccentColor),
                    borderRadius: BorderRadius.circular(Dimensions.radius10),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: Dimensions.height10),
                  hintStyle: TextStyle(color: AppColors.acccentColor),
                  hintText: 'Search',
                  prefixIcon: Icon(
                    CupertinoIcons.search,
                    color: AppColors.acccentColor,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.acccentColor),
                    borderRadius: BorderRadius.circular(Dimensions.radius10),
                  ),
                ),
              ),
              kHeight20,
              Container(
                decoration: BoxDecoration(
                    color: AppColors.acccentColor,
                    borderRadius:
                        BorderRadius.circular(Dimensions.radius10 / 2)),
                child: TextButton(
                  onPressed: () async {
                    Get.to(() => AddClient());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.add,
                            color: AppColors.backgroundColor,
                          ),
                          kWidth10,
                          Text(
                            "Add Client",
                            style: TextStyle(
                                color: AppColors.backgroundColor,
                                fontSize: Dimensions.fontSize16),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              kHeight20,
              Obx(
                () => ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return TileClientVisit(
                        name: _foundClients[index].customerName ??
                            'Not Available',
                        address:
                            _foundClients[index].location ?? 'Not Available',
                      );
                    },
                    separatorBuilder: (context, index) {
                      return kHeight10;
                    },
                    itemCount: _foundClients.length),
              )
            ],
          ),
        ),
      ),
    );
  }
}
