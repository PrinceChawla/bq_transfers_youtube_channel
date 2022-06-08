# The name of this view in Looker is "Campaign"
view: campaign {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `mlconsole-poc.youtube_channel_reports.campaign`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Device" in Explore.

  dimension: device {
    type: string
    sql: ${TABLE}.device ;;
  }

  dimension: os {
    type: string
    sql: ${TABLE}.os ;;
  }

  dimension: pages {
    type: number
    sql: ${TABLE}.pages ;;
  }

  dimension: pageviews {
    type: number
    sql: ${TABLE}.Pageviews ;;
  }

  dimension: persona {
    type: string
    sql: ${TABLE}.persona ;;
  }

  dimension: session_with_event {
    type: number
    sql: ${TABLE}.Session_with_event ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_session_with_event {
    type: sum
    sql: ${session_with_event} ;;
  }

  measure: average_session_with_event {
    type: average
    sql: ${session_with_event} ;;
  }

  dimension: sessions {
    type: number
    sql: ${TABLE}.sessions ;;
  }

  dimension: social_platform {
    type: string
    sql: ${TABLE}.social_platform ;;
  }
 dimension: form {
   type: string
   sql: ${TABLE}.form ;;
 }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

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

  dimension: total_entrancevisits {
    type: number
    sql: ${TABLE}.total_entrancevisits ;;
  }

  dimension: total_event {
    type: number
    sql: ${TABLE}.TotalEvent ;;
  }

  dimension: total_onepage_visits {
    type: number
    sql: ${TABLE}.total_onepage_visits ;;
  }

  dimension: traffic {
    type: string
    sql: ${TABLE}.traffic ;;
  }

  dimension: traffic_persona {
    type: string
    sql: ${TABLE}.traffic_persona ;;
  }

  dimension: users {
    type: number
    sql: ${TABLE}.Users ;;
  }

  measure:dash_nav1 {
    view_label: "Session"
    group_label: "Dashboard Navigation"
    label: "Navigation Bar Campaign"
    type: string
    sql: "";;
    html:
    <nav style="font-size: 18px; color: #4285F4">
<div style>
    <a style="padding: 5px 15px; border-top: solid 1px #AEC8C1; border-left: solid 1px #AEC8C1; border-right: solid 1px #AEC8C1; border-bottom: solid 1px #AEC8C1; border-radius: 5px 5px 5px 5px;  float: center; line-height: 40px; font-weight: bold; background-color: #ffffff;color: #2AAA8A"  href="https://mediaagility.looker.com/dashboards/341">Overview</a>

      <a  style="color: #ffffff; padding: 1px 2px; border-top: solid 1px #ffffff border-left: solid 1px #ffffff; border-right: solid 1px #ffffff; border-radius: 5px 5px 0 0; float: center; line-height: 1.1px; font-weight: bold;" href="#home"> </a>

      <a style="padding: 5px 15px; border-top: solid 1px #AEC8C1; border-left: solid 1px #AEC8C1; border-right: solid 1px #AEC8C1; border-bottom: solid 1px #AEC8C1; border-radius: 5px 5px 5px 5px;  float: center; line-height: 40px; font-weight: bold; background-color: #ffffff;color: #2AAA8A"  href="https://mediaagility.looker.com/dashboards/343">Website Performance</a>
      <a  style="color: #ffffff; padding: 1px 2px; border-top: solid 1px #ffffff border-left: solid 1px #ffffff; border-right: solid 1px #ffffff; border-radius: 5px 5px 0 0; float: center; line-height: 1.1px; font-weight: bold;" href="#home"> </a>






      <a style="padding: 5px 15px; border-top: solid 1px #AEC8C1; border-left: solid 1px #AEC8C1; border-right: solid 1px #AEC8C1; border-bottom: solid 1px #AEC8C1; border-radius: 5px 5px 5px 5px;  float: center; line-height: 40px; font-weight: bold; background-color: #ffffff;color:  #2AAA8A"  href="https://mediaagility.looker.com/dashboards/367">Media Performance</a>
      <a  style="color: #ffffff; padding: 1px 2px; border-top: solid 1px #ffffff border-left: solid 1px #ffffff; border-right: solid 1px #ffffff; border-radius: 5px 5px 0 0; float: center; line-height: 1.1px; font-weight: bold;" href="#home"> </a>
      <a style="padding: 5px 15px; border-top: solid 1px #AEC8C1; border-left: solid 1px #AEC8C1; border-right: solid 1px #AEC8C1; border-bottom: solid 1px #AEC8C1; border-radius: 5px 5px 5px 5px;  float: center; line-height: 40px; font-weight: bold; background-color: #ffffff;color:  #2AAA8A"  href="https://mediaagility.looker.com/dashboards/379">Social Performance</a>
      <a  style="color: #ffffff; padding: 1px 2px; border-top: solid 1px #ffffff border-left: solid 1px #ffffff; border-right: solid 1px #ffffff; border-radius: 5px 5px 0 0; float: center; line-height: 1.1px; font-weight: bold;" href="#home"> </a>
      <a style="padding: 5px 15px; border-top: solid 1px #AEC8C1; border-left: solid 1px #AEC8C1; border-right: solid 1px #AEC8C1; border-bottom: solid 1px #AEC8C1; border-radius: 5px 5px 5px 5px;  float: center; line-height: 40px; font-weight: bold; background-color: #2AAA8A;color:  white"  href="https://mediaagility.looker.com/dashboards/383">Campaign</a>



      </div>;;
  }
  measure: Users {
    type: sum
    sql: ${TABLE}.Users ;;
  }
  measure: Users_last_week {
    type: sum
    value_format: "[>=1000000]0.00,,\"M\";[>=1000]0.00,\"K\";0"
    sql: ${TABLE}.Users ;;
    filters: [timestamp_date: "1 month ago"]
  }
  measure: Change_Users {
    type: number
    sql: ${Users} - ${Users_last_week};;
    value_format: "[>=1000000]0.00,,\"M\";[>=1000]0.00,\"K\";0"
    html: {% if value > 0 AND value < 100000000 %}

          <p style="color: #2AAA8A">{{ rendered_value }} ▲ </p>
          {% elsif value < 0 %}
          <p style="color: #FF0000">{{ rendered_value }} ▼ </p>
          {% else %}
          <p style="color: #000000">{{ rendered_value }}</p>
          {% endif %} ;;
  }
  measure: TotalEvent {
    type: sum
    sql:  ${TABLE}.TotalEvent ;;
  }
  measure: Sessions {
    type: sum
    value_format: "[>=1000000]0.00,,\"M\";[>=1000]0.00,\"K\";0"
    sql: ${TABLE}.sessions ;;
  }
  measure: Sessions_last_week {
    type: sum
    value_format: "[>=1000000]0.00,,\"M\";[>=1000]0.00,\"K\";0"
    sql: ${TABLE}.sessions ;;
    filters: [timestamp_date: "1 month ago"]
  }
  measure: Change_sessions {
    type: number
    sql: ${Sessions} - ${Sessions_last_week} ;;
    value_format: "[>=1000000]0.00,,\"M\";[>=1000]0.00,\"K\";0"
    html: {% if value > 0 AND value < 100000000 %}

    <p style="color: #2AAA8A">{{ rendered_value }} ▲ </p>
    {% elsif value < 0 %}
    <p style="color: #FF0000">{{ rendered_value }} ▼ </p>
    {% else %}
    <p style="color: #000000">{{ rendered_value }}</p>
    {% endif %} ;;
  }
  measure: Pages {
    type: sum
    value_format: "[>=1000000]0.00,,\"M\";[>=1000]0.00,\"K\";0"
    sql: ${TABLE}.pages ;;
  }
  measure: Pages_last_week {
    type: sum
    value_format: "[>=1000000]0.00,,\"M\";[>=1000]0.00,\"K\";0"
    sql: ${TABLE}.pages ;;
    filters: [timestamp_date: "1 month ago"]
  }
  measure: Pages_by_Sessions {
    type: number
    value_format: "0.##"
    sql: ${Pages}/${Sessions} ;;
  }
  measure: Pages_by_Sessions_Last_week {
    type: number
    value_format: "0.##"
    sql: ${Pages_last_week}/${Sessions_last_week} ;;
  }
  measure: Change_Pages_by_Session {
    type: number
    value_format_name: percent_2
    sql: (${Pages_by_Sessions} - ${Pages_by_Sessions_Last_week})/100;;
    html: {% if value > 0 %}

    <p style="color: #2AAA8A">{{ rendered_value }} ▲ </p>
    {% elsif value <0 %}
    <p style="color: #FF0000">{{ rendered_value }} ▼ </p>
    {% else %}
    <p style="color: #000000">{{ rendered_value }}</p>
    {% endif %} ;;

  }
  measure: Pageviews{
    type: sum
    value_format: "[>=1000000]0.00,,\"M\";[>=1000]0.00,\"K\";0"
    sql: ${TABLE}.pageviews;;
  }
  measure: Pageviews_Last_week{
    type: sum
    value_format: "[>=1000000]0.00,,\"M\";[>=1000]0.00,\"K\";0"
    sql: ${TABLE}.pageviews;;
    filters: [timestamp_date: "1 month ago"]
  }
  measure: Change_Pageviews {
    type: number
    value_format: "[>=1000000]0.00,,\"M\";[>=1000]0.00,\"K\";0"
    sql: ${Pageviews} - ${Pageviews_Last_week};;
    html: {% if value > 0 AND value < 10000000 %}

          <p style="color: #2AAA8A">{{ rendered_value }} ▲ </p>
          {% elsif value < 0 %}
          <p style="color: #FF0000">{{ rendered_value }} ▼ </p>
          {% else %}
          <p style="color: #000000">{{ rendered_value }}</p>
          {% endif %} ;;

    }
 measure: Total_onepage_visits {
   type: sum
  sql: ${TABLE}.total_onepage_visits;;
 }
  measure: Total_onepage_visits_last_month{
    type: sum
    sql: ${TABLE}.total_onepage_visits ;;
    filters: [timestamp_date: "1 month ago"]
  }
measure: Total_entrancevisits  {
  type: sum
  sql: ${TABLE}.total_entrancevisits ;;
}
  measure: Total_entrancevisits_last_month {
    type: sum
    sql: ${TABLE}.total_entrancevisits ;;
    filters: [timestamp_date: "1 month ago"]
  }
measure: BounceRate {
  type: number
  value_format_name: percent_2
  sql: ${Total_onepage_visits}/${Total_entrancevisits}/100 ;;
}
  measure: BounceRate_lastmonth {
    type: number
    value_format_name: percent_2
    sql: ${Total_onepage_visits_last_month}/${Total_entrancevisits_last_month}/100 ;;
    html: {% if value > 0 %}

    <p style="color: #2AAA8A">{{ rendered_value }} ▲ </p>
    {% elsif value <0 %}
    <p style="color: #FF0000">{{ rendered_value }} ▼ </p>
    {% else %}
    <p style="color: #000000">{{ rendered_value }}</p>
    {% endif %} ;;
  }
}
