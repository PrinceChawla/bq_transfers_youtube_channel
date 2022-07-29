# The name of this view in Looker is "Website Performance"
view: website_performance {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `mlconsole-poc.youtube_channel_reports.website_performance`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Avg Time on Page" in Explore.

  measure: avg_time_on_page {
    type: sum
    sql: ${TABLE}.avg_time_on_page ;;

  }
  # measure: avg_time_on_page_last_month {
  #   type: sum
  #   sql: ${TABLE}.avg_time_on_page;;
  #   # value_format: "[>=1000000]0.00,,\"M\";[>=1000]0.00,\"K\";0.00"
  #   filters: [timestamp_date: "1 month ago"]
  # }

  measure: avg_t {
    sql: ${avg_time_on_page} ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  # measure: total_avg_time_on_page {
  #   type: sum
  #   sql: ${avg_time_on_page} ;;
  # }

  # measure: average_avg_time_on_page {
  #   type: average
  #   sql: ${avg_time_on_page} ;;
  # }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  measure: engagements {
    type: sum
    sql: ${TABLE}.engagements ;;
    value_format:"0.00,\"K\""
  }


  measure: engagements_last_month {
    type: sum
    sql: ${TABLE}.engagements;;
     value_format: "[>=1000000]0.00,,\"M\";[>=1000]0.00,\"K\";0.00"
    filters: [timestamp_date: "2 month ago"]
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: insert_ts {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.insert_ts ;;
  }

  dimension: page_scroll_by {
    type: string
    sql: substring(${TABLE}.page_scroll_by,16,21) ;;
  }

  dimension: page_title {
    type: string
    sql: ${TABLE}.page_title ;;
  }

  dimension: device {
    type: string
    sql: ${TABLE}.device ;;
  }

  measure: form_completion {
    type: sum
    sql: ${TABLE}.form_completion ;;
  }

  dimension: age_group {
    type: string
    sql: ${TABLE}.age_group ;;

  }

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;

  }

  dimension: download_detail {
    type: string
    sql: ${TABLE}.download_detail ;;

  }



  measure: page_views {
    type: sum
    sql: ${TABLE}.page_views ;;
    value_format:"0.00,\"K\""
  }

  measure: page_views_last_month {
    type: sum
    sql: ${TABLE}.page_views ;;
    value_format: "[>=1000000]0.00,,\"M\";[>=1000]0.00,\"K\";0.00"
    filters: [timestamp_date: "2 month ago"]
  }

  measure: session_id {
    type: count
    sql: ${TABLE}.session_id ;;
  }

  measure:sessions_per_visitors {
    type: sum
    sql: ${TABLE}.sessions_per_visitors ;;
  }

  measure:bounce_rate {
    type: sum
    sql: ${TABLE}.bounce_rate ;;
    value_format: "[>=1000000]0.00,,\"M\";[>=1000]0.00,\"K\";0.00"
  }

  measure:bounce_rate_last_month {
    type: sum
    sql: ${TABLE}.bounce_rate ;;
    value_format: "[>=1000000]0.00,,\"M\";[>=1000]0.00,\"K\";0.00"
    filters: [timestamp_date: "15 days ago"]
  }

  # measure:bounce_rate_2_month_ago {
  #   type: sum
  #   sql: ${TABLE}.bounce_rate ;;
  #   value_format: "[>=1000000]0.00,,\"M\";[>=1000]0.00,\"K\";0.00"
  #   filters: [timestamp_date: "25 days ago"]
  # }
  measure: sessions_last_month {
    type: count
    sql: ${TABLE}.session_id ;;
    # value_format: "[>=1000000]0.00,,\"M\";[>=1000]0.00,\"K\";0.00"
    filters: [timestamp_date: "2 month ago"]
  }

  dimension: site_interaction_by {
    type: string
    sql: ${TABLE}.site_interaction_by ;;
  }

  # dimension: source_id {
  #   type: string
  #   sql: ${TABLE}.source_id ;;
  # }

  dimension: social_network {
    type: string
    sql: ${TABLE}.social_network ;;
  }


  dimension: os {
    type: string
    sql: ${TABLE}.os ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
    # drill_fields: [age_group,unique_users]
    # link: {
    #   label: "By age Group"
    #   url: "
    #   {% assign vis_config = '{
    # \"value_labels\":\"labels\",\"label_type\":\"per\",\"inner_radius\":45,\"custom_color_enabled\":true,\"show_single_value_title\":true,\"show_comparison\":true,\"comparison_type\":\"progress_percentage\",\"comparison_reverse_colors\":false,\"show_comparison_label\":true,\"enable_conditional_formatting\":true,\"conditional_formatting_include_totals\":false,\"conditional_formatting_include_nulls\":false,\"single_value_title\":\"Sessions\",\"comparison_label\":\"Sessions Last Month\",\"conditional_formatting\":[{\"type\":\"greater than\",\"value\":0,\"background_color\":\"#2AAA8A\",\"font_color\":\"#ffffff\",\"color_application\":{\"collection_id\":\"6c27c30e-5523-4080-82ae-272146e699d0\",\"palette_id\":\"25b877bc-c7a8-4ed0-a0ef-5ba64ca3658d\"},\"bold\":false,\"italic\":false,\"strikethrough\":false,\"fields\":null}],\"type\":\"looker_pie\",\"defaults_version\":1,\"series_types\":{}
    #   }' %}
    #   {{ link }}&vis_config={{ vis_config | encode_uri }}&toggle=dat,pik,vis&limit=5000"
    # }

  }
dimension: landing_page {
  type: string
  sql: ${TABLE}.landing_page ;;
}
dimension: medium {
  type: string
  sql: ${TABLE}.medium ;;
}

measure: active_session {
  type: sum
  sql: ${TABLE}.active_session ;;
}

measure: goal_1_initiate_rx_define {
  type: sum
  sql: ${TABLE}.goal_1_initiate_rx_define ;;
}

  dimension_group: timestamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.timestamp ;;
  }

  dimension_group: ts {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.ts ;;
  }

  measure: unique_users {
    type: count
    sql: select 40;;
    drill_fields: [site_interaction_by,count]
    link: {
      label: "Site Interaction BY Unique User"
      url: "
      {% assign vis_config = '{
      \"x_axis_gridlines\":false,\"y_axis_gridlines\":false,\"show_view_names\":false,\"show_y_axis_labels\":true,\"show_y_axis_ticks\":true,\"y_axis_tick_density\":\"default\",\"y_axis_tick_density_custom\":5,\"show_x_axis_label\":true,\"show_x_axis_ticks\":true,\"y_axis_scale_mode\":\"linear\",\"x_axis_reversed\":false,\"y_axis_reversed\":false,\"plot_size_by_field\":false,\"trellis\":\"\",\"stacking\":\"\",\"limit_displayed_rows\":false,\"legend_position\":\"center\",\"point_style\":\"none\",\"show_value_labels\":false,\"label_density\":25,\"x_axis_scale\":\"auto\",\"y_axis_combined\":true,\"ordering\":\"none\",\"show_null_labels\":false,\"show_totals_labels\":false,\"show_silhouette\":false,\"totals_color\":\"#808080\",\"series_types\":{},\"series_colors\":{\"website_performance.count\":\"#2AAA8A\"},\"column_spacing_ratio\":0.2,\"type\":\"looker_bar\",\"defaults_version\":1,\"show_null_points\":true,\"interpolation\":\"linear\"
      }' %}
      {{ link }}&vis_config={{ vis_config | encode_uri }}&toggle=dat,pik,vis&limit=5000"
  }
    # link: {
    #   label: "By age Group"
    #   url: "
    #   {% assign vis_config = '{
    #   \"value_labels\":\"labels\",\"label_type\":\"per\",\"inner_radius\":45,\"custom_color_enabled\":true,\"show_single_value_title\":true,\"show_comparison\":true,\"comparison_type\":\"progress_percentage\",\"comparison_reverse_colors\":false,\"show_comparison_label\":true,\"enable_conditional_formatting\":true,\"conditional_formatting_include_totals\":false,\"conditional_formatting_include_nulls\":false,\"single_value_title\":\"Sessions\",\"comparison_label\":\"Sessions Last Month\",\"conditional_formatting\":[{\"type\":\"greater than\",\"value\":0,\"background_color\":\"#2AAA8A\",\"font_color\":\"#ffffff\",\"color_application\":{\"collection_id\":\"6c27c30e-5523-4080-82ae-272146e699d0\",\"palette_id\":\"25b877bc-c7a8-4ed0-a0ef-5ba64ca3658d\"},\"bold\":false,\"italic\":false,\"strikethrough\":false,\"fields\":null}],\"type\":\"looker_pie\",\"defaults_version\":1,\"series_types\":{}
    #   }' %}
    #   {{ link }}&fields=website_performance.age_group,website_performance.unique_users&vis_config={{ vis_config | encode_uri }}&toggle=dat,pik,vis&limit=5000"
    # }

  }

  measure: unique_user_last_month {
    type: count
    sql: ${TABLE}.unique_users ;;
    # value_format: "[>=1000000]0.00,,\"M\";[>=1000]0.00,\"K\";0.00"
    filters: [timestamp_date: "1 month ago"]
  }

  dimension: website {
    type: string
    sql: ${TABLE}.website ;;
  }

  measure: count {
    type: count
    drill_fields: [age_group,unique_users]
    link: {
      label: "By age Group"
      url: "
      {% assign vis_config = '{
      \"value_labels\":\"labels\",\"label_type\":\"per\",\"inner_radius\":45,\"custom_color_enabled\":true,\"show_single_value_title\":true,\"show_comparison\":true,\"comparison_type\":\"progress_percentage\",\"comparison_reverse_colors\":false,\"show_comparison_label\":true,\"enable_conditional_formatting\":true,\"conditional_formatting_include_totals\":false,\"conditional_formatting_include_nulls\":false,\"single_value_title\":\"Sessions\",\"comparison_label\":\"Sessions Last Month\",\"conditional_formatting\":[{\"type\":\"greater than\",\"value\":0,\"background_color\":\"#2AAA8A\",\"font_color\":\"#ffffff\",\"color_application\":{\"collection_id\":\"6c27c30e-5523-4080-82ae-272146e699d0\",\"palette_id\":\"25b877bc-c7a8-4ed0-a0ef-5ba64ca3658d\"},\"bold\":false,\"italic\":false,\"strikethrough\":false,\"fields\":null}],\"type\":\"looker_pie\",\"defaults_version\":1,\"series_types\":{}
      }' %}
      {{ link }}&fields=website_performance.age_group,website_performance.unique_users&vis_config={{ vis_config | encode_uri }}&toggle=dat,pik,vis&limit=5000"
    }
  }
  measure: test_count {
    sql: ${count} ;;
    value_format: "#,##0"
    html:{% if  avg_time_on_page._value > 45000 %}

          <p style="color: #2AAA8A">▲  {{avg_time_on_page._rendered_value}}</p>
          {% elsif avg_time_on_page._value > 10000 OR avg_time_on_page._value < 46000 %}
          <p style="color: #FF0000">▼   {{avg_time_on_page._rendered_value}}</p>
          {% else %}
          <p style="color: #000000">{{avg_time_on_page._rendered_value}}</p>
          {% endif %};;
  }
  measure:dash_nav1 {
    view_label: "Session"
    group_label: "Dashboard Navigation"
    label: "Navigation Bar"
    type: string
    sql: "";;
    html:
    <nav style="font-size: 18px; color: #4285F4">
<div style>
    <a style="padding: 5px 15px; border-top: solid 1px #AEC8C1; border-left: solid 1px #AEC8C1; border-right: solid 1px #AEC8C1; border-bottom: solid 1px #AEC8C1; border-radius: 5px 5px 5px 5px;  float: center; line-height: 40px; font-weight: bold; background-color: #2AAA8A;color: white"  href="https://mediaagility.looker.com/dashboards/341">Overview</a>

      <a  style="color: #ffffff; padding: 1px 2px; border-top: solid 1px #ffffff border-left: solid 1px #ffffff; border-right: solid 1px #ffffff; border-radius: 5px 5px 0 0; float: center; line-height: 1.1px; font-weight: bold;" href="#home"> </a>

      <a style="padding: 5px 15px; border-top: solid 1px #AEC8C1; border-left: solid 1px #AEC8C1; border-right: solid 1px #AEC8C1; border-bottom: solid 1px #AEC8C1; border-radius: 5px 5px 5px 5px;  float: center; line-height: 40px; font-weight: bold; background-color: #ffffff;color: #2AAA8A"  href="https://mediaagility.looker.com/dashboards/343?Device={{ _filters['operating_system_ios_android'] | url_encode }}">Website Performance</a>
      <a  style="color: #ffffff; padding: 1px 2px; border-top: solid 1px #ffffff border-left: solid 1px #ffffff; border-right: solid 1px #ffffff; border-radius: 5px 5px 0 0; float: center; line-height: 1.1px; font-weight: bold;" href="#home"> </a>

      <a style="padding: 5px 15px; border-top: solid 1px #AEC8C1; border-left: solid 1px #AEC8C1; border-right: solid 1px #AEC8C1; border-bottom: solid 1px #AEC8C1; border-radius: 5px 5px 5px 5px; float: center; line-height: 40px; font-weight: bold; background-color: #ffffff;color: #2AAA8A" href="https://mediaagility.looker.com/dashboards/342?Device">Audience</a>
      <a  style="color: #ffffff; padding: 1px 2px; border-top: solid 1px #ffffff border-left: solid 1px #ffffff; border-right: solid 1px #ffffff; border-radius: 5px 5px 0 0; float: left; line-height: 1.1px; font-weight: bold;" href="#home">  </a>



      <a style="padding: 5px 15px; border-top: solid 1px #AEC8C1; border-left: solid 1px #AEC8C1; border-right: solid 1px #AEC8C1; border-bottom: solid 1px #AEC8C1; border-radius: 5px 5px 5px 5px; float: center; line-height: 40px; font-weight: bold; background-color: #ffffff;color: #2AAA8A" href="https://mediaagility.looker.com/dashboards/319" >Campaign</a>







      </div>;;
  }
  measure:dash_nav2 {
    view_label: "Session"
    group_label: "Dashboard Navigation"
    label: "Navigation Bar"
    type: string
    sql: "";;
    html:
    <nav style="font-size: 18px; color: #4285F4">
<div style>
    <a style="padding: 5px 15px; border-top: solid 1px #AEC8C1; border-left: solid 1px #AEC8C1; border-right: solid 1px #AEC8C1; border-bottom: solid 1px #AEC8C1; border-radius: 5px 5px 5px 5px;  float: center; line-height: 40px; font-weight: bold; background-color: #ffffff;color: #2AAA8A"  href="https://mediaagility.looker.com/dashboards/341">Overview</a>

      <a  style="color: #ffffff; padding: 1px 2px; border-top: solid 1px #ffffff border-left: solid 1px #ffffff; border-right: solid 1px #ffffff; border-radius: 5px 5px 0 0; float: center; line-height: 1.1px; font-weight: bold;" href="#home"> </a>

      <a style="padding: 5px 15px; border-top: solid 1px #AEC8C1; border-left: solid 1px #AEC8C1; border-right: solid 1px #AEC8C1; border-bottom: solid 1px #AEC8C1; border-radius: 5px 5px 5px 5px;  float: center; line-height: 40px; font-weight: bold; background-color: #2AAA8A;color: white"  href="https://mediaagility.looker.com/dashboards/343?Device={{ _filters['operating_system_ios_android'] | url_encode }}">Website Performance</a>
      <a  style="color: #ffffff; padding: 1px 2px; border-top: solid 1px #ffffff border-left: solid 1px #ffffff; border-right: solid 1px #ffffff; border-radius: 5px 5px 0 0; float: center; line-height: 1.1px; font-weight: bold;" href="#home"> </a>

      <a style="padding: 5px 15px; border-top: solid 1px #AEC8C1; border-left: solid 1px #AEC8C1; border-right: solid 1px #AEC8C1; border-bottom: solid 1px #AEC8C1; border-radius: 5px 5px 5px 5px; float: center; line-height: 40px; font-weight: bold; background-color: #ffffff;color: #2AAA8A" href="https://mediaagility.looker.com/dashboards/342?Device">Audience</a>
      <a  style="color: #ffffff; padding: 1px 2px; border-top: solid 1px #ffffff border-left: solid 1px #ffffff; border-right: solid 1px #ffffff; border-radius: 5px 5px 0 0; float: left; line-height: 1.1px; font-weight: bold;" href="#home">  </a>



      <a style="padding: 5px 15px; border-top: solid 1px #AEC8C1; border-left: solid 1px #AEC8C1; border-right: solid 1px #AEC8C1; border-bottom: solid 1px #AEC8C1; border-radius: 5px 5px 5px 5px; float: center; line-height: 40px; font-weight: bold; background-color: #ffffff;color: #2AAA8A" href="https://mediaagility.looker.com/dashboards/319" >Campaign</a>







      </div>;;
  }
  measure:dash_nav3 {
    view_label: "Session"
    group_label: "Dashboard Navigation"
    label: "Navigation Bar Media performance"
    type: string
    sql: "";;
    html:
    <nav style="font-size: 18px; color: #4285F4">
<div style>
    <a style="padding: 5px 15px; border-top: solid 1px #AEC8C1; border-left: solid 1px #AEC8C1; border-right: solid 1px #AEC8C1; border-bottom: solid 1px #AEC8C1; border-radius: 5px 5px 5px 5px;  float: center; line-height: 40px; font-weight: bold; background-color: #ffffff;color: #2AAA8A"  href="https://mediaagility.looker.com/dashboards/341">Overview</a>

      <a  style="color: #ffffff; padding: 1px 2px; border-top: solid 1px #ffffff border-left: solid 1px #ffffff; border-right: solid 1px #ffffff; border-radius: 5px 5px 0 0; float: center; line-height: 1.1px; font-weight: bold;" href="#home"> </a>

      <a style="padding: 5px 15px; border-top: solid 1px #AEC8C1; border-left: solid 1px #AEC8C1; border-right: solid 1px #AEC8C1; border-bottom: solid 1px #AEC8C1; border-radius: 5px 5px 5px 5px;  float: center; line-height: 40px; font-weight: bold; background-color: #2AAA8A;color: white"  href="https://mediaagility.looker.com/dashboards/343">Website Performance</a>
      <a  style="color: #ffffff; padding: 1px 2px; border-top: solid 1px #ffffff border-left: solid 1px #ffffff; border-right: solid 1px #ffffff; border-radius: 5px 5px 0 0; float: center; line-height: 1.1px; font-weight: bold;" href="#home"> </a>


      <a style="padding: 5px 15px; border-top: solid 1px #AEC8C1; border-left: solid 1px #AEC8C1; border-right: solid 1px #AEC8C1; border-bottom: solid 1px #AEC8C1; border-radius: 5px 5px 5px 5px;  float: center; line-height: 40px; font-weight: bold; background-color: #ffffff;color: #2AAA8A"  href="https://mediaagility.looker.com/dashboards/367">Media Performance</a>
      <a  style="color: #ffffff; padding: 1px 2px; border-top: solid 1px #ffffff border-left: solid 1px #ffffff; border-right: solid 1px #ffffff; border-radius: 5px 5px 0 0; float: center; line-height: 1.1px; font-weight: bold;" href="#home"> </a>


                   <a style="padding: 5px 15px; border-top: solid 1px #AEC8C1; border-left: solid 1px #AEC8C1; border-right: solid 1px #AEC8C1; border-bottom: solid 1px #AEC8C1; border-radius: 5px 5px 5px 5px;  float: center; line-height: 40px; font-weight: bold; background-color: #ffffff;color:  #2AAA8A"  href="https://mediaagility.looker.com/dashboards/383">Campaign</a>
                    <a style="padding: 5px 15px; border-top: solid 1px #AEC8C1; border-left: solid 1px #AEC8C1; border-right: solid 1px #AEC8C1; border-bottom: solid 1px #AEC8C1; border-radius: 5px 5px 5px 5px;  float: center; line-height: 40px; font-weight: bold; background-color: #ffffff;color:  #2AAA8A"  href="https://mediaagility.looker.com/dashboards/405">User Journey</a>


      </div>;;
  }

}
