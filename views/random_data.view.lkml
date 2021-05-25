view: random_data {
  sql_table_name: `mlconsole-poc.youtube_channel_reports.random_data`
    ;;

  dimension_group: dt {
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
    sql: ${TABLE}.dt ;;
  }

  measure: random_number {
    type: sum
    sql: ${TABLE}.random_number ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
