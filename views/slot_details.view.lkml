# The name of this view in Looker is "Slot Details"
view: slot_details {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `mlconsole-poc.slots.slot_details`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Area" in Explore.

  dimension: area {
    type: string
    sql: ${TABLE}.area ;;
  }

  dimension: location {
    type: string
    sql: ${TABLE}.location ;;
  }

  dimension: section {
    type: string
    sql: ${TABLE}.section ;;
  }

  dimension: slot_id {
    type: number
    sql: ${TABLE}.slot_id ;;
  }

  dimension: slot_name {
    type: string
    sql: ${TABLE}.slot_name ;;
  }

  measure: count {
    type: count
    drill_fields: [slot_name]
  }
}
