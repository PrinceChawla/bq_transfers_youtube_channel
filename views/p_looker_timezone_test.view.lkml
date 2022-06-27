view: p_looker_timezone_test {

  sql_table_name: `mlconsole-poc.looker_db.p_looker_timezone_test` ;;

  dimension: call_type {
    type: string
    sql: ${TABLE}.call_type ;;
  }


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


  dimension: conversation_success {
    type: yesno
    sql: ${TABLE}.conversation_success ;;
  }

  dimension: end_user_phone_number {
    type: string
    sql: ${TABLE}.end_user_phone_number ;;
  }

  dimension: event {
    type: string
    sql: ${TABLE}.event ;;
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
    type: time
    # datatype: datetime
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
    convert_tz: no
  }

  dimension_group: reporting {
    type: time
    #datatype: datetime
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: TIMESTAMP(DATETIME(${TABLE}.nerve_log_timestamp, {{user_timezone._parameter_value}})) ;;
    convert_tz: no
  }

  dimension: outreach_id {
    type: string
    sql: ${TABLE}.outreach_id ;;
  }

  dimension: provider_number {
    type: number
    sql: ${TABLE}.provider_number ;;
  }


  measure: total_provider_number {
    type: sum
    sql: ${provider_number} ;;
  }

  measure: average_provider_number {
    type: average
    sql: ${provider_number} ;;
  }

  dimension: published_message_id {
    type: number
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

  parameter: user_timezone {
    # type: string
    default_value: "UTC"
    allowed_value: {
      value: "UTC"
    }
    allowed_value: {
      value: "Asia/Kolkata"
    }
    allowed_value: {
      value: "America/New_York"
    }
    allowed_value: {
      value: "Europe/London"
    }
  }

  measure: count {
    type: count
  }
}
