# The name of this view in Looker is "Game Details"
view: game_details {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `mlconsole-poc.slots.game_details`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Game ID" in Explore.

  dimension: game_id {
    type: number
    sql: ${TABLE}.game_id ;;
  }

  dimension: game_name {
    type: string
    sql: ${TABLE}.game_name ;;
  }

  dimension: game_type {
    type: string
    sql: ${TABLE}.game_type ;;
  }

  measure: count {
    type: count
    drill_fields: [game_name]
  }
}
