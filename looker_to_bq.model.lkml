connection: "looker_to_bq"

# include all the views
include: "/views/**/*.view"


datagroup: looker_to_bq_shaila_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: looker_to_bq_shaila_default_datagroup

explore: t_customer {}

explore: mobile_tablet_test {}

explore: p_looker_timezone_test {}
