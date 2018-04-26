folder = '/Users/macbookpro/Documents/Network_Science_Data/data_preprocessed_matlab';
cd(folder)

pat = 1;
filename = sprintf('s%02d.mat',pat)
data = load(filename, 'data');
data_ind = [];
% All you need to do is to put the matrix of interest (indices of trials)
for i = [1 3 4 10 13 19 23 24 28 30 31 34 35 36 37 39 41 48 50 51 56 57 58 59 60 62 63 65 66 69 73 74 76 80 85 90 91 96 97 99 101 111 113 119 120 122 129 134 137 152 160 161 163 165 166 167 170 174 181 186 187 196 197 201 206 207 211 223 224 225 228 229 230 231 233 236 237 238 240 243 244 245 252 254 257 258 259 261 262 263 266 267 271 272 273 274 277 282 285 289 293 301 304 305 310 314 319 324 333 337 339 346 351 354 360 365 366 368 376 377 386 393 394 395 402 418 419 425 426 432 435 437 439 445 450 451 456 460 461 466 469 473 475 481 483 486 504 506 508 510 513 514 515 516 526 527 528 530 531 533 534 541 542 543 546 547 551 562 565 571 572 573 574 576 581 586 587 589 590 593 594 595 596 609 630 642 647 654 664 670 675 688 693 697 702 706 723 731 737 743 746 750 751 756 759 761 762 772 775 782 786 792 794 795 796 798 801 812 813 816 819 821 822 824 830 832 833 838 842 854 856 858 859 862 863 866 867 869 870 871 877 882 884 891 899 903 904 905 907 908 909 910 911 912 913 914 917 920 926 934 935 936 943 948 953 956 958 959 964 970 972 976 981 984 985 988 989 994 995 997 1001 1004 1012 1017 1020 1022 1024 1028 1029 1031 1032 1033 1034 1036 1038 1039 1040 1043 1045 1046 1048 1050 1051 1052 1055 1057 1061 1062 1065 1066 1076 1077 1078 1079 1082 1083 1087 1092 1094 1095 1097 1098 1102 1105 1107 1108 1110 1114 1115 1117 1120 1122 1124 1126 1129 1130 1133 1137 1140 1141 1146 1148 1151 1153 1167 1173 1174 1177 1179 1192 1194 1196 1197 1200 1201 1205 1207 1220 1234 1238 1239 1242 1243 1244 1248 1256 1260 1262 1266 1269 1275 1276 1277]
    if pat ~= floor(i/40)+1
        disp(data_ind)
        data=data.data(data_ind,1:32,:);
        data2=permute(data,[2,3,1]);
        myfilename2 = sprintf('eeg0%d.mat', pat);
        save(myfilename2,'data2')
        pat = pat+1;
        filename = sprintf('s%02d.mat',pat)
        data = load(filename, 'data');
        data_ind = [];
     end
     data_ind = [data_ind  (mod(i, 40)+1)];
end