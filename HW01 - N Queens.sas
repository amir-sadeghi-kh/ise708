proc optmodel;
   * define set;
   set <num> myset = {1..10};
   var x{myset, myset} binary;

   maximize f = sum{i in 1..10, j in 1..10}x[i,j];

   /* subject to the following constraints */
   con ROW{i in myset}: sum{j in myset}x[i,j] <= 1;
   con COLUMN{j in myset}: sum{i in myset}x[i,j] <= 1;
   con DIAGONAL_1{k in 1..9}: sum{i in 1..(10-k)}x[i,i+k] <= 1;
   con DIAGONAL_2{k in 1..9}: sum{j in 1..(10-k)}x[j+k,j] <= 1;
   con DIAGONAL_3: sum{i in 1..10}x[i,i] <= 1;
   con DIAGONAL_4{m in 2..11}: sum{i in 1..(m-1)}x[i,m-i] <= 1;
   con DIAGONAL_5{m in 11..20}: sum{i in (m-10)..10}x[i,m-i] <= 1;

   solve;

   /* print the optimal solution */
   print x;
