# 作业3_封装脚本
# 张繁 2023.12.06

#########################################
# Ex3 将2中代码封装成为一个可以在命令行运行的脚本，
# 脚本的唯一一个参数为aminer论文文件所在的路径。
merge_data <- function(path) {
  # 设置工作目录为指定的路径
  setwd(path)
  
  # 使用lapply函数，对目录下的所有文件读取和选取数据，得到一个列表
  data_list <- lapply(list.files(), function(file) {
    # 读取文件
    data <- read.csv(file, sep = ",", header = TRUE)
    
    # 选取需要的列，假设列名分别是doi, year, journal, title
    data[, c("doi", "年份", "期刊", "标题")]
  })
  
  # 使用do.call函数，将列表中的数据合并成一个data.frame
  merged_data <- do.call(rbind, data_list)
  
  # 输出合并后的data.frame
  print(merged_data)
  
  # 导出合并后的data.frame为一个csv文件
  write.csv(merged_data, file = "merged_data.csv", sep = ",", row.names = FALSE)
}

# 获取命令行参数，假设只有一个参数，即aminer论文文件所在的路径
args <- commandArgs(trailingOnly = TRUE)
path <- args[1]

# 调用merge_data函数，传入路径参数
merge_data(path)
#########################################
