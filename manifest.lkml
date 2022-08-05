project_name: "channel_analytics"


# Using existing java code from looker market place_SN

constant: VIS_LABEL {
  value: "Gauge Akili"
  export: override_optional
}

constant: VIS_ID {
  value: "gauge-marketplace akili"
  export:  override_optional
}

visualization: {
  id: "@{VIS_ID}"
  url: "https://marketplace-api.looker.com/viz-dist/gauge_chart.js"
  label: "@{VIS_LABEL}"
}

# Using custom java code (js) file for custom visualization_SN

visualization: {
  id: "CustomAreaVisualization"
  label: "treemap"
  file: "custom.js"
}

visualization: {
  id: "GCPVisualization"
  label: "Line"
  file: "GCP.js"
}

visualization: {
  id: "Report table visualization"
  label: "Report"
  file: "report.js"
}
