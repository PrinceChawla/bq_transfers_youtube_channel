# The name of this view in Looker is "Employee"
view: employee {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  derived_table: {
    sql:  SELECT * from `mlconsole-poc.durga_bigquery.employee_final` c
      WHERE   Record_created_at=(SELECT max(Record_created_at) as maxim FROM `mlconsole-poc.durga_bigquery.employee_final` cd
      WHERE c.Id=cd.Id)
      ;;
  }
  drill_fields: [id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.Id ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Age" in Explore.

  dimension: age {
    type: number
    sql: ${TABLE}.Age ;;
    # action: {

    #   label: "Wrong Age?"
    #   url: "https://us-central1-mlconsole-poc.cloudfunctions.net/function-2"

    #   param: {

    #     name: "Id"

    #     value: "{{ id._value }}"

    #   }
    #   param: {

    #     name: "Name"

    #     value: "{{ name._value }}"

    #   }
    #   param: {

    #     name: "Country"

    #     value: "{{ country._value }}"

    #   }
    #   form_param: {
    #     name: "Age"

    #     type: string

    #     label: "Form for entering correct age"

    #     # default: "{{ value }}"

    #     description: "Enter the correct Age"
    #   }
    # }
    # action: {

    #   label: "Want to delete?"
    #   url: "https://us-central1-mlconsole-poc.cloudfunctions.net/Deletion"

    #   param: {

    #     name: "OldPost"

    #     value: "{{ value }}"

    #   }
    #   form_param: {
    #     name: "NewPostCode"

    #     type: string

    #     #label: "Wrong post code?"

    #     default: "{{ value }}"

    #     description: "Enter the age to be deleted"
    #   }
    # }
  }

  dimension: Editdetails {
    type: string
    sql: "1";;
    html: <img src="https://cdn-icons-png.flaticon.com/512/45/45706.png" width="20" height="20"/> ;;
    action: {

      label: "Insert/Update"
      url: "https://us-central1-mlconsole-poc.cloudfunctions.net/function-2"

      form_param: {
        name: "Id"

        type: string

        label: "Enter the Id"

        # default: "{{ value }}"

        description: "Enter the Id"
      }
      form_param: {
        name: "Name"

        type: string

        label: "Enter the name"

        # default: "{{ value }}"

        description: "Enter the Name"
      }
      form_param: {
        name: "Country"

        type: string

        label: "Enter the country"

        # default: "{{ value }}"

        description: "Enter the country"
      }
      form_param: {
        name: "Age"

        type: string

        label: "Enter the age"

        # default: "{{ age._value }}"

        description: "Enter the correct Age"
      }
    }
    action: {

      label: "Delete"
      url: "https://us-central1-mlconsole-poc.cloudfunctions.net/Deletion"

      param: {

        name: "OldPost"

        value: "{{ value }}"

      }
      form_param: {
        name: "NewPostCode"

        type: string

        #label: "Wrong post code?"

        default: "{{ id._value }}"

        description: "Enter the age to be deleted"
      }
    }
  }

  measure: total_age {
    type: sum
    sql: ${age} ;;
  }

  measure: average_age {
    type: average
    sql: ${age} ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.Country ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.Name ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: record_created {
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
    sql: ${TABLE}.Record_created_at ;;
  }
  measure:dash_nav3 {
    view_label: "Session"
    group_label: "Dashboard Navigation "
    label: "Navigation Bar Looker Actions"
    type: string
    sql: "";;
    html:
    <nav style="font-size: 18px; color: #4285F4">
<div style>
    <a style="padding: 5px 15px; border-top: solid 1px #AEC8C1; border-left: solid 1px #AEC8C1; border-right: solid 1px #AEC8C1; border-bottom: solid 1px #AEC8C1; border-radius: 5px 5px 5px 5px;  float: center; line-height: 40px; font-weight: bold; background-color: #ffffff;color: #2AAA8A"  href="https://mediaagility.looker.com/dashboards/426">Conditional Drill</a>

      <a  style="color: #ffffff; padding: 1px 2px; border-top: solid 1px #ffffff border-left: solid 1px #ffffff; border-right: solid 1px #ffffff; border-radius: 5px 5px 0 0; float: center; line-height: 1.1px; font-weight: bold;" href="#home"> </a>

      <a style="padding: 5px 15px; border-top: solid 1px #AEC8C1; border-left: solid 1px #AEC8C1; border-right: solid 1px #AEC8C1; border-bottom: solid 1px #AEC8C1; border-radius: 5px 5px 5px 5px;  float: center; line-height: 40px; font-weight: bold; background-color: #2AAA8A;color: white"  href="https://mediaagility.looker.com/dashboards/427">Looker Actions</a>
      <a  style="color: #ffffff; padding: 1px 2px; border-top: solid 1px #ffffff border-left: solid 1px #ffffff; border-right: solid 1px #ffffff; border-radius: 5px 5px 0 0; float: center; line-height: 1.1px; font-weight: bold;" href="#home"> </a>


      <a style="padding: 5px 15px; border-top: solid 1px #AEC8C1; border-left: solid 1px #AEC8C1; border-right: solid 1px #AEC8C1; border-bottom: solid 1px #AEC8C1; border-radius: 5px 5px 5px 5px;  float: center; line-height: 40px; font-weight: bold; background-color: #ffffff;color: #2AAA8A"  href="https://mediaagility.looker.com/dashboards/424">Visual Drill</a>
      <a  style="color: #ffffff; padding: 1px 2px; border-top: solid 1px #ffffff border-left: solid 1px #ffffff; border-right: solid 1px #ffffff; border-radius: 5px 5px 0 0; float: center; line-height: 1.1px; font-weight: bold;" href="#home"> </a>


      <a style="padding: 5px 15px; border-top: solid 1px #AEC8C1; border-left: solid 1px #AEC8C1; border-right: solid 1px #AEC8C1; border-bottom: solid 1px #AEC8C1; border-radius: 5px 5px 5px 5px;  float: center; line-height: 40px; font-weight: bold; background-color: #ffffff;color:  #2AAA8A"  href="https://mediaagility.looker.com/dashboards/423">Timezone</a>


      </div>;;
  }
  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
