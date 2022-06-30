connection: "dv-looker-poc"

# include all the views
include: "/user_specific_timezone_sg/p_looker_timezone_test.view.lkml"


datagroup: looker_to_bq_shaila_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: looker_to_bq_shaila_default_datagroup

explore: p_looker_timezone_test {}
