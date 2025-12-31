
import 'package:ecogo_booking/ui/screens/dashBoard/views/ticket_type_selector_view.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';
import '../../../styleguide/typography.dart';
import '../../bloc/auth_bloc.dart';
import '../../bloc/dashboard_bloc.dart';
import '../../widgets/custom_textfield.dart';
import '../../widgets/submit_button.dart';
import '../search/search_screen.dart';

class DashboardScreen extends StatefulWidget {
  static const String path = '/dashboard';
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final TextEditingController _fromController = TextEditingController();
  final TextEditingController _toController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final AuthBloc _authBloc = AuthBloc();
  final DashboardBloc _bloc = DashboardBloc();

  Widget _searchFieldsView(){
    return  Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: Colors.white,
      ),
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TripTypeSelector(),
          Gap(25),
          Row(
            children: [
              Expanded(
                child: CustomTextField.textFieldSingle(
                  _fromController,
                  hintText: "From",
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Swap the values safely
                  String temp = _fromController.text;
                  _fromController.text = _toController.text;
                  _toController.text = temp;

                  // Optional: Move cursors to the end
                  _fromController.selection = TextSelection.fromPosition(
                    TextPosition(offset: _fromController.text.length),
                  );
                  _toController.selection = TextSelection.fromPosition(
                    TextPosition(offset: _toController.text.length),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0), // Adjust spacing if needed
                  child: Assets.svgs.icSwap.svg(),
                ),
              ),
              Expanded(
                child: CustomTextField.textFieldSingle(
                  _toController,
                  hintText: "To",
                ),
              ),
            ],
          ),
          Gap(25),
          Text("Departure"),
          Gap(10),
          GestureDetector(
            onTap: (){
              _selectDate();
            },
            child: CustomTextField.textFieldSingle(
              _dateController,
              enable: false,
              hintText: "Date",
            ),
          ),
          Gap(25),
          Row(
            children: [
              Expanded(child: _greyContainer(title: "Passengers",content: "1")),
              Gap(10),
              Expanded(child: _greyContainer(title: "Class",content: "Economy")),
            ],
          ),
          Gap(25),
          SubmitButton(
            "Search Flights",
            onTap: (loader) async {
              loader();
              String randomTuiId = _bloc.generateRandomString(7);
              print("id===>${randomTuiId}");
            var response = await _bloc.postSearchFlight(tuiId: randomTuiId,date: _dateController.text);
            if(response == true){
              Future.delayed(Duration(seconds:15 ),(){
                loader();
                Navigator.pushNamed(context, SearchScreen.path,
                    arguments: randomTuiId);
              });
            }else{
              loader();
            }
            },
          ),
          Gap(25),
        ],
      ),
    );
  }
  Future<void> _selectDate() async {
    DateTime today = DateTime.now();

    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: today,
      firstDate: DateTime(today.year, today.month, today.day),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      _dateController.text =
      "${pickedDate.year}-${pickedDate.month.toString().length == 1? "0${pickedDate.month}" :pickedDate.month}-${pickedDate.day.toString().length == 1? "0${pickedDate.day}" :pickedDate.day}";
    }
  }

  Widget _topView(){
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 400,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(15)),
        color: Colors.blue,
      ),
      padding: EdgeInsets.only(left:24,top: MediaQuery.of(context).size.height/10 ,right: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.location_on_rounded),
              Gap(10),
              Text("Location"),
              Spacer(),
              GestureDetector(
                onTap: (){

                },
                child: Icon(
                  Icons.person,
                  color: Colors.black,
                  size: 15,
                ),
              ),
            ],
          ),
          Gap(10),
          Text("Kochi, India"),
        ],
      ),
    );
  }

  Widget _greyContainer({required String title, required String content}){
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: Color(0xfff4f5f9),
      ),
      padding: EdgeInsets.all( 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,style: placeholder,),
          Gap(10),
          Text(content,style:small),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.background,
    body: SingleChildScrollView(
      child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  _topView(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      children: [
                        Gap(MediaQuery.of(context).size.height/4),
                        _searchFieldsView(),
                        const Gap(50),

                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
    )
    );
  }
}
