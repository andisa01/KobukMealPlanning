library(tidyverse)

M <- read_csv("MealPlanning.csv")

# Heading explanations:
# Meal - corresponds to general meal categories for packing in drybags
# Meal_SubCategory - indicates which dinner or meal items go with
# Weight_Category - corresponds to NOLS Cookery meal planning categories
# Item - item name
# Amount - common unit for purchasing
# Weight - in grams
# Weight - in pounds
# Purchasing - where will items be purchased

sum(M$Weight, na.rm = TRUE)/1000*2.2 # Total weight shoudl be ~112 punds including emergency meals

M %>%
  group_by(Weight_category) %>%
  summarise(Weight = sum(Weight, na.rm = TRUE)/1000*2.2) # Rough categories based on NOLS Cookery weight ratios for 2 lbs pppd 

M %>%
  group_by(Purchasing) %>%
  summarise(Weight = sum(Weight, na.rm = TRUE)/1000*2.2) %>%
  filter(Weight > 0) # Some of the food will be purchased and packed in New Haven (NH & Andis). Kay will pack some food and Sam will shop for some in Anchorage. Easy to purchase and messy/heavy items will be purchased in Kotzebue (Kotz).

M %>%
  group_by(Item) %>%
  summarise(Weight = sum(Weight, na.rm = TRUE)/1000*2.2)


