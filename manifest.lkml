project_name: "channel_analytics"

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
