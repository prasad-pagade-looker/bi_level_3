view: user_facts_ndt {

    derived_table: {
      explore_source: order_items {
        column: id { field: users.id }
        column: count {}
        column: total_revenue {}
      }
    }
    dimension: id {
      label: "(2) Users ID"
      type: number
    }
    dimension: count {
      label: "(1) Orders and Items Count"
      type: number
    }
    dimension: total_revenue {
      label: "(1) Orders and Items Total Revenue"
      value_format: "$#,##0.00"
      type: number
    }
  }
