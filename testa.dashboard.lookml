- dashboard: conditional_drill
  title: Conditional Drill
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: w8VJSP8vrNR0xUJSrqaxCW
  elements:
  - title: Conditional Drill
    name: Conditional Drill
    model: looker_db_dp
    explore: mobile_tablet
    type: looker_grid
    fields: [mobile_tablet.country, mobile_tablet.count, mobile_tablet.country1]
    sorts: [mobile_tablet.count desc]
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
    truncate_header: false
    series_cell_visualizations:
      mobile_tablet.count:
        is_active: false
    series_text_format:
      mobile_tablet.count:
        align: left
      mobile_tablet.country1:
        align: left
    defaults_version: 1
    listen: {}
    row: 2
    col: 0
    width: 24
    height: 4
  - title: New Tile
    name: New Tile
    model: looker_db_dp
    explore: mobile_tablet
    type: single_value
    fields: [mobile_tablet.dash_nav3]
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
    width: 13
    height: 2
