view: product_inventory_analysis {
  derived_table: {
    sql: SELECT
       product_sku AS product_sku
        ,SUM(cost) AS total_cost
      ,SUM(CASE WHEN sold_at is not null THEN cost ELSE NULL END) AS cost_of_goods_sold
      FROM public.inventory_items
      GROUP BY 1
       ;;
  }

  dimension: product_sku {
    type: string
    sql: ${TABLE}.product_sku ;;
    primary_key: yes
  }

  dimension: total_cost {
    type: number
    sql: ${TABLE}.total_cost ;;
    value_format_name: usd
  }

  dimension: cost_of_goods_sold {
    type: number
    sql: ${TABLE}.cost_of_goods_sold ;;
    value_format_name: usd
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: grand_total_cost {
    type: sum
    sql: ${total_cost} ;;
    value_format_name: usd
  }

  measure: grand_total_cost_of_goods_sold {
    type: sum
    sql: ${cost_of_goods_sold} ;;
    value_format_name: usd
  }

  set: detail {
    fields: [product_sku, total_cost, cost_of_goods_sold]
  }
}


