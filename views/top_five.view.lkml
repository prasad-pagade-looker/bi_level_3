view: top_five {
# If necessary, uncomment the line below to include explore_source.
# include: "models/bi_level_3.model.lkml"

    derived_table: {
      explore_source: order_items {
        column: brand { field: products.brand }
        column: total_revenue {}
        derived_column: order_rank {
          sql: row_number() OVER( ORDER BY total_revenue DESC) ;;
        }
      }
    }
    dimension: brand {
      label: "(4) Products Brand"
    }
    dimension: total_revenue {
      label: "(1) Orders and Items Total Revenue"
      type: number
    }
    dimension: order_rank {}

    measure: grand_total_revenue {
      type: sum
      sql: ${total_revenue} ;;
      value_format_name: usd
    }
  }
