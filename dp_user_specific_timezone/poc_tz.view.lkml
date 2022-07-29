# The name of this view in Looker is "Poc Tz"
view: poc_tz {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `mlconsole-poc.durga_bigquery.poc_tz`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Call Type" in Explore.

  dimension: call_type {
    type: string
    sql: ${TABLE}.call_type ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: conversation_end {
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
    sql: ${TABLE}.conversation_end ;;
  }

  dimension: conversation_id {
    type: string
    sql: ${TABLE}.conversation_id ;;
  }

  dimension_group: conversation_start {
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
    sql: ${TABLE}.conversation_start ;;
  }

  dimension_group: conversation_start_test {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year,
      time
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.conversation_start_date ;;
  }

  dimension: conversation_success {
    type: string
    sql: ${TABLE}.conversation_success ;;
  }

  dimension: end_user_phone_number {
    type: string
    sql: ${TABLE}.end_user_phone_number ;;
  }

  dimension: exit {
    type: string
    sql: ${TABLE}.exit ;;
  }

  dimension: exit_type {
    type: string
    sql: ${TABLE}.exit_type ;;
  }

  dimension: holly_call_id {
    type: string
    sql: ${TABLE}.holly_call_id ;;
  }

  dimension: language {
    type: string
    sql: ${TABLE}.language ;;
  }

  dimension_group: load_timestamp {
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
    sql: ${TABLE}.load_timestamp ;;
  }

  dimension_group: nerve_log_timestamp {
    label: "Original Timezone"
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
    sql: ${TABLE}.nerve_log_timestamp ;;
  }

  parameter: Timezone {
    type: string
    allowed_value: {

      value: "Local"

    }

    allowed_value: {

      value: "Australia/Sydney"

    }

    allowed_value: {

      value: "Europe/London"

    }

    allowed_value: {

      value: "America/New_York"

    }

    allowed_value: {

      value: "UTC"

    }
  }
  dimension: nerve {
    label: "Converted Timezone"
    type: date_time
    sql:  TIMESTAMP(DATETIME(((TIMESTAMP(${nerve_log_timestamp_time}))),  "{{ _user_attributes['timezone'] }}")) ;;
  }
  dimension: outreach_id {
    type: string
    sql: ${TABLE}.outreach_id ;;
  }

  dimension: provider_number {
    type: number
    sql: ${TABLE}.provider_number ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_provider_number {
    type: sum
    sql: ${provider_number} ;;
  }

  measure: average_provider_number {
    type: average
    sql: ${provider_number} ;;
  }

  dimension: published_message_id {
    type: string
    sql: ${TABLE}.published_message_id ;;
  }

  dimension_group: published_timestamp {
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
    sql: ${TABLE}.published_timestamp ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension_group: subscribed_timestamp {
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
    sql: ${TABLE}.subscribed_timestamp ;;
  }

  dimension: turn_id {
    type: string
    sql: ${TABLE}.turn_id ;;
  }

  dimension: test {
    type: string
    sql: DATETIME(((TIMESTAMP(poc_tz.conversation_start_date))), "{{ _user_attributes['timezone'] }}") ;;
  }
  #######Timezone specific data######

  dimension: Date_filter {
    type: string
    sql: CAST(${conversation_start_test_date} AS STRING) ;;
  }

  filter: date_filter {
    type: string
    suggest_explore: poc_tz
    suggest_dimension: Date_filter
  }
  # filter: raw {
  #   type: date
  #   sql: ${conversation_start_test_date} > {% date_start %} ;;
  # }

  dimension: difference {
    type: number
    sql: TIMESTAMP_DIFF(TIMESTAMP(FORMAT_TIMESTAMP('%F %T', poc_tz.nerve_log_timestamp )) ,     TIMESTAMP(FORMAT_TIMESTAMP('%F %T', DATETIME(((TIMESTAMP((FORMAT_TIMESTAMP('%F %T', poc_tz.nerve_log_timestamp ))))),  "{{ _user_attributes['timezone'] }}") )),HOUR) ;;
  }

  dimension: start_filter {

    sql:
    CASE
    WHEN ${difference} < 0
    THEN (FORMAT_TIMESTAMP('%F %T',TIMESTAMP_ADD(TIMESTAMP(CAST(poc_tz.conversation_start_date AS STRING)),INTERVAL (-1 * ${difference}) HOUR)))
     WHEN ${difference} > 0
    THEN (FORMAT_TIMESTAMP('%F %T',TIMESTAMP_ADD(TIMESTAMP(CAST(poc_tz.conversation_start_date AS STRING)),INTERVAL (1 * -${difference}) HOUR)))
    ELSE NULL
    END
    ;;
  }

  dimension: end_filter {
    sql:(FORMAT_TIMESTAMP('%F %T',TIMESTAMP_ADD(TIMESTAMP(${start_filter}),INTERVAL 1 DAY))) ;;
  }
  dimension: check {
    type: yesno
    sql:{%condition date_filter%} ${Date_filter} {% endcondition %}
         AND
          (
          ${nerve} > ${start_filter}
          AND
          ${nerve} < ${end_filter}
          );;
  }

  # dimension: check_raw {
  #   type: yesno
  #   sql: {%condition raw%} ${Raw_filter} {% endcondition %};;
  # }
  parameter: Check_test {
    type: string
    allowed_value: {
      value: "year"
      label: "By year"
    }
  }
  measure:dash_nav3 {
    view_label: "Session"
    group_label: "Dashboard Navigation "
    label: "Navigation Bar Looker Actions"
    type: string
    sql: "";;
    html:
    <nav style="font-size: 18px; color: #4285F4">
<div style>
    <a style="padding: 5px 15px; border-top: solid 1px #AEC8C1; border-left: solid 1px #AEC8C1; border-right: solid 1px #AEC8C1; border-bottom: solid 1px #AEC8C1; border-radius: 5px 5px 5px 5px;  float: center; line-height: 40px; font-weight: bold; background-color: #ffffff;color: #2AAA8A"  href="https://mediaagility.looker.com/dashboards/426">Conditional Drill</a>

      <a  style="color: #ffffff; padding: 1px 2px; border-top: solid 1px #ffffff border-left: solid 1px #ffffff; border-right: solid 1px #ffffff; border-radius: 5px 5px 0 0; float: center; line-height: 1.1px; font-weight: bold;" href="#home"> </a>

      <a style="padding: 5px 15px; border-top: solid 1px #AEC8C1; border-left: solid 1px #AEC8C1; border-right: solid 1px #AEC8C1; border-bottom: solid 1px #AEC8C1; border-radius: 5px 5px 5px 5px;  float: center; line-height: 40px; font-weight: bold; background-color:  #ffffff;color: #2AAA8A"  href="https://mediaagility.looker.com/dashboards/427">Looker Actions</a>
      <a  style="color: #ffffff; padding: 1px 2px; border-top: solid 1px #ffffff border-left: solid 1px #ffffff; border-right: solid 1px #ffffff; border-radius: 5px 5px 0 0; float: center; line-height: 1.1px; font-weight: bold;" href="#home"> </a>


      <a style="padding: 5px 15px; border-top: solid 1px #AEC8C1; border-left: solid 1px #AEC8C1; border-right: solid 1px #AEC8C1; border-bottom: solid 1px #AEC8C1; border-radius: 5px 5px 5px 5px;  float: center; line-height: 40px; font-weight: bold; background-color: #ffffff;color: #2AAA8A"  href="https://mediaagility.looker.com/dashboards/424">Visual Drill</a>
      <a  style="color: #ffffff; padding: 1px 2px; border-top: solid 1px #ffffff border-left: solid 1px #ffffff; border-right: solid 1px #ffffff; border-radius: 5px 5px 0 0; float: center; line-height: 1.1px; font-weight: bold;" href="#home"> </a>


      <a style="padding: 5px 15px; border-top: solid 1px #AEC8C1; border-left: solid 1px #AEC8C1; border-right: solid 1px #AEC8C1; border-bottom: solid 1px #AEC8C1; border-radius: 5px 5px 5px 5px;  float: center; line-height: 40px; font-weight: bold; background-color: #2AAA8A;color:  white"  href="https://mediaagility.looker.com/dashboards/423">Timezone</a>


      </div>;;
  }
  measure: count {
    type: count
    drill_fields: []
  }
  dimension: show_my_dimension_filter {

    html: {% if _filters['raw'] IS NOT "NULL" %} {{_filters['raw']}}

      {% else %} no filter value {% endif %};;

    sql: 'this does nothing' ;;

  }
  dimension: Test3 {
    type: string
    sql: ${show_my_dimension_filter};;
  }
}
