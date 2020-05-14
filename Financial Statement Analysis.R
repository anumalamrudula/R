#Data
revenue <- c(14574.49, 7606.46, 8611.41, 9175.41, 8058.65, 8105.44, 11496.28, 9766.09, 10305.32, 14379.96, 10713.97, 15433.50)
expenses <- c(12051.82, 5695.07, 12319.20, 12089.72, 8658.57, 840.20, 3285.73, 5821.12, 6976.93, 16618.61, 10054.37, 3803.96)

#Calculate Profit as the difference between Revenue and Expenses
profit <- revenue - expenses
profit

#Calculate tax as 30% of Profit and round to 2 decimal points
tax <- round(0.30 * profit, 2)
tax 

#Calculate Profit remaining after tax is deducted
profit.after.tax <- profit - tax
profit.after.tax

#Calculate the Profit Margin as Profit after tax over Revenue
#Round to 2 decimal points, then multiply by 100 to get %
profit.margin <- round(profit.after.tax/ revenue, 2) * 100
profit.margin

#Calculate the Mean Profit After Tax for the 12 months
mean_pat <- mean(profit.after.tax)
mean_pat

#Find the months With Above-Mean Profit After Tax
good.months <- profit.after.tax > mean_pat
good.months

#Bad Months are the opposite of Good Months !
bad.months <- !good.months
bad.months

#The Best Month is where Profit After Tax was equal to the maximum
best.month <- profit.after.tax == max(profit.after.tax)
best.month

#The Worst Month is where Profit After Tax was equal to the minimum
worst.month <- profit.after.tax == min(profit.after.tax)
worst.month

#Convert all calculations to units of One Thousand Dollars
revenue.1000 <- round(revenue / 1000, 0)
expenses.1000 <- round(expenses / 1000, 0)
profit.1000 <- round(profit / 1000)
profit.after.tax.1000 <- round(profit.after.tax / 1000)

#Print Results
revenue.1000
expenses.1000
profit.1000
profit.after.tax.1000
profit.margin
good.months
bad.months
best.month
worst.month

#Convert to a Matrix
M <- rbind(
  revenue.1000,
  expenses.1000,
  profit.1000,
  profit.after.tax.1000,
  profit.margin,
  good.months,
  bad.months,
  best.month,
  worst.month
)

#Print The Matrix
M

