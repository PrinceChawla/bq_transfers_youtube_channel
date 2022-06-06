# The name of this view in Looker is "Media Performance"
view: media_performance {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `mlconsole-poc.youtube_channel_reports.media_performance`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Campaign" in Explore.

  dimension: campaign {
    type: string
    sql: ${TABLE}.campaign ;;
  }

  dimension: device {
    type: string
    sql: ${TABLE}.device ;;
  }

  measure: impressions {
    type: sum
    sql: ${TABLE}.impressions ;;
    # html: {% if value > 8700000 %}

    # <p style="color: #2AAA8A">▲  {{ rendered_value }}</p>
    # {% elsif value < 0 OR value < 8700000 %}
    # <p style="color: #009900">▼  {{ rendered_value }}</p>
    # {% else %}
    # <p style="color: #000000">{{ rendered_value }}</p>
    # {% endif %} ;;
  }
  measure: Arrow_impressions {
    type: sum
    sql: ${TABLE}.impressions ;;
    html: {% if value > 8700000 %}

    <p style="color: #2AAA8A">▲  {{ rendered_value }}</p>
    {% elsif value < 0 OR value < 8700000 %}
    <p style="color: #009900">▼  {{ rendered_value }}</p>
    {% else %}
    <p style="color: #000000">{{ rendered_value }}</p>
    {% endif %} ;;
  }
  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  # measure: total_impressions {
  #   type: sum
  #   sql: ${impressions} ;;
  # }

  # measure: average_impressions {
  #   type: average
  #   sql: ${impressions} ;;
  # }

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

  dimension: last_impressions {
    type: number
    sql: ${TABLE}.last_impressions ;;
  }

  dimension: os {
    type: string
    sql: ${TABLE}.os ;;
  }

  dimension: persona {
    type: string
    sql: ${TABLE}.persona ;;
  }

  dimension: search_keyword {
    type: string
    sql: ${TABLE}.search_keyword ;;
  }

  measure: Cost {
    type: sum
    value_format_name: usd_0
    sql: ${TABLE}.spend ;;
  }

  dimension: last_spend {
    type: string
    sql: ${TABLE}.last_spend ;;
  }

  dimension: Social_Media {
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
      year,
      month_name
    ]
    sql: ${TABLE}.timestamp ;;
  }

  measure: clicks {
    type: sum
    sql: ${TABLE}.Clicks ;;
  }
  measure: clicks_final {
    type: number
    sql: ${clicks} ;;
    value_format: "#,##0"
  }
  measure: Arrow_clicks {
    type: number
    value_format: "#,##0"
    sql: ${clicks_last_month} ;;
    html: {% if value >= 50000 and value <=100000 %}

    <p style="color: #ffffff;">▲  {{rendered_value}}</p>
    {% elsif value < 0 OR value < 200000 %}
    <p style="color: #009900">▼ {{rendered_value}}</p>
    {% else %}
    <p style="color: #000000">{{rendered_value}}</p>
    {% endif %} ;;
  }

  measure: clicks_last_month {
    type: sum
    sql: ${TABLE}.Clicks ;;
    filters: [timestamp_date: "1 month ago"]
    html: {% if value >= 10000 and value <=200000 %}

    <p style="color: #ffffff;">▲  {{rendered_value}}</p>
    {% elsif value < 0 OR value < 200000 %}
    <p style="color: #009900">▼ {{rendered_value}}</p>
    {% else %}
    <p style="color: #000000">{{rendered_value}}</p>
    {% endif %} ;;

    }
  measure: Impressions_last_month {
    type: sum
    sql: ${TABLE}.impressions ;;
    filters: [timestamp_date: "1 month ago"]
    html: {% if value >= 50000 and value <=7000000 %}

          <p style="color: #ffffff;">▲  {{rendered_value}}</p>
          {% elsif value < 0 OR value < 200000 %}
          <p style="color: #009900">▼ {{rendered_value}}</p>
          {% else %}
          <p style="color: #000000">{{rendered_value}}</p>
          {% endif %} ;;

  }
  # measure: clicks_last_month_final {
  #   sql: ${clicks_last_month} ;;
  #   value_format: "#,##0"
  # }


  measure: Average_Clicks {
    type: average
    value_format: "0"
    sql: ${TABLE}.Clicks ;;
  }
  measure: Average_Impressions {
    type: average
    value_format: "0"
    sql: ${TABLE}.impressions  ;;
  }
}
