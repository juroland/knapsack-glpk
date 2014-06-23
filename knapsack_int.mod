/* number of items */
param n, integer, >0;

/* items */
set I := 1..n;

/* item profits */
param c{i in I}, integer, >0;

/* item weight */
param w{i in I}, integer, >0;

/* knapsack size */
param capacity, integer, >0;

var x {i in I} integer, >= 0;

maximize total_profit: sum{i in I} c[i]*x[i];

subject to max_weight: sum{i in I} w[i]*x[i] <= capacity;

solve;

# Print the solution
printf "optimum: %i\n", sum {i in I} x[i] * c[i];

for {i in I} printf " %i\n", x[i];
printf "\n";

end;
