# AS/400 SQL Learning Notes (AS/400 SQL 学习笔记)

## Introduction (简介)
- Briefly explain what AS/400 SQL is and its purpose. (简要说明什么是 AS/400 SQL 及其用途。)

## Common SQL Commands (常用 SQL 命令)
### SELECT (选择)
- **Purpose:** Used to retrieve data from one or more tables. (用途：用于从一个或多个表中检索数据。)
- **Basic Syntax:** (基本语法：)
  ```sql
  SELECT column1, column2, ...
  FROM table_name
  WHERE condition;
  ```
- **Example:** Retrieve all columns for records matching a condition. (示例：检索符合条件的记录的所有列。)
  ```sql
  SELECT *
  FROM MYLIB.MYTABLE
  WHERE STATUS = 'A';
  ```

### INSERT (插入)
- **Purpose:** Used to add new rows of data to a table. (用途：用于向表中添加新的数据行。)
- **Basic Syntax:** (基本语法：)
  ```sql
  INSERT INTO table_name (column1, column2, ...)
  VALUES (value1, value2, ...);
  ```
- **Example:** Add a new record to a table. (示例：向表中添加一条新记录。)
  ```sql
  INSERT INTO MYLIB.MYTABLE (ID, NAME, STATUS)
  VALUES (101, 'New Record', 'A');
  ```

### UPDATE (更新)
- **Purpose:** Used to modify existing records in a table. (用途：用于修改表中的现有记录。)
- **Basic Syntax:** (基本语法：)
  ```sql
  UPDATE table_name
  SET column1 = value1, column2 = value2, ...
  WHERE condition;
  ```
- **Example:** Update the status of a specific record. (示例：更新特定记录的状态。)
  ```sql
  UPDATE MYLIB.MYTABLE
  SET STATUS = 'I'
  WHERE ID = 101;
  ```

### DELETE (删除)
- **Purpose:** Used to remove existing records from a table. (用途：用于从表中删除现有记录。)
- **Basic Syntax:** (基本语法：)
  ```sql
  DELETE FROM table_name
  WHERE condition;
  ```
- **Example:** Delete a specific record. (示例：删除特定记录。)
  ```sql
  DELETE FROM MYLIB.MYTABLE
  WHERE ID = 101;
  ```

## Data Types (数据类型)
- `CHARACTER (CHAR)`: Fixed-length character string. (固定长度字符串。)
- `VARCHAR`: Variable-length character string. (可变长度字符串。)
- `DECIMAL (NUMERIC)`: Packed decimal number. (压缩十进制数。)
- `INTEGER (INT)`: Integer number. (整数。)
- `DATE`: Date value. (日期值。)
- `TIME`: Time value. (时间值。)
- `TIMESTAMP`: Timestamp value (date and time). (时间戳值，包含日期和时间。)

## Functions (函数)
- `COUNT(*)`: Counts the number of rows. (计算行数。)
- `SUM(column_name)`: Calculates the sum of values in a column. (计算列中值的总和。)
- `AVG(column_name)`: Calculates the average of values in a column. (计算列中值的平均值。)
- `MAX(column_name)`: Returns the maximum value in a column. (返回列中的最大值。)
- `MIN(column_name)`: Returns the minimum value in a column. (返回列中的最小值。)
- `SUBSTRING(string, start, length)`: Extracts a substring. (提取子字符串。)
- `CONCAT(string1, string2)`: Concatenates strings. (连接字符串。)
- `YEAR(date_expression)`: Extracts the year from a date. (从日期中提取年份。)

## AS/400 Specific SQL Features (AS/400 特定 SQL 功能)
- Create a placeholder for AS/400 specific features (e.g., journaling, commitment control, DDL differences if any). (为 AS/400 特定功能创建占位符，例如：日志、提交控制、DDL 差异等。)

## Resources (资源)
This section is intended to list helpful resources for learning AS/400 SQL (also known as DB2 for i or IBM i SQL). You can supplement this list with direct links as you find them. (本节旨在列出学习 AS/400 SQL（也称为 DB2 for i 或 IBM i SQL）的有用资源。您可以随时补充直接链接。)

### Official IBM Documentation (IBM 官方文档)
Unfortunately, providing persistent direct links to specific IBM documentation pages can be challenging due to the structure of their website and how it interacts with automated tools. However, you can easily find the necessary documents by following these steps: (遗憾的是，由于 IBM 网站的结构及其与自动化工具的交互方式，提供指向特定 IBM 文档页面的持久直接链接可能具有挑战性。但是，您可以按照以下步骤轻松找到必要的文档：)

1.  **Go to the main IBM Documentation website:** You can usually find this by searching for "IBM Documentation" in your web browser, or by navigating to a general URL like `https://www.ibm.com/docs/en`. (访问 IBM Documentation 主网站：通常可以通过在 Web 浏览器中搜索 “IBM Documentation” 或导航到诸如 `https://www.ibm.com/docs/en` 之类的通用 URL 来找到它。)
2.  **Search for "IBM i":** Once on the IBM Documentation site, use their search functionality to look for "IBM i". (搜索 “IBM i”：进入 IBM Documentation 网站后，使用其搜索功能查找 “IBM i”。)
3.  **Select your IBM i Version:** From the search results, find the documentation relevant to your specific version of IBM i (e.g., 7.3, 7.4, 7.5). (选择您的 IBM i 版本：从搜索结果中，找到与您的特定 IBM i 版本（例如 7.3、7.4、7.5）相关的文档。)
4.  **Locate Key SQL Documents:** Within the documentation for your IBM i version, look for the following key PDF documents or online sections: (查找关键 SQL 文档：在您的 IBM i 版本的文档中，查找以下关键 PDF 文档或在线部分：)
    *   **SQL Reference:** This is the comprehensive guide to SQL syntax, statements, functions, and features available on your system. (SQL 参考：这是有关系统上可用的 SQL 语法、语句、函数和功能的综合指南。)
    *   **SQL Programming:** This guide typically provides more examples, best practices, and information on embedding SQL in programs and using development tools. (SQL 编程：本指南通常提供更多示例、最佳实践以及有关在程序中嵌入 SQL 和使用开发工具的信息。)

These two documents are essential for in-depth AS/400 SQL (DB2 for i) knowledge. Bookmarking them once you find them for your version is highly recommended. (这两份文档对于深入了解 AS/400 SQL (DB2 for i) 至关重要。强烈建议您在找到适合您版本的文档后将其收藏。)

### Online Communities and Forums (在线社区和论坛)
- **Midrange.com:** A long-standing resource with forums where AS/400 and IBM i professionals discuss various topics, including SQL. (一个历史悠久的资源，其中的论坛供 AS/400 和 IBM i 专业人士讨论各种主题，包括 SQL。)
- **Stack Overflow:** Use tags like \`db2-for-i\`, \`as400\`, \`ibm-midrange\` when searching for SQL-related questions and answers. (在搜索与 SQL 相关的问题和答案时，请使用 \`db2-for-i\`、\`as400\`、\`ibm-midrange\` 等标签。)

### Online Tutorials and Articles (在线教程和文章)
- (Add links to any specific tutorials or articles you find helpful here) (在此处添加您认为有用的任何特定教程或文章的链接)
