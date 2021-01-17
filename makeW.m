function W = makeW(k,n)

X = 1:k;
X=vander(X);
X = X(:,end-n:end);
W = (X'*X)\X';

end