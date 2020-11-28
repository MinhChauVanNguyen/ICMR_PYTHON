library(gt)
library(tidyverse)
library(dplyr)

dt <- data.frame(ID = 1:9,
                 Features = c("Heart_rhythm",
                              "bandelet", "DEATH2", "Ring_group",
                              "infection", "Kidney_failure", "Heart_failure", "paps1", "paps2"),
                 Definition = c( "Abnomal heart rhythm - Sinus arrthymia, Atrial fibrillation",
                                "bandelet - Yes for band, No for without band",
                                "Perioperative mortality", "Ring size - <26mm, >=26mm & None for without ring",
                                "Infection - Yes, No", "Failure of kidney - Yes, No", "Failure of heart - Yes, No", 
                                "Pre-operative systolic pulmonary artery pressure", "Post-operative systolic pulmonary artery pressure"),
                 ID = 10:18,
                 Features = c("GRADMIT1", "GRADMIT2", "tventil", "ticu", "thospit",
                              "fe2", "dvg1", "im2", "imtype2"),
                 Definition = c("Gradient transmitral in systolic cycle - measured in mm Hg", 
                                "Mean gradient transmitral - measured in mm Hg",
                                "Mechanical ventilation time - in hours", 
                                "Intensive care - in days", 
                                "Length of stay after operation - in days", 
                                "ejection fraction - in %", 
                                "LV end-diastolic diameter - in mm", 
                                "Severity of MR -  1=mild, 2=mild to moderate, 3=moderate to severe, 4=severe",
                                "Functional mitral valve regurgitation"))
                  

tab1 <- dt %>%
  gt() %>%
  tab_header(
    title = "Under 18-years-old patients with mitral valve diseases data",
    subtitle = "Medical terms abbreviation and definition"
  ) %>%
  tab_style(
    style = cell_text(color = "dodgerblue"),
    locations = cells_body(
      columns = vars(Features.1),
      rows = Features.1 %in% c("im2", "imtype2"))
  ) %>%
  cols_width(
    vars(Definition, Definition.1) ~ px(300)
  ) %>%
  cols_label(
    ID = " ",
    Features = "Features",
    Definition = "Description",
    ID.1 = " ",
    Features.1 = "Features",
    Definition.1 = "Description"
  ) %>%
  tab_options(heading.background.color = "lavender",
              column_labels.font.weight = "bold",
              table.font.names = "Helvetica") %>%
  tab_style(
    style = cell_text(color = "dodgerblue"),
    locations = cells_body(
      columns = vars(Features),
      rows = Features %in% c("infection", "Kidney_failure", "Heart_failure", "paps1"))
  ) %>%
  tab_source_note(
    source_note = "Features in blue are events occurring after the surgery."
  )

tab1

tab1 %>% gtsave("tab_1.html")


