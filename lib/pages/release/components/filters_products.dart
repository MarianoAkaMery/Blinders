import 'package:flutter/material.dart';

class FilterBar extends StatefulWidget {
  const FilterBar({super.key, required this.onFilterChanged});

  final Function(String search, String category) onFilterChanged;

  @override
  State<FilterBar> createState() => _FilterBarState();
}

class _FilterBarState extends State<FilterBar> {
  String _search = '';
  String _selectedCategory = 'All';

  final List<String> _categories = ['All', 'Toys', 'Clothing', 'Accessories'];

  void _updateFilters() {
    widget.onFilterChanged(_search, _selectedCategory);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          // Search Bar
          Expanded(
            flex: 3,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                prefixIcon: const Icon(Icons.search),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                filled: true,
                fillColor: Colors.grey[100],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (value) {
                setState(() => _search = value);
                _updateFilters();
              },
            ),
          ),
          const SizedBox(width: 12),
          // Category Dropdown
          SizedBox(
            width: 150,
            child: DropdownButtonFormField<String>(
              value: _selectedCategory,
              items: _categories.map((cat) {
                return DropdownMenuItem(value: cat, child: Text(cat));
              }).toList(),
              onChanged: (value) {
                if (value != null) {
                  setState(() => _selectedCategory = value);
                  _updateFilters();
                }
              },
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 0,
                ),
                filled: true,
                fillColor: Colors.grey[100],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
