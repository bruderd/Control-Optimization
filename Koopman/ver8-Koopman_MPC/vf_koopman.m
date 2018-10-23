function vf2 = vf_koopman(in1,in2,u1)
%VF_KOOPMAN
%    VF2 = VF_KOOPMAN(IN1,IN2,U1)

%    This function was generated by the Symbolic Math Toolbox version 7.2.
%    23-Oct-2018 16:06:57

ud1 = in2(5,:);
x1 = in1(1,:);
x2 = in1(2,:);
x3 = in1(3,:);
x4 = in1(4,:);
xd1 = in2(1,:);
xd2 = in2(2,:);
xd3 = in2(3,:);
xd4 = in2(4,:);
vf2 = [u1.*(-7.12693165477777e2)+ud1.*6.507353133788783e-2+x1.*7.613689295752644-x2.*1.390468604867512e1+x3.*1.526638226171044+x4.*4.493385003916444e-1-xd1.*7.574935808265917+xd2.*1.389695991242609e1-xd3.*4.049909000823023e-1-xd4.*4.733057480182238e-2+1.822661759977981e-5;u1.*(-3.297683400818449e3)+ud1.*2.361327233963235e-1-x1.*3.608547215881888+x2.*4.641586355105401e1+x3.*2.981189496792176e-2+x4.*7.753443999648191e-1+xd1.*3.607641786182193-xd2.*4.641244770520967e1+xd3.*7.189032956107136e-2-xd4.*6.833216035944776e-1+3.349192185782615e-6;u1.*5.638625686765408e2-ud1.*7.902947517453315e-1-x1.*6.954450998754215e-2+x2.*6.94216206462799e-1+x3.*4.989858205980404e1+x4.*1.261297104005029e-1+xd1.*9.81598526172227e-2-xd2.*7.065217768235091e-1-xd3.*4.994427252148295e1-xd4.*1.314811806423439e-1+3.610010285036047e-6;u1.*(-7.311499210095909e1)-ud1.*5.738021276273774e-1+x1.*2.429764736481179-x2.*1.733147712165769+x3.*2.152451033048615e-1+x4.*4.967959007620988e1-xd1.*2.383075404275136+xd2.*1.697532387044231-xd3.*2.437894768613488e-1-xd4.*4.97088429159819e1-9.569749075417377e-6];