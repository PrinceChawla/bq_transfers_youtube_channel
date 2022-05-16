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
    # required_access_grants: [can_view_random_number]
    type: sum
    sql: ${TABLE}.random_number ;;
  }

  dimension: new_dim {
    type: string
    sql: "prince" ;;
    link: {
      label: "Google"
      icon_url: "http://google.com/favicon.ico"
      url: "http://www.google.com/search?q={{ value }}"
    }

  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: formatted_count {
    type: number
    sql: ${random_number} ;;
    # html:
    # {% if value > 10 %}
    #   <font color="darkgreen">{{ rendered_value }}</font>
    # {% elsif value > 5 %}
    #   <font color="goldenrod">{{ rendered_value }}</font>
    # {% else %}
    #   <font color="darkred">{{ rendered_value }}</font>
    # {% endif %} ;;

    html: <img src="http://www.google.com/{{ value }}.jpg"/>;;
    # https://image.shutterstock.com/z/stock-photo-fish-aquarium-tropical-yellow-isolated-on-white-dicut-save-in-jpg-file-clipping-paths-1697115022.jpg
    tags: ["abcd"]

  }


}
