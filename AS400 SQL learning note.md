# AS/400 SQL learning Notes

## connection method

- TN5250 display emulator(black screen)
- NET Framework Classes(???)
- IBM i Access ODBC
  - ODBC data source administrator (setup DSN)
  - ODBC strings [IBM docs:Connection string keywords](https://www.ibm.com/support/knowledgecenter/ssw_ibm_i_74/rzaik/connectkeywords.htm)

### Possible values

- IBM i Access ODBC Driver
- iSeries Access ODBC Driver
- Client Access ODBC Driver (32-bit)
- OLE DB provider
  - Start > Programs > IBM i Access > Programmer's Toolkit > OLE DB Provider Technical Reference.
  - [IBM i Access OLE DB Support Web site.](http://www.ibm.com/systems/i/software/access/windows/oledb/)
- JDBC
- IBM Navigator for i

## Tools

- Run SQL scripts "C:\Program Files (x86)\IBM\Client Access\Shared\cwbundbs.exe"
- DBeavers EE [DBeaver Community](https://dbeaver.io/) & [Enterprise version](https://dbeaver.com/)

## Relationship

| Type of relationship         | Description                                                                                                                                                                                                                                                                                                                                                              |
| ---------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| One-to-one                   | Both tables can have only one record on each side of the relationship. <Br>Each primary key value relates to none or only one record in the related table. <Br> Most one-to-one relationships are forced by business rules and do not flow naturally from the data. Without such a rule, you can typically combine both tables without breaking any normalization rules. |
| One-to-Many (or Many-to-One) | The primary key table contains only one record that relates to none, one, or many records in the related table.                                                                                                                                                                                                                                                          |
| Many-to-many                 | Each record in both tables can relate to none or any number of records in the other table. These relationships require a third table, called an associate or linking table, because relational systems cannot directly accommodate the relationship.                                                                                                                     |

asazure://chinaeast2.asazure.chinacloudapi.cn/aasabo01cnstg19909
