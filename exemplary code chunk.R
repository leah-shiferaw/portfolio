# Leah Shiferaw
# Portfolio: Exemplary Code Chunk


weapon_counts = df2 |>
  count(date_year, weapon_txt) |>
  arrange(date_year, desc(n)) |>
  group_by(date_year) |>
  slice_head(n = 5) |>
  ungroup()

selected_weapons = c("Car bomb", "Belt bomb", "Truck bomb", "Unspecified", "Motorcycle bomb")


filtered_df = df2 |>
  filter(weapon_txt %in% selected_weapons)

weapon_counts = filtered_df |>
  count(date_year, weapon_txt) |>
  arrange(date_year, desc(n)) |>
  group_by(date_year) |>
  slice_head(n = 5) |>
  ungroup()

plot3 = ggplot(top_weapons, aes(x = reorder(weapon_txt, n), y = n, fill = weapon_txt)) +
  geom_bar(stat = "identity") +
  labs(x = "Weapon Type", y = "Count", title = "Top Five Most Frequent Weapon Types") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank())

plot4 = ggplot(weapon_counts, aes(x = date_year, y = n, color = weapon_txt)) +
  geom_line() +
  labs(x = "Year", y = "Count", title = "Top Five Weapons by Year") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank())

combined_plots <- plot3 + plot4
combined_plots

print(ggplot)