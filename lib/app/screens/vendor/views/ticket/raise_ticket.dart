import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../../common/color_pallete.dart';
import '../../../../components/ui/form_fields.dart';
import '../../../../components/ui/my_list_view.dart';
import '../../../../components/ui/rounded_container.dart';
import '../../../../components/ui/text_view.dart';
import '../../controllers/vendor_controller.dart';

// ignore: must_be_immutable
class RaiseTicketScreen extends GetView<VendorController> {
  const RaiseTicketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Scaffold(
          backgroundColor: ColorPallete.theme,
          appBar: AppBar(
            iconTheme: const IconThemeData(color: ColorPallete.theme),
            backgroundColor: ColorPallete.primary,
            title: const TextView(
              text: "Raise A Ticket",
              color: ColorPallete.theme,
              fontSize: 18,
              weight: FontWeight.bold,
            ),
          ),
          body: Column(
            children: [
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () {
                    // controller.fetchEnquires();
                    return Future.value();
                  },
                  child: MyListView(
                    scroll: true,
                    children: [
                      Obx(
                        () => controller.isLoading.value
                            ? Shimmer.fromColors(
                                baseColor: Colors.grey.withOpacity(0.5),
                                highlightColor: Colors.white,
                                child: Padding(
                                  padding: EdgeInsets.all(10 * fem),
                                  child: MyListView(
                                    children: [1, 2, 3].map((e) {
                                      return Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 5.0 * fem),
                                        child: InkWell(
                                          onTap: () {},
                                          child: RoundedContainer(
                                            radius: 10,
                                            height: 125,
                                            color: ColorPallete.grey
                                                .withOpacity(0.5),
                                            child: Padding(
                                              padding:
                                                  EdgeInsets.all(10.0 * fem),
                                            ),
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              )
                            : controller.tickets.isEmpty
                                ? SizedBox(
                                    height: 200 * fem,
                                    child: const Center(
                                      child: TextView(
                                        text: "No Tickets!",
                                        fontSize: 24,
                                        weight: FontWeight.bold,
                                        color: ColorPallete.grey,
                                      ),
                                    ),
                                  )
                                : Padding(
                                    padding: EdgeInsets.all(10 * fem),
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: controller.tickets.length,
                                      itemBuilder: (context, index) {
                                        var ticket =
                                            controller.tickets.elementAt(index);
                                        return RaisedTicketWidget(
                                          ticket: ticket,
                                          onTicketSubmit: () {
                                            ticket["status"] = "IN PROGRESS";
                                            controller.submitTicket(ticket);
                                          },
                                        );
                                      },
                                    )),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          floatingActionButton: Obx(
            () => controller.isCreatingTicket.value
                ? const SizedBox.shrink()
                : InkWell(
                    onTap: () {
                      controller.addTicket();
                    },
                    child: CircleAvatar(
                      radius: 20 * fem,
                      backgroundColor: ColorPallete.primary,
                      child: Icon(
                        Icons.add,
                        color: ColorPallete.theme,
                        size: 30 * fem,
                      ),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}

class RaisedTicketWidget extends StatelessWidget {
  final Map<String, String> ticket;
  final Function() onTicketSubmit;
  const RaisedTicketWidget(
      {super.key, required this.ticket, required this.onTicketSubmit});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    bool isEditable = ticket["status"] == null;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.0 * fem),
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              spreadRadius: 2.5,
              blurRadius: 10,
              color: ColorPallete.grey.withOpacity(0.5),
              offset: const Offset(5, 5))
        ]),
        child: RoundedContainer(
          radius: 10,
          color: ColorPallete.theme,
          child: Padding(
            padding: EdgeInsets.all(5.0 * fem),
            child: Center(
              child: isEditable
                  ? MyListView(
                      children: [
                        MyFormField(
                          fieldName: "Topic",
                          initialValue: ticket["topic"],
                          type: InputType.TEXT,
                          keyboard: TextInputType.text,
                          onChanged: (value) {
                            ticket["topic"] = value;
                          },
                        ),
                        MyFormField(
                          fieldName: "Query",
                          initialValue: ticket["query"],
                          maxLines: 4,
                          type: InputType.TEXT,
                          keyboard: TextInputType.text,
                          onChanged: (value) {
                            ticket["query"] = value;
                          },
                        ),
                        MyFormField(
                          fieldName: "Priority",
                          initialValue: ticket["priority"],
                          type: InputType.DROP_DOWN,
                          keyboard: TextInputType.text,
                          dropDownOptions: const ["Low", "Medium", "High"],
                          onChanged: (value) {
                            ticket["priority"] = value;
                          },
                        ),
                        Padding(
                          padding: EdgeInsets.all(5.0 * fem),
                          child: InkWell(
                            onTap: onTicketSubmit,
                            child: RoundedContainer(
                              radius: 10,
                              color: ColorPallete.primary,
                              child: Padding(
                                padding: EdgeInsets.all(15.0 * fem),
                                child: const Center(
                                  child: TextView(
                                    text: "Submit",
                                    color: ColorPallete.theme,
                                    weight: FontWeight.w700,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : Padding(
                      padding: EdgeInsets.all(5.0 * fem),
                      child: MyListView(
                        children: [
                          EntryWidget(
                            title: "Topic",
                            value: ticket["topic"],
                          ),
                          EntryWidget(
                            title: "Query",
                            value: ticket["query"],
                          ),
                          EntryWidget(
                            title: "Priority",
                            value: ticket["priority"],
                          ),
                          Padding(
                            padding: EdgeInsets.all(10.0 * fem),
                            child: Row(
                              children: [
                                const TextView(
                                  text: "Status : ",
                                  color: ColorPallete.secondary,
                                  fontSize: 14,
                                ),
                                TextView(
                                  text: ticket["status"].toString(),
                                  color: ColorPallete.secondary,
                                  fontSize: 14,
                                  weight: FontWeight.w700,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}

class EntryWidget extends StatelessWidget {
  final String title;
  final String? value;
  const EntryWidget({super.key, required this.title, this.value});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10 * fem, vertical: 5 * fem),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RoundedContainer(
            radius: 0,
            child: TextView(
              text: title,
              color: ColorPallete.secondary,
              fontSize: 14,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.0 * fem),
            child: const TextView(
              text: ":",
              fontSize: 14,
              weight: FontWeight.w600,
            ),
          ),
          RoundedContainer(
            radius: 0,
            child: TextView(
              text: value ?? "",
              color: ColorPallete.secondary,
              fontSize: 14,
              weight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}
