connection: "dv-looker-poc"

include: "/views/*.view.lkml"
include: "/singledate.dashboard.lookml"
include: "/user_specific_timezone_dp/poc_tz.view.lkml"
include: "/looker_actions_dp/employee.view.lkml"
include: "/Conditional_Drill_DP/sample_superstore.view.lkml"

# include all views in the views/ folder in this project




explore: poc_tz {
}

explore: employee {

}

explore: sample_superstore {}
