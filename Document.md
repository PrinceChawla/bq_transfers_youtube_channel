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
