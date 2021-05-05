library(data.table)

dt = fread("C:/Users/kaany/OneDrive/Desktop/Shopify Intern/2019 Winter Data Science Intern Challenge Data Set - Sheet1.csv")
colnames(dt)

summary(dt$order_amount)

dt[,amount_per_item := order_amount / total_items]

mean(dt$amount_per_item)
hist(dt$amount_per_item)

dt[dt$amount_per_item == 25725,]


# Maybe there is something wrong with shop_id = 78

dt[shop_id==78,]

# drop shop_id=78
dt_ = dt[shop_id!=78,]
summary(dt_$amount_per_item)
hist(dt_$amount_per_item)

dt_[amount_per_item == 352,]
# Maybe there is something wrong with shop_id = 42 as well
# The rest of the data looks normally distributed
dt_f = dt_[shop_id!=42,]
hist(dt_f$amount_per_item)
# Looks a lot better
summary(dt_f$amount_per_item)
