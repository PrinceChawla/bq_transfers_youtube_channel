# The name of this view in Looker is "Slot Events"
view: slot_events {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `mlconsole-poc.slots.slot_events`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Event Amount" in Explore.

  dimension: event_amount {
    type: number
    sql: ${TABLE}.event_amount ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_event_amount {
    type: sum
    sql: ${event_amount} ;;
  }

  measure: average_event_amount {
    type: average
    sql: ${event_amount} ;;
  }

  dimension: event_id {
    type: string
    sql: ${TABLE}.event_id ;;
    primary_key: yes
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: event_timestamp {
    type: time
    timeframes: [
      hour,
      day_of_week,
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.event_timestamp ;;
  }

  dimension: event_type {
    type: string
    sql: ${TABLE}.event_type ;;
  }

  dimension_group: game_end_timestamp {
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
    sql: ${TABLE}.game_end_timestamp ;;
  }

  dimension: game_id {
    type: number
    sql: ${TABLE}.game_id ;;
  }

  dimension_group: game_start_timestamp {
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
    sql: ${TABLE}.game_start_timestamp ;;
  }

  dimension_group: time_played {
    type: duration
    intervals: [second, minute, hour,day, week, month, quarter, year]
    sql_start: ${game_start_timestamp_raw} ;;
    sql_end: ${game_end_timestamp_raw} ;;
    }

  measure: total_time_played {
    sql: ${minutes_time_played} ;;
    type: sum
  }

  measure: average_time_played {
    sql: ${minutes_time_played} ;;
    type: average
  }


  dimension: player_id {
    type: number
    sql: ${TABLE}.player_id ;;
  }

  dimension: slot_id {
    type: number
    sql: ${TABLE}.slot_id ;;
  }

  dimension: new_visitor  {
    type: string
    sql: cast(${TABLE}.new_visitor as string) ;;
  }

  measure: count {
    type: count_distinct
    sql: ${event_id} ;;
    drill_fields: [event_timestamp_hour, count]
    # link: {
    #   label: "Drill to Hour"
    #   url: "
    #   {% assign vis_config = '{\"type\": \"looker_line\"}' %}
    #   {{ _link }}&vis_config={{ vis_config  }}"
    # }

  }

  measure: count_new_visitor {
    type: count
      filters: [new_visitor: "true"]
  }

  measure: count_repeat_visitor {
    type: count
    filters: [new_visitor: "false"]
  }

}
