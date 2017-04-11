env1=['LD_LIBRARY_PATH=/usr/local/fsl/5.0.7/lib:/usr/local/dcmtk/3.6.0/lib:',...
'/usr/local/openmpi/1.8.2-gcc/lib:/usr/local/gcc/4.9.1/lib64:',...
 '/usr/local/gcc/4.9.1/lib:/usr/local/mpc/1.0.2/lib:/usr/local/mpfr/3.1.2/lib:',...
 '/usr/local/gmp/6.0.0/lib:/usr/local/virtualgl/2.5.0/lib:/usr/local/java/jdk1.8.0_74/lib'];
system('module load mrtrix3');
[a,b]=system('daris-ls 1008.2.48.11.1.1');
k=strfind(b,':i-');

s=length(k);
for i =1:s-1;
    ses(i)=b(k(i)+85:k(i+1)-6);
end
b(k(s)+85:end)

ii=input('\n which sequeince to check give a number \n');

[a1,b1]=system('daris-get -d ./test 1008.2.48.11.1.1.3');
%k1=strfind(b1,'inflating: ');
%length(k1);

[a2,b2]=system([env1 ' mrinfo ./test']);
[a3,b3]=system([env1 ' mrconvert ./test T1.nii']);

mkdir temp

[a4,b4]=system('fslsplit T1.nii ./temp');

[a5,b5]=system('slicesdir -p ./temp/*.nii.gz');

