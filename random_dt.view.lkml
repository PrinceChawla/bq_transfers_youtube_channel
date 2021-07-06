view: random_dt {
  derived_table: {
    sql: SELECT
          (FORMAT_TIMESTAMP('%F %T', random_data.dt , 'America/Los_Angeles')) AS random_data_dt_time,
          COALESCE(SUM(random_data.random_number ), 0) AS random_data_random_number
      FROM `mlconsole-poc.youtube_channel_reports.random_data`
           AS random_data
      GROUP BY
          1
      ORDER BY
          1 DESC
      LIMIT 500
       ;;
      # datagroup_trigger: default
      # persist_for: "10 seconds"
      # sql_trigger_value: select count(1) from mlconsole-poc.youtube_channel_reports.random_data;;

  }

  measure: count {
    type: count
    # drill_fields: [detail*]
  }

  dimension: random_data_dt_time {
    type: string
    sql: ${TABLE}.random_data_dt_time ;;
  }

  dimension: random_data_random_number {
    type: number
    sql: ${TABLE}.random_data_random_number ;;
  }

  set: detail {
    fields: [random_data_dt_time, random_data_random_number]
  }
}
