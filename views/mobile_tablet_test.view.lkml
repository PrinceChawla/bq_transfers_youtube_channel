view: mobile_tablet_test {

  sql_table_name: `mlconsole-poc.looker_db.mobile_tablet_test`
    ;;

  dimension: campaign {
    type: string
    sql: ${TABLE}.campaign ;;
  }

  dimension: clicks {
    type: number
    sql: ${TABLE}.Clicks ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: device {
    type: string
    sql: ${TABLE}.device ;;
    link: {label: "Details" url:"{{detail._link}}"}
  }

  measure: detail {
    type: number
    sql: 1=1 ;;
    drill_fields: [social_platform, sessions]
    hidden: yes
  }


  dimension: impressions {
    type: number
    sql: ${TABLE}.impressions ;;
  }

  measure: total_impressions {
    type: sum
    sql: ${impressions} ;;
  }

  measure: average_impressions {
    type: average
    sql: ${impressions} ;;
  }


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

  dimension: pages {
    type: number
    sql: ${TABLE}.pages ;;
  }

  dimension: persona {
    type: string
    sql: ${TABLE}.persona ;;
  }

  dimension: search_keyword {
    type: string
    sql: ${TABLE}.search_keyword ;;
  }

  dimension: sessions {
    type: number
    sql: ${TABLE}.sessions ;;
  }

  dimension: social_platform {
    type: string
    sql: ${TABLE}.social_platform ;;
  }

  dimension: spend {
    type: number
    sql: ${TABLE}.spend ;;
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

  dimension: total_eligible_impressions {
    type: number
    sql: ${TABLE}.total_eligible_impressions ;;
  }

  dimension: total_entrancevisits {
    type: number
    sql: ${TABLE}.total_entrancevisits ;;
  }

  dimension: total_onepage_visits {
    type: number
    sql: ${TABLE}.total_onepage_visits ;;
  }

  # measure: count {
  #   type: count
  #   drill_fields: []
  # }
}
