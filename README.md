# jtables

## My (really quite rubbish) attempt to add some nice looking and not unacceptably slow tabling to J.

NB. A table is a list of columns
NB. A column is a 2 element list of boxes.
NB.   The first box contains the column name
NB.   The second box contains the column data (a list)

NB. Creation
tabulate
  x:boxed list of column names
  y:boxed list of corresponding column values

NB. Metadata
colNames
  y:table

colData
  y:table

count
  y:table

colIdx
  x:table
  y:boxed column name

NB. Query
selCol
  x:table
  y:boxed column name

selIdxs
  x:table
  y:indices

valCol
  x:table
  y:boxed column name

NB. Append
append
  x:table
  y:boxed lists corresponding to the schema of the table, to be appended to the end

appendTable
  x:table
  y:table with the same schema

NB. Helper
t_arg
  y:table boxed with a column name ie mytable;'mycol'

col_arg
  y:table boxed with a column name


NB. Transform
transValCol
  u:monadic, rank-preserving function
  y:table boxed with a column name

transCol
  u:monadic, rank-preserving function
  y:table boxed with a column name

NB. Delete
delCol
  x:table
  y:boxed column name

delIdxs
  x:table
  y:indices

delColIdxs
  x:table
  y:indices of the columns within the schema

NB. Filter
where
  u:monadic, boolean-returning function
  y:table boxed with a column name

filter
  u:monadic, boolean-returning function
  y:table boxed with a column name

dfilter
  u:monadic, boolean-returning function
  y:table boxed with a column name

NB. Update
updIdxs
  x:table
  y:boxed list of column name, indices to replace and their replacements ie 'mycol';indices;replacements

NB. Presentation
columnate
  y:list

show
  y:table

NB. Lib
system
  y:string to be sent to the operating system for execution

type
  y:j object. 1=bool, 2=char, 4=integer, 8=float

read
  y:boxed absolute file path

getenv
  y:string for environment variable

iread
  y:boxed list of an absolute file path and a 2 element list of an offset and a number of bytes to read

split
  x:delimiter
  y:string

filesize
  y:boxed absolute file path

apply
  x:string containing a named monadic function
  y:arg

readDsv
  x:boxed list of delimiter, column names and column types, where S=string, N=number, X=ignore
  y:absolute file path

To see readDsv in action, type the following after cloning into your ~/j64-{version}-user/projects/ folder:

```
projects_home=:> (<1 1){UserFolders_j_
load projects_home,'/jtables/lib.ijs'
t=:(';';('time';'open';'high';'low';'close';'zeroes');'SNNNNX') readCsv (projects_home,'/jtables/test.csv')
t=:formatDatetime1 transCol t;'datetime'
show t
count t
meanOpen=:(+/ % #) transValCol t;'open'
show (>&meanOpen) filter t;'open'
```
