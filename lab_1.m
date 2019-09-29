a = 1.3; b = 2.42; c = 0.83; x = 1.5; k = 2;
y = (abs(pow2(a,2)-pow2(b,2))/sin(k*x))+pow2(10,4) * pow2(abs(sin(k*x)-b*c),0.2)-(pow2(k,2) + tan(3*k))/exp(k*x);
vector = [ a b c x k y];
vector_sort = sort(vector);
sra_vector_sort = mean(vector_sort);
vector(3) = vector(3) + sra_vector_sort;

