view: user_facts_ndt {
    derived_table: {
      explore_source: order_items {
        column: id { field: users.id }
        column: total_revenue {}
        column: order_item_count {}
      }
    }
    dimension: id {
      type: number
    }
    dimension: total_revenue {
     # value_format: "$#,##0.00"
      type: number
    }
    dimension: order_item_count {
      type: number
    }
    measure: graand_total_revenue{
      type: sum
      sql: ${total_revenue} ;;
    }
  }
