view: channel_combined_a2_ycr {
  sql_table_name: youtube_channel_reports.channel_combined_a2_ycr ;;

  ###########################
#######YouTube Dimensions#######
  ###########################

  dimension_group: _data {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    sql: TIMESTAMP(${TABLE}._DATA_DATE) ;;
  }

  dimension_group: _latest {
    hidden: yes
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    sql: TIMESTAMP(${TABLE}._LATEST_DATE) ;;
  }

  dimension: channel_id {
    type: string
    sql: ${TABLE}.channel_id ;;
  }

  dimension: country_code {
    map_layer_name: countries
    type: string
    sql: ${TABLE}.country_code ;;
  }

  dimension: date {
    hidden: yes
    type: string
    sql: ${TABLE}.date ;;
  }

  dimension: device_type {
    hidden: yes
    type: number
    sql: ${TABLE}.device_type ;;
  }
  dimension: device {
    type: string
    sql: CASE WHEN ${device_type}=100 THEN 'Unknown'
              WHEN ${device_type}=101 THEN 'Computer'
              WHEN ${device_type}=102 THEN 'TV'
              WHEN ${device_type}=103 THEN 'Game Console'
              WHEN ${device_type}=104 THEN 'Mobile Phone'
              WHEN ${device_type}=105 THEN 'Tablet'
          END;;
  }

  dimension: live_or_on_demand {
    type: string
    sql: ${TABLE}.live_or_on_demand ;;
  }

  dimension: operating_system {
    type: number
    sql: ${TABLE}.operating_system ;;
  }

  dimension: playback_location_type {
    hidden: yes
    type: number
    sql: ${TABLE}.playback_location_type ;;
  }
  dimension: playback_location {
    description: "This dimension identifies the type of page or application where user activity occurred"
    type: string
    sql: CASE WHEN ${playback_location_type}=0 THEN 'YT Page or App'
              WHEN ${playback_location_type}=1 THEN 'iframe embed'
              WHEN ${playback_location_type}=2 THEN 'YT Channel'
              WHEN ${playback_location_type}=5 THEN 'Unknown'
              WHEN ${playback_location_type}=7 THEN "YT User Home Page"
              WHEN ${playback_location_type}=8 THEN "YT Search Page"
          END    ;;
  }

  dimension: subscribed_status {
    description: "Is the user subscribed to the channel"
    type: string
    sql: ${TABLE}.subscribed_status ;;
  }

  dimension: traffic_source_type {
    hidden: yes
    type: number
    sql: ${TABLE}.traffic_source_type ;;
  }
  dimension: traffic_source {
    type: string
    sql: CASE
          WHEN ${traffic_source_type}=0 THEN 'Direct'
          WHEN ${traffic_source_type}=1 THEN 'YT Advertizing'
          WHEN ${traffic_source_type}=3 THEN 'Browse'
          WHEN ${traffic_source_type}=4 THEN 'Channels'
          WHEN ${traffic_source_type}=5 THEN 'Youtube Search'
          WHEN ${traffic_source_type}=7 THEN 'Suggested Videos'
          WHEN ${traffic_source_type}=8 THEN 'Other YT Features'
          WHEN ${traffic_source_type}=9 THEN 'External'
          WHEN ${traffic_source_type}=11 THEN 'Cards'
          WHEN ${traffic_source_type}=14 THEN 'Playlists'
          WHEN ${traffic_source_type}=17 THEN 'Notifications'
          WHEN ${traffic_source_type}=18 THEN 'Playlist Page'
          WHEN ${traffic_source_type}=19 THEN 'Claimed Content'
          WHEN ${traffic_source_type}=20 THEN 'End Screen'
          END
          ;;
  }

  dimension: video_id {
    type: string
    sql: ${TABLE}.video_id ;;
    link: {
      label: "Watch Video"
      url: "http://youtube.com/watch?v={{ value }}"
      icon_url: "http://youtube.com/favicon.ico"
    }
    link: {
      label: "Video Dashboard"
      url: "/dashboards/?video%20id={{ value | encode_uri }}"
      icon_url: "http://www.looker.com/favicon.ico"
    }
  }



    ######################
#######You Tube Metrics#########
    ######################
  dimension: average_view_duration_percentage {
    hidden: yes
    type: number
    sql: ${TABLE}.average_view_duration_percentage ;;
  }
  dimension: average_view_duration_percentage_tier {
    type: tier
    sql: ${average_view_duration_percentage} ;;
    tiers: [0,25,50,75,100]
    allow_fill: no
    style: relational
  }
  measure: avg_view_duration_percentage {
    label: "Average View Duration (percentage)"
    type: average
    sql: ${average_view_duration_percentage} ;;
    value_format: "0.0\%"
    drill_fields: [video_detail*,avg_view_duration_percentage,-avg_view_duration_s]
  }

  dimension: average_view_duration_seconds {
    hidden: yes
    type: number
    sql: ${TABLE}.average_view_duration_seconds ;;
  }
  dimension: average_view_duration_minutes_tier {
    type: tier
    sql: ${average_view_duration_seconds}/60 ;;
    tiers: [0,0.5,1,1.5,2,3,4,5,10,30,60]
    allow_fill: no
    style: relational

  }
  measure: avg_view_duration_s {
    label: "Average View Duration (seconds)"
    type: average
    sql: ${average_view_duration_seconds} ;;
    value_format_name: decimal_1
    drill_fields: [video_detail*]
  }

  dimension: red_views {
    hidden: yes
    type: number
    sql: ${TABLE}.red_views ;;
  }
  measure: total_red_views {
    type: sum
    sql: ${red_views} ;;
    drill_fields: [video_detail*]
  }
  measure: average_red_views {
    type: average
    sql: ${red_views} ;;
    drill_fields: [video_id,average_red_views]
  }

  dimension: red_watch_time_minutes {
    hidden: yes
    type: number
    sql: ${TABLE}.red_watch_time_minutes ;;
  }

  dimension: views {
    hidden: yes
    type: number
    sql: ${TABLE}.views ;;
  }
  measure: total_views {
    type: sum
    sql: ${views} ;;
    drill_fields: [video_detail*]
  }
  measure: average_views {
    type: average
    sql: ${views} ;;
    drill_fields: [video_id,average_views]
  }

  dimension: watch_time_minutes {
    hidden: yes
    type: number
    sql: ${TABLE}.watch_time_minutes ;;
  }
  measure: total_watch_time_minutes {
    type: sum
    sql: ${watch_time_minutes} ;;
    drill_fields: [video_detail*,total_watch_time_minutes,-avg_view_duration_s]
  }

  measure: video_count {
    type: count_distinct
    sql: ${video_id} ;;
    drill_fields: [video_detail*]
  }

  set: video_detail {
    fields: [video_id, video_facts.video_length_seconds,avg_view_duration_s,total_views]
  }

}
