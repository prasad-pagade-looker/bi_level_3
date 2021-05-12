view: notes {

measure: practice {

  }
}

# When should you use derived tables?
# SPEED: PDT - LookML query runs and stores the output in a table on our database. Far quicker to run against the pre-calculated table.
# Sessionizing data - requires nesting window functions inside window functions.
# Aggregate to different levels (not as relevant anymore) - Looker has a new feature called aggregate tables. A different way to create the same functionality of giving Looker different levels of granularity.

# Types of derived tables
# 1. Ephemeral, built at the time a query is made. If you want to reference it again, it runs it again.
# 2. Persistent, stored within the database after the query is made. Output is stored in the database and the output is persisted.

# Ways to write them
# 1. SQL
# 2. LookML (Native)
# No difference in how you consume/access the information. Only a difference in how the view file itself is built.
