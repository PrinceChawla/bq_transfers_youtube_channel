view: sample_superstore {
  sql_table_name: `Internal_MA_CHARTER_looker_Project.Sample Superstore`
    ;;

  dimension: category {
    type: string
    sql: ${TABLE}.Category ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.City ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.Country ;;
  }

  dimension: customer_id {
    type: string
    sql: ${TABLE}.Customer_ID ;;
  }

  dimension: customer_name {
    type: string
    sql: ${TABLE}.Customer_Name ;;
  }

  dimension: discount {
    type: number
    sql: ${TABLE}.Discount ;;
  }

  dimension_group: order {
    type: time
    # timeframes: [
    #   raw,
    #   date,
    #   week,
    #   month,
    #   quarter,
    #   year
    # ]
    # convert_tz: no
    # datatype: date
    sql: ${TABLE}.Order_Date ;;
  }
#######1.Creating a year dimension#####
  dimension:Year{
    type: string
    sql: CAST(${order_year} AS STRING) ;;
  }
#######2.Creating a filter for the year dimension#####
  filter:Year_filter {
    type: string
    suggest_explore: sample_superstore
    suggest_dimension: sample_superstore.Year
  }
#######3.Creating a dimension with type yes/no to make the filter interact####
  dimension: test_YOY {
    type: yesno
    sql:  CAST((EXTRACT(YEAR FROM sample_superstore.Order_Date )) AS INT64)+1 <=(SELECT
          DISTINCT CAST((EXTRACT(YEAR FROM sample_superstore.Order_Date )) AS INT64)+1
      FROM `Internal_MA_CHARTER_looker_Project.Sample Superstore` AS sample_superstore
      WHERE true ={% condition Year_filter %} ${Year} {% endcondition %})
      AND
      CAST((EXTRACT(YEAR FROM sample_superstore.Order_Date )) AS INT64) >=(SELECT
          DISTINCT CAST((EXTRACT(YEAR FROM sample_superstore.Order_Date )) AS INT64)-1
      FROM `Internal_MA_CHARTER_looker_Project.Sample Superstore` AS sample_superstore
      WHERE true  ={% condition Year_filter %} ${Year} {% endcondition %});;
  }
##### END OF YOY#####
  dimension: order_id {
    type: string
    sql: ${TABLE}.Order_ID ;;
  }
######Creating a month number dimension#####
  dimension: month_num {
    type: string
    sql: CAST(${order_month_num} AS STRING) ;;
  }
######Creating a month number dynamic filter#####
  filter: month_num_filter {
    type: string
    suggest_explore: sample_superstore
    suggest_dimension: sample_superstore.month_num
  }
#######3.Creating a dimension with type yes/no to make the filter interact####
  dimension: test_MOM {
    type: yesno
    sql: (EXTRACT(MONTH FROM sample_superstore.Order_Date )) <=
      (SELECT DISTINCT (EXTRACT(MONTH FROM sample_superstore.Order_Date )) FROM  `Internal_MA_CHARTER_looker_Project.Sample Superstore` AS sample_superstore
      WHERE true ={% condition month_num_filter %} ${month_num} {% endcondition %})
      AND
       (EXTRACT(MONTH FROM sample_superstore.Order_Date )) >=
      (SELECT DISTINCT CAST((EXTRACT(MONTH FROM sample_superstore.Order_Date )) AS INT64)-1 FROM  `Internal_MA_CHARTER_looker_Project.Sample Superstore` AS sample_superstore
      WHERE  true ={% condition month_num_filter %} ${month_num} {% endcondition %})
      AND
      {% condition Year_filter %} ${Year} {% endcondition %}
      ;;
  }
###### End of MOM######

  dimension: date {
    type: string
    sql: CAST(${order_date} AS STRING) ;;
  }

  filter: Date_filter {
    type: string
    suggest_explore: sample_superstore
    suggest_dimension: sample_superstore.date
  }

  dimension: current_date {
    type: yesno
    sql: (DATE(sample_superstore.Order_Date )) = (SELECT
          DISTINCT (DATE(sample_superstore.Order_Date )) AS sample_superstore_order_date
      FROM `Internal_MA_CHARTER_looker_Project.Sample Superstore`
          AS sample_superstore
      WHERE {% condition Date_filter %} ${date} {% endcondition %}) OR
      (DATE(sample_superstore.Order_Date )) =
      (
      SELECT
          DISTINCT
          CAST(CONCAT(CAST(CAST(EXTRACT(YEAR FROM (DATE(sample_superstore.Order_Date ))) AS INT64)-1 AS STRING),'-',
          CAST(EXTRACT(MONTH FROM (DATE(sample_superstore.Order_Date )))AS STRING),'-',
          CAST(EXTRACT(DAY FROM (DATE(sample_superstore.Order_Date ))) AS STRING) ) AS DATE FORMAT 'YYYY-MM-DD')AS rstore_order_date
      FROM `Internal_MA_CHARTER_looker_Project.Sample Superstore`
           AS sample_superstore
      WHERE {% condition Date_filter %} ${date} {% endcondition %}

      ) ;;
  }


  dimension: postal_code {
    type: zipcode
    sql: ${TABLE}.Postal_Code ;;
  }

  dimension: product_id {
    type: string
    sql: ${TABLE}.Product_ID ;;
  }

  dimension: product_name {
    type: string
    sql: ${TABLE}.Product_Name ;;
  }

  measure: profit {
    type: sum
    sql: ${TABLE}.Profit ;;
  }

  measure:: quantity {
    type: sum
    sql: ${TABLE}.Quantity ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}.Region ;;
  }

  dimension: row_id {
    type: number
    sql: ${TABLE}.Row_ID ;;
  }

  measure: sales {
    type: sum
    sql: ${TABLE}.Sales ;;
  }

  dimension: segment {
    type: string
    sql: ${TABLE}.Segment ;;
  }

  dimension_group: ship {
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
    datatype: date
    sql: ${TABLE}.Ship_Date ;;
  }
  dimension: order_month1 {
    type: string
    sql: CAST(${order_month} AS STRING) ;;
    html: {% if value == ship_month1._value %}
          <p style="background-color:powderblue; font-size: 100%">{{ rendered_value }}</p>
          {% else %}
          <p style="background-color:Tomato; font-size:100%">{{ rendered_value }}</p>
          {% endif %} ;;
  }
  dimension: ship_month1 {
    type: string
    sql: CAST(${ship_month} AS STRING) ;;
    html:{% if value == order_month1._value %}
         <p style="background-color:powderblue; font-size: 100%">{{ rendered_value }}</p>
          {% else %}
          <p style="background-color:Tomato; font-size:100%">{{ rendered_value }}</p>
         {% endif %} ;;
  }
  measure: product_id1 {
    type: string
    sql: ${city} ;;
    required_fields: [city]
    drill_fields: [customer_name, product_name]
    link: {
      label: "Drill into {{value}}"
      url: "{% if sample_superstore.city._value == 'Akron' %}
      {{link}}&fields=sample_superstore.Akron*&toggle=dat,pik,vis&limit=5000
      {% elsif sample_superstore.city._value == 'Lawrence' %}
      {{link}}&fields=sample_superstore.Lawrence*&toggle=dat,pik,vis&limit=5000
      {% else %}
      {{link}}&fields=sample_superstore.empty*
      {% endif %}"
    }
  }
  set: empty {
    fields: []
  }
  set: Akron {
    fields: [product_name,product_id,city]
  }
  set: Lawrence {
    fields: [product_name,product_id]
  }
  dimension: ship_mode {
    type: string
    sql: ${TABLE}.Ship_Mode ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.State ;;
  }

  dimension: sub_category {
    type: string
    sql: ${TABLE}.Sub_Category ;;
  }

  measure: count {
    type: count
    drill_fields: [customer_name, product_name,ship_year,count]
    link: {

      label: "Show as line plot" #or your label of choice
      url: "
      {{ link }}fields=sample_superstore.ship_year,sample_superstore.product_name,sample_superstore.count&sorts=sample_superstore.count desc&limit=5000"
    }
  }
  measure: average_sales {
    type: average
    sql: ${TABLE}.Sales;;
  }
}
