connection: "dv-looker-poc"

include: "/views/*.view.lkml"
include: "/singledate.dashboard.lookml"
include: "/user_specific_timezone_dp/poc_tz.view.lkml"

# include all views in the views/ folder in this project




explore: poc_tz {
}
