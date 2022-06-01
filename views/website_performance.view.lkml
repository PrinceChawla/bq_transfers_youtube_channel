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
    value_format:"0.00,\" K\""
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

  measure: page_views {
    type: sum
    sql: ${TABLE}.page_views ;;
    value_format:"0.00,\" K\""
  }

  measure: session_id {
    type: count
    sql: ${TABLE}.session_id ;;
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
  }

  dimension: website {
    type: string
    sql: ${TABLE}.website ;;
  }

  measure: count {
    type: count
    drill_fields: []
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
}
