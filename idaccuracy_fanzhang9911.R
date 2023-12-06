# 作业3
# 张繁 2023.12.06

#########################################
# Ex1 使用R中的数据读写，文件路径，for循环语句，
# 读入路径“/assignment_idaccuracy/Aminer”总的所有文件，
# 并将数据合并成为一个data.frame输出。
# 要求data.frame中至少要包括论文的doi号，发表年份，杂志，标题；

# 设置工作目录
getwd()
mypath = "/Users/Gary/Documents/dropbox/assignment_idaccuracy/Aminer"
file.exists(mypath) 
setwd(mypath)

# 获取目录下的所有文件名
files <- list.files()

# 初始化一个空的data.frame，用来存储合并后的数据
merged_data <- data.frame()

# 用for循环遍历所有文件
for (file in files) {
  # 读取文件
  data <- read.csv(file, sep = ",", header = TRUE)
  
  # 选取需要的列，假设列名分别是doi, year, journal, title
  data <- data[, c("doi", "年份", "期刊", "标题")]
  
  # 将数据添加到合并后的data.frame中
  merged_data <- rbind(merged_data, data)
}

# 导出合并后的data.frame为一个csv文件
write.csv(merged_data, file = "merged_data.csv", sep = ",", row.names = FALSE)
#########################################


#########################################
# Ex2 使用apply家族函数替代上述步骤中的for循环
# 设置工作目录为“/assignment_idaccuracy/Aminer”
getwd()
mypath = "/Users/Gary/Documents/dropbox/assignment_idaccuracy/Aminer"
file.exists(mypath) 
setwd(mypath)

# 使用lapply函数，对目录下的所有文件读取和选取数据，得到一个列表
data_list <- lapply(list.files(), function(file) {
  # 读取文件
  data <- read.csv(file, sep = ",", header = TRUE)
  
  # 选取需要的列，假设列名分别是doi, year, journal, title
  data[, c("doi", "年份", "期刊", "标题")]
})

# 使用do.call函数，将列表中的数据合并成一个data.frame
merged_data <- do.call(rbind, data_list)

# 导出合并后的data.frame为一个csv文件
write.csv(merged_data, file = "merged_data.csv", sep = ",", row.names = FALSE)
#########################################
