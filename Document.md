# Looker To BQ (SG)

We can insert, edit, delete record from looker dashboard to BigQuery table using action parameter in LookML.
- [LookML](https://mediaagility.cloud.looker.com/projects/channel_analytics/files/looker_to_bq_sg/t_customer.view.lkml)
- [Dashboard](https://mediaagility.cloud.looker.com/dashboards/355)

Below cloud functions are invoked from the dashboard:
- [Cloud Function: Insert](https://console.cloud.google.com/functions/details/us-central1/l_to_bq_insert?env=gen1&project=mlconsole-poc)
- [Cloud Function: Edit](https://console.cloud.google.com/functions/details/us-central1/l_to_bq_edit?env=gen1&project=mlconsole-poc)
- [Cloud Function: Delete](https://console.cloud.google.com/functions/details/us-central1/l_to_bq_delete?env=gen1&project=mlconsole-poc)

References:
- [https://docs.looker.com/reference/field-params/action](https://docs.looker.com/reference/field-params/action)
- [https://community.looker.com/sql-10/update-write-back-data-on-bigquery-from-looks-9408](https://community.looker.com/sql-10/update-write-back-data-on-bigquery-from-looks-9408)

# User Specific Timezone (SG)

We have created user specific looks based on their timezones using parameter.
- [look 1](https://mediaagility.cloud.looker.com/looks/384)
- [look 2](https://mediaagility.cloud.looker.com/looks/385)

References:
- [https://docs.looker.com/reference/field-params/parameter](https://docs.looker.com/reference/field-params/parameter)

# Looker To BQ (DP)

We can insert, edit, delete record from looker dashboard to BigQuery table using action parameter in LookML.
- [Look ML](https://mediaagility.looker.com/projects/channel_analytics/files/dp_looker_actions/employee.view.lkml)
- [Dashboard](https://mediaagility.looker.com/dashboards/427)

# Cloud Functions
- [Insert/Update](https://console.cloud.google.com/functions/edit/us-central1/function-2?env=gen1&project=mlconsole-poc)
- [Delete](https://console.cloud.google.com/functions/edit/us-central1/Deletion?env=gen1&project=mlconsole-poc)

References:
- [https://docs.looker.com/reference/field-params/action](https://docs.looker.com/reference/field-params/action)
- [https://community.looker.com/sql-10/update-write-back-data-on-bigquery-from-looks-9408](https://community.looker.com/sql-10/update-write-back-data-on-bigquery-from-looks-9408)

# User Specific Timezone (DP)

We have implemented the functionality of User specific timezone where in a
user confined to one particular timezone gets to see the data relevant to only that timezone.

- [Look ML](https://mediaagility.looker.com/projects/channel_analytics/files/dp_user_specific_timezone/poc_tz.view.lkml)
- [Dashboard](https://mediaagility.looker.com/dashboards/423?Timezone=America%2FNew%5E_York&Date+Filter=2022-06-07&Check+%28Yes+%2F+No%29=Yes)

References:
- [https://docs.looker.com/reference/field-params/parameter](https://docs.looker.com/reference/field-params/parameter)

# Conditional drilling (DP)

We have worked on implementing the conditional drilling feature where in
as per the value the drills will display the fields.

- [LookML](https://mediaagility.looker.com/projects/channel_analytics/files/dp_Conditional_Drill/mobile_tablet.view.lkml)
- [Dashboard](https://mediaagility.looker.com/dashboards/426)

# Visual Drilling(DP)

We have implemented the visual drilling feature where in on drilling on a particular
value from the visualization we will be able to see another visualization.

- [LookML](https://mediaagility.looker.com/projects/channel_analytics/files/views/media_performance.view.lkml?line=23)
- [Dashboard](https://mediaagility.looker.com/dashboards/424)

# References
- [Community Article](https://community.looker.com/explores-36/how-to-get-visualization-configurations-for-custom-drilling-20761)

# Tabbed Dashboards

We have implemented the functionality of the Tabbed Dashboards where in we would be migrating
between the dashboards while being on the single page.

- [LookML](https://mediaagility.looker.com/projects/channel_analytics/files/dp_Conditional_Drill/mobile_tablet.view.lkml)
- [Dashboards](https://mediaagility.looker.com/dashboards/426)
