view: top_five {
  derived_table: {
    explore_source: order_items {
      column: total_revenue {}
      column: brand { field: products.brand }
      derived_column: order_rank {
        sql:  row_number() OVER ( order by total_revenue desc) ;;
      }
    }
  }
  dimension: total_revenue {
    label: "(1) Orders and Items Total Revenue"
    type: number
  }
  dimension: brand {
    label: "(4) Products Brand"
  }
  dimension: order_rank {}
}
