import 'package:flutter/material.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AnimationController? loadingController;
  final Interval headerAniInterval;
  final MultiSelectController _controller = MultiSelectController();
  final Color? cyanWithOpacity = Colors.cyan.withOpacity(0.5);

  CustomAppBar({
    Key? key,
    required this.loadingController,
    required this.headerAniInterval,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(85);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final logo = Padding(
      padding: const EdgeInsets.only(left: 20, bottom: 5),
      child: Transform.scale(
        scale: 1.2, // Double the size of the logo
        child: Image.asset('assets/images/cg_logo.png'),
      ),
    );

    return AppBar(
      leading: logo,
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Container(
            width: 180,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.transparent, // Background color of the rectangle
              borderRadius: BorderRadius.circular(12.0), // Circular corners
              border: Border.all(
                  color: Color.fromARGB(255, 193, 189, 189),
                  width: 1.2), // Border color
            ),
            child: MultiSelectDropDown(
              animateSuffixIcon: true,
              fieldBackgroundColor: Colors.transparent,
              suffixIcon: Icon(Icons.category_outlined),
              controller: _controller,
              onOptionSelected: (List<ValueItem> selectedOptions) {
                // Handle selection changes here
              },
              options: const <ValueItem>[
                ValueItem(label: 'Accessories', value: '1'),
                ValueItem(label: 'Mobile', value: '2'),
                ValueItem(label: 'Motorbikes', value: '3'),
                ValueItem(label: 'Cars', value: '4'),
                ValueItem(label: 'Property', value: '5'),
              ],
              selectionType: SelectionType.multi,
              chipConfig:  ChipConfig(wrapType: WrapType.wrap,backgroundColor: Colors.cyan.withOpacity(0.3),radius: 30),
              dropdownHeight: 180,
              optionTextStyle: const TextStyle(fontSize: 16),
              selectedOptionIcon: const Icon(Icons.check_circle),
            ),
          ),
        ),
        SizedBox(width:30 ,),
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.transparent, // Background color of the rectangle
              borderRadius: BorderRadius.circular(12.0), // Circular corners
              border: Border.all(
                  color: Color.fromARGB(255, 193, 189, 189),
                  width: 1.2), // Border color
            ),
            child: IconButton(
              icon: Icon(Icons.search, color: Colors.black), // Icon color
              tooltip: 'Search',
              onPressed: () {},
              iconSize: 25,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0.0),
          child: Container(
            width: 42,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.transparent, // Background color of the rectangle
              borderRadius: BorderRadius.circular(12.0), // Circular corners
              border: Border.all(
                  color: Color.fromARGB(255, 193, 189, 189),
                  width: 1.2), // Border color
            ),
            child: IconButton(
              icon: Icon(Icons.notifications_active_outlined,
                  color: Colors.black), // Icon color
              tooltip: 'Notifications',
              onPressed: () {},
              iconSize: 25,
            ),
          ),
        ),
        SizedBox(width: 20),
      ],
      backgroundColor: theme.primaryColor.withOpacity(.1),
      elevation: 0,
      toolbarHeight: 85,
    );
  }
}
