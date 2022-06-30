connection: "dv-looker-poc"

include: "/views/*.view.lkml"
include: "/singledate.dashboard.lookml"
include: "/dp_user_specific_timezone/poc_tz.view.lkml"
include: "/dp_looker_actions/employee.view.lkml"
include: "/dp_Conditional_Drill/mobile_tablet.view.lkml"

# include all views in the views/ folder in this project




explore: poc_tz {
}

explore: employee {

}
explore: mobile_tablet {}
