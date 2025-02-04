NB. Creation
tabulate=: ,. ,.

NB. Metadata
colNames=:(0&{)"1
colData=:(1&{)"1
count=:#@:>@:((< 0 1)&{)
colIdx=:colNames@:[ i. ]

NB. Query
selCol=:colIdx { colData@:[
selIdxs=:colNames@:[ ,. (({ L:0) colData)~
valCol=:>@:selCol

NB. Append
append=:(colNames@:[ ,. (colData@:[ (, L:0) ]))
appendTable=:append colData

NB. Helper
t_arg=:>@:(0&{)@:]
col_arg=:(1&{)@:]
third_arg=:>@:(2&{)@:]

NB. Transform
transValCol=: @:(>@:(t_arg valCol col_arg))
transCol=: 1 : '(<@:u transValCol y) (< ((t_arg colIdx col_arg) y),1)} (t_arg y)'

NB. Delete
delCol=:(colNames@:[ -. ]) ,. ([ selCol (colNames@:[ -. ]))
delIdxs=:[ selIdxs (i.@:count@:[ -. ])
delColIdxs=:(i.@:#@:[ -. ]) { [

NB. Filter
where=:(I.@:)transValCol
filter=: 1 : '(t_arg y) selIdxs (u where y)'
dfilter=: 1 : '(t_arg y) delIdxs (u where y)'

NB. Update
updIdxs=:4 : 0
  'col idxs replacements'=:y
  (replacements&(idxs})) transCol x;col
)
updWhere=:2 : 0
  getIndxs=:v where
  getFiltered=:t_arg selIdxs getIndxs
  getTransformedVals=:(u transValCol)@:(getFiltered ; third_arg)
  t_arg updIdxs (third_arg ; getIndxs ; getTransformedVals)
)

NB. Presentation
columnate=:((,&1)@:# $ ])`]@.((>&1)@:#@:$)
show=:(colNames ,: (columnate L:0)@:colData)
