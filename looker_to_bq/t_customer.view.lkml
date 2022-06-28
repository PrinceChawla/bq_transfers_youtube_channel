view: t_customer {

  derived_table: {
    sql: select * from looker_db.t_customer tc
      where is_active = 'Yes' and insert_timestamp = (select max(insert_timestamp) from looker_db.t_customer t where t.CustomerID = tc.CustomerID);;
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
    type: number
    # hidden: yes
    sql: ${TABLE}.CustomerID ;;
  }

  dimension: customer_name {
    type: string
    sql: ${TABLE}.CustomerName ;;
  }

  dimension: insert_timestamp {
    type: date_time
    sql: ${TABLE}.insert_timestamp ;;
  }

  dimension: is_active {
    type: yesno
    sql: ${TABLE}.Is_Active ;;
  }

  dimension: action {
    type: string
    sql: "";;
    action: {
      label: "Edit"
      url: "https://us-central1-mlconsole-poc.cloudfunctions.net/l_to_bq_edit"
      param: {
        name: "CustomerID"
        value: "{{customer_id._value}}"
      }
      form_param: {
        name: "CustomerName"
        type: string
        default: "{{customer_name._value}}"
      }
      form_param: {
        name: "City"
        type: string
        default: "{{city._value}}"
      }
      form_param: {
        name: "Country"
        type: string
        default: "{{country._value}}"
      }
    }
    action: {
      label: "Delete"
      url: "https://us-central1-mlconsole-poc.cloudfunctions.net/l_to_bq_delete"
      param: {
        name: "CustomerID"
        value: "{{customer_id._value}}"
      }
      param: {
        name: "CustomerName"
        value: "{{customer_name._value}}"
      }
      param: {
        name: "City"
        value: "{{city._value}}"
      }
      param: {
        name: "Country"
        value: "{{country._value}}"
      }
    }
  }
  dimension: actions {
    type: string
    sql: "Actions" ;;
    action: {
      label: "Insert"
      url: "https://us-central1-mlconsole-poc.cloudfunctions.net/l_to_bq_insert"
      form_param: {
        name: "CustomerID"
        type: string
      }
      form_param: {
        name: "CustomerName"
        type: string
      }
      form_param: {
        name: "City"
        type: string
      }
      form_param: {
        name: "Country"
        type: string
      }
    }
  }
}
