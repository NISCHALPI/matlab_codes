clear
clc
format long

fprintf("Project 2\nName- Nischal Bhattarai\nCWID:12088410\nClass- MATH-237-004\n")
%% Display and Argument Matrix
fprintf("\nQuestion number 1:\n" )
fprintf("\nThe following equatins are obtained from every node of the figure:\n")
fprintf("\nAt point A: X1 - X4 = 20\nAt point B: X1 - X2 + X3 = 80\nAt point C: X2 - X4= -35\n")
fprintf("\nSince the resulting matrix is not square, we cannot take inverse to solve the system.\nWe have to take these Equations in Argumented matrix to solve the linear system.\n")

Arg= [1,0,0,-1,20;1,-1,1,0,80;0,1,0,-1,-35;]

fprintf("\nThe following matrix is obtained from taking linear system into argument \nmatrix with the last column being the crossponding image of the transfromation.\n")

ArgR= rref(Arg)
fprintf("\nThe following matrix is the reduced row echelon form of the above argument matrix.\n")

%% Solution Space and Minimum Soln
fprintf("\nThe solution space of the system is [x1,x2,x3,x4]=[s1+20,s1-35,25,s1] if s1 is our free variable.\n")
fprintf("\n\nAssuming that the traffic cannot be negative which is equivalent to saying that the path ")
fprintf("is one way, the mininmun amount of traffic that can flow from C to A is 35. This is because ")
fprintf("if the traffic was any lower the value of X2 will become negative, which menas opposite flow.\n")

%% Question 2 Cryptography
fprintf("\n\n\nQuestion no 2: \n")
 
fprintf("\nQN: 2 Part a\n")
fprintf("\nThe Encoding matrix is given by A:\n") 

B=[1,-3,1,-2;2,-5,4,-2;-3,9,-2,5;4,-12,4,-7;]

dim= length(B);

char='My name is Nischal and I love linear algebra'

fprintf("\nwe have to lower all the message since only the position of letter matters.\n")
char_lower= lower(char)

fprintf("\nThe following list is obtained by transforming the message into number.\n")
[V1, V]= cnv(char ,dim);
V1

fprintf("\nSince we need to make this list a set of 3*1 vectors, we need to match ")
fprintf("up dimensions and add extra 27 in the empty space.\n")
fprintf("\nI created a function that takes our message and returns a list with 27 padded to match up the dimensions.\n")

V

fprintf("\nnow we can use reshape function to make a matrix of the vector.\n")

V_mat=reshape(V,dim,[])

fprintf("\nNow we just need to multiply the matrix with the encoding matrix to\n")
fprintf("obtain the encoded list which is given by:\n\n\n")

Enc= (B*V_mat);
Encoded_rowstr= reshape(Enc,1,[])




%% Decoding

fprintf("\n\nQN 2 Part B\n\n\n")

mm1 = [16, 91, -31, 69, -92, -81, 272, -347, -50, -23, 161, -191, -62, -18, 178, -221,-40, 28, 127, -140, -86, -59, 251, -317, -88, -69, 252, -325];
mm2=[-48, -58, 131, -178, -11, 67, 45, -29, -75, -117, 226, -299, -43, 15, 121, -145,-80, -97, 223, -301, 6, 29, -20, 29, -19, 5, 39, -57, -103, -71, 309, -385];

fprintf("\n\nThe First Decoded Message Would be:\n\n")
decode(mm1, B)

fprintf("\n\nThe Second Decoded Message Would be:\n\n")
decode(mm2, B)


%% Determinant and consequence for Encoding
fprintf("\n\nQuestion no 2 Part c\n\n")
C= [6,2,0,1;3,1,0,2;0,3,2,0;0,0,0,-7]

fprintf("\nUsing cofactor expansion along the last row will give us, -7*2*(6-3*2) = 0\n")
fprintf("It's easy to see why this is the case, because the R1 is 2*R2(same scaled vector)\n\n")

fprintf("Using Det(C) function will give us the result through matlab:\n\n ")

det(C)

fprintf("\nThis matrix cannot be an encoding matrix because it doesn't have a inverse.\n")
fprintf("Moreover, we can see this has a beautiful encoding concept: same encoded message have different decoded messege.\n")
fprintf("This means same coded messege has multiple meaning which violats the principle of encoding.\n")


fprintf("\nConclusion: I see why a singular matrix cannot be used for encoding. The process of encoding is pretty intresting.\nI wonder if this could be done with a changing matrix whose value depends on the vector it transforms- non-linear mapping.\nIt sure will make the process of decoding harder since our matrix is not a constant matrix.\n ")

fprintf("\nI attest that this work is completly mine and I havent copied any one else's work.\nSIGN: NB     DATE:  3/14/2022 \n")




%% Function Creatinon linear for alpha and 27 for space
function [list1 , list2] = cnv(char , dim)
V= double(char-96);
c= length(V);
for i= 1:c 
    if V(i)== -64
        V(i)=27;
    end
end
list1=V;
d= dim-mod(c,dim);
f= 27*ones(1,d);
list2=[V,f];
end

%% The decoding function
function dec = decode(Z , B)
C= reshape(Z, length(B),[]);
A= reshape((inv(B)*C),1,[]);
for i= 1: length(A)
    if A(i)==27
        A(i)= -64;
    end
end

A= A+96;

dec = char(A);

end

























