view: social_performance1 {

  sql_table_name: `mlconsole-poc.youtube_channel_reports.social_performance1`
    ;;

  dimension: amount_spend {
    type: number
    sql: ${TABLE}.amount_spend ;;
  }

  dimension: device {
    type: string
    sql: ${TABLE}.device ;;
  }

  # dimension: frequency {
  #   type: number
  #   sql: ${TABLE}.frequency ;;
  # }

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

  dimension: os {
    type: string
    sql: ${TABLE}.os ;;
  }

  # dimension: page_visit {
  #   type: number
  #   sql: ${TABLE}.page_visit ;;
  # }

  dimension: persona {
    type: string
    sql: ${TABLE}.persona ;;
  }

  # dimension: post_comments {
  #   type: number
  #   sql: ${TABLE}.post_comments ;;
  # }

  # dimension: post_share {
  #   type: number
  #   sql: ${TABLE}.post_share ;;
  # }

  # dimension: reach {
  #   type: number
  #   sql: ${TABLE}.reach ;;
  # }

  dimension: social_platform {
    type: string
    sql: ${TABLE}.social_platform ;;
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

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }
  measure: count {
    type: count
    drill_fields: []
  }

  measure: total_amount_spend {
    type: sum
    sql: ${amount_spend} ;;
    value_format: "[>=1000000]0.00,,\"M\";[>=1000]0.00,\"K\";0.00"
  }

  measure: amount_spend_last_month {
    type: sum
    sql: ${amount_spend} ;;
    value_format: "[>=1000000]0.00,,\"M\";[>=1000]0.00,\"K\";0.00"
    filters: [timestamp_date: "1 month ago"]
  }

  measure: average_amount_spend {
    type: average
    sql: ${amount_spend} ;;
  }

  measure: frequency {
    type: sum
    sql: ${TABLE}.frequency ;;
    value_format: "[>=1000000]0.00,,\"M\";[>=1000]0.00,\"K\";0.00"
  }

  measure: frequency_last_month {
    type: sum
    sql: ${TABLE}.frequency ;;
    value_format: "[>=1000000]0.00,,\"M\";[>=1000]0.00,\"K\";0.00"
    filters: [timestamp_date: "1 month ago"]
  }

  measure: impressions {
    type: sum
    sql: ${TABLE}.impression ;;
    value_format: "[>=1000000]0.00,,\"M\";[>=1000]0.00,\"K\";0.00"
  }

  measure: impressions_last_month {
    type: sum
    sql: ${TABLE}.impression ;;
    value_format: "[>=1000000]0.00,,\"M\";[>=1000]0.00,\"K\";0.00"
    filters: [timestamp_date: "1 month ago"]
  }

  measure: reach {
    type: sum
    sql: ${TABLE}.reach ;;
    value_format: "[>=1000000]0.00,,\"M\";[>=1000]0.00,\"K\";0.00"
  }

  measure: reach_last_month {
    type: sum
    sql: ${TABLE}.reach ;;
    value_format: "[>=1000000]0.00,,\"M\";[>=1000]0.00,\"K\";0.00"
    filters: [timestamp_date: "1 month ago"]
  }

  measure: page_visit {
    type: sum
    sql: ${TABLE}.page_visit ;;
    value_format: "[>=1000000]0.00,,\"M\";[>=1000]0.00,\"K\";0.00"
  }

  measure: page_visit_last_month {
    type: sum
    sql: ${TABLE}.page_visit ;;
    value_format: "[>=1000000]0.00,,\"M\";[>=1000]0.00,\"K\";0.00"
    filters: [timestamp_date: "1 month ago"]
  }

  measure: clicks {
    type: sum
    sql: ${TABLE}.clicks ;;
    value_format: "[>=1000000]0.00,,\"M\";[>=1000]0.00,\"K\";0.00"
  }

  measure: clicks_last_month {
    type: sum
    sql: ${TABLE}.clicks ;;
    value_format: "[>=1000000]0.00,,\"M\";[>=1000]0.00,\"K\";0.00"
    filters: [timestamp_date: "1 month ago"]
  }

  measure: post_comments {
    type: sum
    sql: ${TABLE}.post_comments ;;
    value_format: "[>=1000000]0.00,,\"M\";[>=1000]0.00,\"K\";0.00"
  }

  measure: post_comments_last_month {
    type: sum
    sql: ${TABLE}.post_comments ;;
    value_format: "[>=1000000]0.00,,\"M\";[>=1000]0.00,\"K\";0.00"
    filters: [timestamp_date: "1 month ago"]
  }

  measure: post_share {
    type: sum
    sql: ${TABLE}.post_share ;;
    value_format: "[>=1000000]0.00,,\"M\";[>=1000]0.00,\"K\";0.00"
  }

  measure: post_share_last_month {
    type: sum
    sql: ${TABLE}.post_share ;;
    value_format: "[>=1000000]0.00,,\"M\";[>=1000]0.00,\"K\";0.00"
    filters: [timestamp_date: "1 month ago"]
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

      <a style="padding: 5px 15px; border-top: solid 1px #AEC8C1; border-left: solid 1px #AEC8C1; border-right: solid 1px #AEC8C1; border-bottom: solid 1px #AEC8C1; border-radius: 5px 5px 5px 5px;  float: center; line-height: 40px; font-weight: bold; background-color: #ffffff;color: #2AAA8A"  href="https://mediaagility.looker.com/dashboards/343">Website Performance</a>
      <a  style="color: #ffffff; padding: 1px 2px; border-top: solid 1px #ffffff border-left: solid 1px #ffffff; border-right: solid 1px #ffffff; border-radius: 5px 5px 0 0; float: center; line-height: 1.1px; font-weight: bold;" href="#home"> </a>


      <a style="padding: 5px 15px; border-top: solid 1px #AEC8C1; border-left: solid 1px #AEC8C1; border-right: solid 1px #AEC8C1; border-bottom: solid 1px #AEC8C1; border-radius: 5px 5px 5px 5px;  float: center; line-height: 40px; font-weight: bold; background-color: #ffffff;color: #2AAA8A"  href="https://mediaagility.looker.com/dashboards/367">Media Performance</a>
            <a  style="color: #ffffff; padding: 1px 2px; border-top: solid 1px #ffffff border-left: solid 1px #ffffff; border-right: solid 1px #ffffff; border-radius: 5px 5px 0 0; float: center; line-height: 1.1px; font-weight: bold;" href="#home"> </a>

      <a style="padding: 5px 15px; border-top: solid 1px #AEC8C1; border-left: solid 1px #AEC8C1; border-right: solid 1px #AEC8C1; border-bottom: solid 1px #AEC8C1; border-radius: 5px 5px 5px 5px;  float: center; line-height: 40px; font-weight: bold; background-color: #2AAA8A;color: white"  href="https://mediaagility.looker.com/dashboards/379">Social Performance</a>
            <a  style="color: #ffffff; padding: 1px 2px; border-top: solid 1px #ffffff border-left: solid 1px #ffffff; border-right: solid 1px #ffffff; border-radius: 5px 5px 0 0; float: center; line-height: 1.1px; font-weight: bold;" href="#home"> </a>

      <a style="padding: 5px 15px; border-top: solid 1px #AEC8C1; border-left: solid 1px #AEC8C1; border-right: solid 1px #AEC8C1; border-bottom: solid 1px #AEC8C1; border-radius: 5px 5px 5px 5px;  float: center; line-height: 40px; font-weight: bold; background-color: #ffffff;color: #2AAA8A"  href="">Campaign</a>





      </div>;;
  }
}
