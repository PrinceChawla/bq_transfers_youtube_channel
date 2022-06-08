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
    value_format: "[>=1000000]0.00,,\"M\";[>=1000]0.00,\"K\";0.00"
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
  dimension: region {
    type: string
    sql: ${TABLE}.State ;;
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
    #value_format_name: usd_0
    value_format: "[>=1000000]$0.00,,\"M\";[>=1000]$0.00,\"K\";$0.00"
    sql: ${TABLE}.spend ;;
  }
  measure: Cost_last_month {
    type: sum
    #value_format_name: usd_0
    value_format: "[>=1000000]$0.00,,\"M\";[>=1000]$0.00,\"K\";$0.00"
    sql: ${TABLE}.spend ;;
    filters: [timestamp_date: "1 month ago"]

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
    value_format: "[>=1000000]0.00,,\"M\";[>=1000]0.00,\"K\";0.00"
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
    value_format: "[>=1000000]0.00,,\"M\";[>=1000]0.00,\"K\";0.00"
    filters: [timestamp_date: "1 month ago"]
}

measure: percentage_increase {
  type: number
  value_format: "0.00\%"
  sql: ${clicks}/${clicks_last_month};;
}
  measure: Impressions_last_month {
    type: sum
    sql: ${TABLE}.impressions ;;
    value_format: "[>=1000000]0.00,,\"M\";[>=1000]0.00,\"K\";0.00"
    filters: [timestamp_date: "1 month ago"]
}
  # measure: clicks_last_month_final {
  #   sql: ${clicks_last_month} ;;
  #   value_format: "#,##0"
  # }


  measure: Average_Clicks {
    type: average
    value_format: "[>=1000000]0.00,,\"M\";[>=1000]0.00,\"K\";0.00"
    sql: ${TABLE}.Clicks ;;
  }
  measure: Average_Impressions {
    type: average
    value_format: "[>=1000000]0.00,,\"M\";[>=1000]0.00,\"K\";0.00"
    sql: ${TABLE}.impressions  ;;
  }

  measure: total_eligible_impressions {
    type: sum
    sql: ${TABLE}.total_eligible_impressions;;
  }
  measure: total_eligible_impressions_lastmonth {
    type: sum
    sql: ${TABLE}.total_eligible_impressions;;
    filters: [timestamp_date: "1 month ago"]
  }
  measure: total_onepage_visits {
    type: sum
    sql: ${TABLE}.total_onepage_visits;;
  }
  measure: total_onepage_visits_last_month {
    type: sum
    sql: ${TABLE}.total_onepage_visits;;
    filters: [timestamp_date: "1 month ago"]
  }
  measure: total_entrancevisits {
    type: sum
    sql: ${TABLE}.total_entrancevisits;;
  }
  measure: total_entrancevisits_last_month {
    type: sum
    sql: ${TABLE}.total_entrancevisits;;
    filters: [timestamp_date: "1 month ago"]
  }

  measure: pages {
    type: sum
    sql: ${TABLE}.pages ;;
  }
  measure: sessions {
    type: sum
    sql: ${TABLE}.sessions ;;
  }
  measure:dash_nav1 {
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






      <a style="padding: 5px 15px; border-top: solid 1px #AEC8C1; border-left: solid 1px #AEC8C1; border-right: solid 1px #AEC8C1; border-bottom: solid 1px #AEC8C1; border-radius: 5px 5px 5px 5px;  float: center; line-height: 40px; font-weight: bold; background-color: #2AAA8A;color: white"  href="https://mediaagility.looker.com/dashboards/367">Media Performance</a>
       <a  style="color: #ffffff; padding: 1px 2px; border-top: solid 1px #ffffff border-left: solid 1px #ffffff; border-right: solid 1px #ffffff; border-radius: 5px 5px 0 0; float: center; line-height: 1.1px; font-weight: bold;" href="#home"> </a>
           <a style="padding: 5px 15px; border-top: solid 1px #AEC8C1; border-left: solid 1px #AEC8C1; border-right: solid 1px #AEC8C1; border-bottom: solid 1px #AEC8C1; border-radius: 5px 5px 5px 5px;  float: center; line-height: 40px; font-weight: bold; background-color: #ffffff;color:  #2AAA8A"  href="https://mediaagility.looker.com/dashboards/379">Social Performance</a>
              <a  style="color: #ffffff; padding: 1px 2px; border-top: solid 1px #ffffff border-left: solid 1px #ffffff; border-right: solid 1px #ffffff; border-radius: 5px 5px 0 0; float: center; line-height: 1.1px; font-weight: bold;" href="#home"> </a>
                   <a style="padding: 5px 15px; border-top: solid 1px #AEC8C1; border-left: solid 1px #AEC8C1; border-right: solid 1px #AEC8C1; border-bottom: solid 1px #AEC8C1; border-radius: 5px 5px 5px 5px;  float: center; line-height: 40px; font-weight: bold; background-color: #ffffff;color:  #2AAA8A"  href="">Campaign</a>



      </div>;;
  }
}
