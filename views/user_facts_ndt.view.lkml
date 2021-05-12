view: user_facts_ndt {
    derived_table: {
      explore_source: order_items {
        column: id { field: users.id }
        column: total_revenue {}
        column: count {}
        derived_column: revenue_per_item {
          sql: total_revenue / count ;;
        }
        # filters: {
        #   field: order_items.created_date
        #   value: "30 days"
        # }
        filters: [order_items.created_date : "90 days"]
      }
    }
    dimension: id {
      label: "(2) Users ID"
      type: number
    }
    dimension: total_revenue {
      label: "(1) Orders and Items Total Revenue"
      type: number
      value_format_name: usd
    }
    dimension: count {
      label: "(1) Orders and Items Count"
      type: number
    }

    measure: graand_total_revenue {
      type: sum
      sql: ${total_revenue} ;;
      value_format_name: usd
    }

  }
