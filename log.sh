#!/bin/bash

## $1 文件名
## $2 2020-10-5
## 可以筛选web日志文件，找出特定的日期访问IP

if [ ! -e $1 ]
then
  echo "日志文件 $1 不存在"
  exit 1
fi

if [[ ! "$2" =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}$ ]]
then
  echo "日期格式错误"
  echo "eg: search_log  filename  YYYY-MM-DD"
  exit 1
fi

i_year=`echo $2 | awk -F '-' '{print $1}'`
i_array=(Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec)
i_no=`echo $2 | awk -F '-' '{print $2}'`
i_h=`expr $i_no - 1`
i_month=`echo ${i_array["$i_h"]}`
i_date=`echo $2 | awk -F '-' '{print $NF}'`

grep   -E   "\[${i_date}/${i_month}/${i_year}:"   $1
