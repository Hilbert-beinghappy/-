matrix = randi(100, 100, 5);

fileID = fopen('data09.dat', 'w');
fwrite(fileID, matrix, 'int32');
fclose(fileID);

fileID = fopen('data09.dat', 'r');
matrix_read = fread(fileID, 100, 'int32');
fclose(fileID);

matrix_reshaped = reshape(matrix_read, 50, 2);

fileID = fopen('data09.txt', 'w');
fprintf(fileID, '%d\t%d\n', matrix_reshaped);
fclose(fileID);