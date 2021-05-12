view: brand_order_facts_ndt {
  derived_table: {
    explore_source: order_items {
      bind_filters: {
        from_field: order_items.created_date
        to_field: order_items.created_date
      }

      column: brand { field: products.brand }
      column: total_revenue {}

      derived_column: rank {
        sql: ROW_NUMBER() OVER( ORDER BY total_revenue DESC);; }
    }

  }

  dimension: brand {
    primary_key: yes
  }

  dimension: brand_rank {
    type: string
    sql: ${brand} || ' - ' || rank ;;
  }

  dimension: brand_rank_top_5 {
    type: yesno
    sql: ${brand_rank} <= 5 ;;
  }

  dimension: brand_rank_grouped {
    type: string
    sql: case when ${brand_rank_top_5} then
          ${brand_rank} || ') ' || ${brand}
          else '6) Other' end ;;
  }

  dimension: total_revenue {}

  dimension: rank {}

  measure: total_sales_price {
    type: sum
    sql: total_revenue ;;
    value_format_name: usd
  }

}
