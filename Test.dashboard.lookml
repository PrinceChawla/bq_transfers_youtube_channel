- dashboard: looker_actions
  title: Looker Actions
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: NBGQBnaVdFKYDKp7NKCpJJ
  elements:
  - title: Looker Actions
    name: Looker Actions
    model: looker_db_dp
    explore: employee
    type: looker_grid
    fields: [employee.id, employee.age, employee.name, employee.country, employee.Editdetails]
    sorts: [employee.age]
    limit: 500
    query_timezone: America/New_York
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: true
    series_column_widths: {}
    defaults_version: 1
    series_types: {}
    listen: {}
    row: 2
    col: 0
    width: 23
    height: 3
  - title: New Tile
    name: New Tile
    model: looker_db_dp
    explore: employee
    type: single_value
    fields: [employee.dash_nav3]
    limit: 500
    query_timezone: UTC
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    defaults_version: 1
    listen: {}
    row: 0
    col: 5
    width: 15
    height: 2
