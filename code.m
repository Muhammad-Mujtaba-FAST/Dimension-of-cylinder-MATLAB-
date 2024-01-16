%Dispalying the initial welcome message.
fprintf('WELCOME TO MAD SOFTWARES\n');
fprintf('Muhammad Daniyal - i200402\n');
fprintf('Muhammad Mujtaba - i200649\n');
fprintf('Syed Ammar Hussain Shirazi - i200409\n');
%awaitning action from user to continue.
cont = input('-----------\nPress Enter To Continue: ');

while 1
    syms r real ;
    syms Cdiff ;
    
    %Obtaining the required volume from user.
    Vol = input('Enter your required volume (cm.^3):');
    
    %Checking if value for volume enter is valid.
    if (Vol <=0)
        fprintf('\nVolume must be greater than 0!\n')
        continue;
    end
    
    %Forming equation of height in terms of Volume and radius.
    h = Vol/(pi *(r.^2))  ;
    %Forming the Cost function.
    C = (0.1*( vpa(pi)* (r.^2) )) + ( 0.05 * (2*pi*r*h ) )  ;
    %Taking the derivative of Cost function.
    Cdiff = diff(C);
    %Solving for Derivative of Cost function = 0.
    sol = solve(Cdiff);
    %Assigning radius attained for minimum cost to r.
    r=double(sol);
    %Subsituting value of radius into the equation of height.
    h = double(subs(h,r)) ;
    %Subsituting value of radius into the Cost function.
    Cost = subs(C,r);
    
    %Displaying the final results.
    fprintf('\nDimesion required for minimum cost:\n');
    fprintf(' Radius = %.3f cm\n',r);
    fprintf(' Height = %.3f cm \n',h);
    fprintf('\nCost to create = %.3f $ \n',Cost);
    
    %Asking user if they want a 3D plot.
    plot ='\nWould you like a 3D plot(y/n):';
    x=input(plot,'s');
    if (x=='y')
        disp('Ploting....')    
        %Plotting according to the dimensions for minimum cost.
        [X,Y,Z] = cylinder(r);
        Z = Z*h;
        surf(X,Y,Z)
        xlabel('Radius (cm)')
        zlabel('Height (cm)')
        title('3D Can Plot [MAD Softwares]')
    end
    
    %Asking the user if they want to perform another query.
    another ='\nWould you like to perform another query(y/n):';
    repeat=input(another,'s');
    
    %Performing another query, if user wants.
    if  (repeat=='y')
        fprintf('Loading....\n-----------\n');
        continue;
    %Ending the program ,if user wishes to stop.
    else
        fprintf('\nThank You For Using MAD Softwares :)\n');
        break;
    end

end