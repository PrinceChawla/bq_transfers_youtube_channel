{
  "dataSets": [
    {
      "legendTemplate": "${resource.labels.project_id}",
      "timeSeriesFilter": {
        "crossSeriesReducer": "REDUCE_SUM",
        "filter": "resource.type=\"global\" AND metric.type=\"bigquery.googleapis.com/query/count\"",
        "groupByFields": [
          "resource.label.project_id"
        ],
        "perSeriesAligner": "ALIGN_MEAN"
      }
    }
  ],
  "options": {
    "mode": "COLOR"
  }
}
