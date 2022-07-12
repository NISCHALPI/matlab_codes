clear 
clc
format long g
fprintf("MATLAB PROJECT 3: \n");
fprintf("Class: MATH 237-004");
fprintf("\nName: Nischal Bhattarai\n");

fprintf("\n\nWe admit that this is our work and we have not consulted any guide or solution manuals.\n\n");



%% Question 1 Part 1
fprintf("Question 1 :\n\n")

fprintf("##Part 1: Finding the characteristic polynomial")
A=[2,-1,0,1,0;-4,3,0,-5,-4;5,-2,3,1,-1;-6,2,0,-4,-2;2,-1,0,1,0]
b=[1;5;-3;2;3]

fprintf("\nc= Poly(A)")
c=poly(A);
c=round(c)

fprintf("\nThe polymnomial in terms of λ is λ^5 -4λ^4-λ^3-16λ^2-12λ\n") 
n=5;

%% Question 1 Part 2
fprintf("\n##Part 2: Checking if 5 is an eigenvalue\n")
val = polyval(c,5);
Question2 =  sprintf("Since the value of the characteristic polynomial at 5 is %f not 0, λ=5 is not an eigenvalue. ", val)

%% Question 1 Part 3
fprintf("\n##Part 3: Finding the roots of characteristic polynomial\n")

fprintf("\n\nUsing the roots(c) command, The roots of c are follows: \n")
rts= round(roots(c))

fprintf("We can check the anwer by simply evalulating det(A-λ*eye(5)) for all λ. Doing that should result in determinant being zero each time.")

%% Question 1 Part 4
fprintf("\n\n\n##Part 4: Finding EigenValue and Eigenvector of the matrix \n")

[V,D]= eigs(A);
V
D= round(D)

fprintf("\n\nThe colums of V represent the respective eigenvector crossponding to their eigenvalue(entrys in diagnonal of D).\nThe diagnol entrys of D represent the eigenvalues of the matrix A. \nYes there is a correlation between the order of column of V and diagonal entry of of D.\nThe nth colunm of V represent the eigenvector crossponding to nth diagonal value(eigenvalue of A) of D.\n")

%% Question 1 Part 5
fprintf("\n\n##Part 5: Solving AX= b and storing the soln in f\n")
f= inv(V)*b

fprintf("This can be achieved just by using this command inv(V) * b.")


%% Question 1 Part 6

fprintf("\n\n\n##Part 6: Evaluating (A^k)*b for K=2, K=5, and K8\n")

z=[(A^2)*b,(A^5)*b,(A^8)*b];
K2=z(:,1);
K5= z(:,2);
K8=z(:,3);

vals = table(K2,K5,K8)



fprintf("\n\n\nEvaluating V*(D)^k *f for K=2, K=5, and K=8\n")
z1= [V*(D^2)*f, V*(D^5)*f, V*(D^8)*f];
K2=round(z1(:,1));
K5= round(z1(:,2));
K8=round(z1(:,3));

vals2 = table(K2,K5,K8)


fprintf("\nThese two calculation are exactly equal because of the diagnonation of A, any power of A can be expreseed as VD^n*inv(V).\nSo, A^k applied to b is same as VD^k*inv(V)*b=  VD^k*f , since f= inv(V)*b.\n\n")

%% Question 2

fprintf("Question 2 :\n\n")
A= [5,1,7,8,18,-4,2;5,9,-17,8,-38,-60,2;10 ,5 ,5 ,0 ,15 ,35,8;5 ,4 ,-2 ,7 ,-3 ,-21,0;3,1,3,1,8,10,6]


%% Question 2 Part 1

fprintf("\n\n##Part 1: Finding the basis for range of A\n")

fprintf("\nThe easy way to find a basis for range(A) is to row reduce of A.\nThe basis vector would column vector of our original matrix crossponding to the pivot column in our reduced matrix.")

[bsvect, pivtclm]= rref(A);
fprintf("\n\nBy this process the basis fot the range would be: \n")
Rangebasis= A(:, pivtclm) 


%% Question 2 Part 2
fprintf("\n\n##Part 2: Basis for kernal of A\n")

fprintf("\n\nThe easy wayt to find this will be to solve the argumented matrix and finding solution space for homegenuous equation.\n")

Nullspc= null(A, "rational")

fprintf("\nThe span above column vectors represent the null space of A.\n")


%% Question 2 Part 3
fprintf("\n\n##Part 3: Why do the they match up?\n")

fprintf("\n\nThe number of element in basis of column space plus and null space adds to no of column.\nThis is the consequence of the Rank-Nullity theorem.\nRank(dim of column space) + Nullity(dim of null space) = no of column of the matrix.\n")


%% Question 2 Part 4
fprintf("\n\n##Part 4: B= [A,A] and it's properties.\n\n")


fprintf("\nIn case of Range(A):\nSince the colum of V is still the span of the lineary-independent vector of A, The column space will be the same.\nAdding linear- dependent vetors doesn't increase the span.\n")

fprintf("\n\nIn case of Kernal(A):\nIn the case of kernal the no of columns of the B is double the no of column of A.\nSo the Kernal of B must live in higher dimensoin than Kernal if A, if fact exactly twice as big in terms of dimnension.")


%% Question 2 Part 5
fprintf("\n\n\n##Part 5: Orth and Null command\n\n")


fprintf("The orthnormal basis for range of A is : \n")
orthnormA= orth(A)
fprintf("The orthnormal basis for null space of A is : \n")
NullA = null(A)


%% Question 2 Part 6
fprintf("\n\n\n##Part 6: Gram-Schimidt process\n\n")

g=[2,-1,4,7;1,0,-2,-2;3,1,3,3;4,2,-2,1;-5,-3,-1,6];


s1= g(:,1);
s2=  g(:,2)- proj(g(:,2), s1);
s3=  g(:,3) - proj(g(:,3),s1)-proj(g(:,3),s2);
s4= g(:,4) - proj(g(:,4),s1)-proj(g(:,4),s2)-proj(g(:,4),s3);

fprintf("\nGram-Schimidt process can be easily done by making a functon which calculates the projection beween two vectors.\nAfter appling Gram-Schimidt proces, the orthnormal set of vector are: \n")
orthnrm = [s1./norm(s1),s2./norm(s2),s3./norm(s3),s4./norm(s4)]


fprintf("\nNow we can use the ortho command to produce orthonormal basis for the vectors.\n")
cmdorth = orth(g) 


fprintf("\nWe can use dot and norm command to show that first two column are orthogonal and norm of coloum 1 is 1.\n\n")

dotC1C2= fix(dot(cmdorth(:,1), cmdorth(:,2)))

normC1= norm(cmdorth(:,1))







function z4= proj(s1,s2) %% Projection Function

dt= dot(s1 ,s2);

nrm= norm(s2).*norm(s2);

z4 = (dt/nrm) * s2;


end
























