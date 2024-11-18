sqrt_values = sqrt(1:225);

disp(sqrt_values);

fileID = fopen('data91.txt', 'w');
fprintf(fileID, '%f\n', sqrt_values);
fclose(fileID);
