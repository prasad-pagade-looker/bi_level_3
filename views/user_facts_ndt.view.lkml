view: user_facts_ndt {
  derived_table: {
    explore_source: order_items {
      column: id { field: users.id }
      column: total_revenue {}
      column: count {}
    }
  }
  dimension: id {
    label: "(2) Users ID"
    type: number
  }
  dimension: total_revenue {
    label: "(1) Orders and Items Total Revenue"
    type: number
  }
  dimension: count {
    label: "(1) Orders and Items Count"
    type: number
  }
}
