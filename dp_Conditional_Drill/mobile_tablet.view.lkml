# The name of this view in Looker is "Mobile Tablet"
view: mobile_tablet {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `mlconsole-poc.youtube_channel_reports.mobile_tablet` ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Campaign" in Explore.

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
  }

  dimension: impressions {
    type: number
    sql: ${TABLE}.impressions ;;
  }
  dimension: Detail {
    type: string
    sql:  ;;
}
dimension: Country_Wise_Details {
  type: string
  sql: CONCAT(${country},'  ','Detail') ;;
  html:<p style="color: blue; font-size: 100%"><u>{{ value }}</u></p>;;
}

measure: country_details {
  type: string
  sql: ${Country_Wise_Details} ;;
  required_fields: [Country_Wise_Details]
  html:
    {% if country._value == 'UK' %}
        <a style="font-weight: bold;color: blue" href = "https://mediaagility.looker.com/dashboards/392"><u>UK Details<u/></a>

    {% elsif country._value == 'USA' %}
    <a style="font-weight: bold;color: blue" href = "https://mediaagility.looker.com/dashboards/390"><u>USA Details<u/></a>
    {% else %}
    <a style="font-weight: bold;color: blue"><u>Canada Details<u/></a>
    {% endif %};;
}

measure: total_impressions {
  type: sum
  sql: ${impressions} ;;
}

measure: average_impressions {
  type: average
  sql: ${impressions} ;;
}

measure:Test {
  view_label: "Session"
  group_label: "Dashboard Navigation External"
  label: "Navigation Bar GCP"
  type: string
  sql: "";;
  html:
    <nav style="font-size: 18px; color: #4285F4">
<div style>
    <a style="padding: 5px 15px; border-top: solid 1px #AEC8C1; border-left: solid 1px #AEC8C1; border-right: solid 1px #AEC8C1; border-bottom: solid 1px #AEC8C1; border-radius: 5px 5px 5px 5px;  float: center; line-height: 40px; font-weight: bold; background-color: #2AAA8A;color: white"  href="https://console.cloud.google.com/monitoring/dashboards/resourceList/bigquery_dataset?project=mlconsole-poc&timeDomain=6w">GCP</a>



    </div>;;
}
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
parameter: rank {
  type: string
}
dimension: Test1 {
  type: string
  sql: {% parameter rank %} ;;
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
measure: country1 {
  type: string
  sql: ${country} ;;
  required_fields: [country]
  drill_fields: [device,count]
  link: {
    label: "Drill into {{value}}"
    url: "{% if mobile_tablet.country._value == 'USA' %}
    {{link}}&fields=mobile_tablet.USA*&toggle=dat,pik,vis&limit=5000
    {% elsif mobile_tablet.country._value == 'UK' %}
    {{link}}&fields=mobile_tablet.UK*&toggle=dat,pik,vis&limit=5000
    {% else %}
    {{link}}&fields=mobile_tablet.empty*
    {% endif %}"
  }
}
  set: empty {
    fields: []
  }
  set: USA {
    fields: [device,count]
  }
  set: UK {
    fields: [device,average_impressions]
  }
measure: count {
  type: count
  drill_fields: []
}
  measure:dash_nav3 {
    view_label: "Session"
    group_label: "Dashboard Navigation "
    label: "Navigation Bar Conditional Drill"
    type: string
    sql: "";;
    html:
    <nav style="font-size: 18px; color: #4285F4">
<div style>
    <a style="padding: 5px 15px; border-top: solid 1px #AEC8C1; border-left: solid 1px #AEC8C1; border-right: solid 1px #AEC8C1; border-bottom: solid 1px #AEC8C1; border-radius: 5px 5px 5px 5px;  float: center; line-height: 40px; font-weight: bold; background-color: #2AAA8A;color: white"  href="https://mediaagility.looker.com/dashboards/426">Conditional Drill</a>

      <a  style="color: #ffffff; padding: 1px 2px; border-top: solid 1px #ffffff border-left: solid 1px #ffffff; border-right: solid 1px #ffffff; border-radius: 5px 5px 0 0; float: center; line-height: 1.1px; font-weight: bold;" href="#home"> </a>

      <a style="padding: 5px 15px; border-top: solid 1px #AEC8C1; border-left: solid 1px #AEC8C1; border-right: solid 1px #AEC8C1; border-bottom: solid 1px #AEC8C1; border-radius: 5px 5px 5px 5px;  float: center; line-height: 40px; font-weight: bold; background-color: #ffffff;color: #2AAA8A"  href="https://mediaagility.looker.com/dashboards/427">Looker Actions</a>
      <a  style="color: #ffffff; padding: 1px 2px; border-top: solid 1px #ffffff border-left: solid 1px #ffffff; border-right: solid 1px #ffffff; border-radius: 5px 5px 0 0; float: center; line-height: 1.1px; font-weight: bold;" href="#home"> </a>


      <a style="padding: 5px 15px; border-top: solid 1px #AEC8C1; border-left: solid 1px #AEC8C1; border-right: solid 1px #AEC8C1; border-bottom: solid 1px #AEC8C1; border-radius: 5px 5px 5px 5px;  float: center; line-height: 40px; font-weight: bold; background-color: #ffffff;color: #2AAA8A"  href="https://mediaagility.looker.com/dashboards/424">Visual Drill</a>
      <a  style="color: #ffffff; padding: 1px 2px; border-top: solid 1px #ffffff border-left: solid 1px #ffffff; border-right: solid 1px #ffffff; border-radius: 5px 5px 0 0; float: center; line-height: 1.1px; font-weight: bold;" href="#home"> </a>


      <a style="padding: 5px 15px; border-top: solid 1px #AEC8C1; border-left: solid 1px #AEC8C1; border-right: solid 1px #AEC8C1; border-bottom: solid 1px #AEC8C1; border-radius: 5px 5px 5px 5px;  float: center; line-height: 40px; font-weight: bold; background-color: #ffffff;color:  #2AAA8A"  href="https://mediaagility.looker.com/dashboards/423">Timezone</a>


      </div>;;
  }
}
