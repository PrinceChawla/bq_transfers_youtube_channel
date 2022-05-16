connection: "dv-looker-poc"

# include all the views
include: "*.view"
include: "/views/*.view"

# include all the dashboards
include: "*.dashboard"

explore: random_data {
  persist_with: default
}

explore: slot_events {
join: slot_details {
  type: left_outer
  relationship: many_to_one
  sql_on: ${slot_details.slot_id}=${slot_events.slot_id} ;;
}

  join: game_details {
    type: left_outer
    relationship: many_to_one
    sql_on: ${game_details.game_id}=${slot_events.game_id} ;;
  }

}

explore: website_performance {}


datagroup: default {
  max_cache_age: "1 hour"
  # sql_trigger: select count(1) from mlconsole-poc.youtube_channel_reports.random_data ;;
}

# access_grant: can_view_random_number {
#   user_attribute: yesnocan_view_random_number
#   allowed_values: ["yes"]
# }

# persist_with: default # if this is added in explore, then only for that explore it will work

explore: random_dt {
  # required_access_grants: [can_view_random_number]
  # persist_with: default

} # for derived table


explore: channel_combined_a2__aa {
  label: "YouTube Channel"
  view_label: "YouTube"

  join: video_annotation_facts {
    view_label: "Annotations"
    relationship: many_to_one

    type: left_outer
    sql_on: ${channel_combined_a2__aa.video_id} = ${video_annotation_facts.video_id} and
      ${channel_combined_a2__aa.date} = ${video_annotation_facts.date};;
      # ${channel_combined_a2_ycr.date} = ${video_annotation_facts.date};;
  }

  join: video_playlist_facts {
    view_label: "Playlist"
    relationship: one_to_many
    type: left_outer
    sql_on: ${video_annotation_facts.date} = ${video_playlist_facts.date}
    and ${video_annotation_facts.video_id} = ${video_playlist_facts.video_id} ;;
  }

  join: video_facts {
    view_label: "YouTube"
    relationship: many_to_one
    type: left_outer
    sql_on: ${channel_combined_a2__aa.video_id} = ${video_facts.video_id} ;;
  }
}

explore: channel_traffic_source_a2__aa {}
