import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../blocs/breed/breed_bloc.dart';
import '../../../blocs/breed/breed_event.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({super.key, required this.appBarHeight, required this.bottomNavBarHeight});
  final double appBarHeight;
  final double bottomNavBarHeight;

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  final TextEditingController _searchController = TextEditingController();
  double _inputHeight = 64.0;
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final double availableHeight = MediaQuery.of(context).size.height - widget.appBarHeight - kToolbarHeight - widget.bottomNavBarHeight;
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Padding(
        padding: _isExpanded ? EdgeInsets.zero : const EdgeInsets.only(bottom: 16),
        child: GestureDetector(
          onVerticalDragUpdate: (details) {
            if (_isExpanded && details.delta.dy < -10 && _inputHeight < availableHeight) {
              setState(() {
                _inputHeight = availableHeight;
                _isExpanded = true;
              });
            }

            if (_isExpanded && details.delta.dy > 10 && _inputHeight == availableHeight) {
              setState(() {
                _inputHeight = 110;
              });
            }
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: _inputHeight,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: _isExpanded
                  ? const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    )
                  : BorderRadius.circular(8.0),
              border: Border.all(color: AppColors.dividerColor),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (_isExpanded)
                  Container(
                    width: 32,
                    height: 3,
                    margin: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                    decoration: BoxDecoration(
                      color: AppColors.dividerColor,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    maxLines: null,
                    onTap: () {
                      setState(() {
                        _isExpanded = true;
                        _inputHeight = 110;
                      });
                    },
                    onSubmitted: (value) {
                      setState(() {
                        _isExpanded = false;
                        _inputHeight = 64.0;
                      });
                      context.read<BreedBloc>().add(FilterBreeds(value));

                      FocusScope.of(context).unfocus();
                    },
                    decoration: InputDecoration(
                      hintText: "Search",
                      hintStyle: TextStyle(color: AppColors.textColor.withOpacity(0.6), fontSize: 16),
                      border: InputBorder.none,
                    ),
                    keyboardType: TextInputType.text,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
