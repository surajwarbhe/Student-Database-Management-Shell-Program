i="y"
while [ $i = "y" ]
do
clear
echo -e  "\t\t\t\t\t|=======================================|"
echo -e  "\t\t\t\t\t|\tSTUDENT DATA MANAGEMENT\t\t|"
echo -e  "\t\t\t\t\t|=======================================|"
echo -e  "\t\t\t\t\t\t1. Create Database "
echo -e  "\t\t\t\t\t\t2. Display Database  "
echo -e  "\t\t\t\t\t\t3. Insert new Record "
echo -e  "\t\t\t\t\t\t4. Delete Record "
echo -e  "\t\t\t\t\t\t5. Modify Record "
echo -e  "\t\t\t\t\t\t6. Search Record "
echo -e  "\t\t\t\t\t\t7. Exit "
echo -e  "\t\t\t\t\t|=======================================|"
echo -e  "\n\t\t\t\t\t\tEnter your Choice :   "

read choice

case $choice in
        1) echo " Enter Roll number of student : "
           read rn
           echo " Enter Name of student : "
           read nm
           echo " Enter marks of English :  "
           read en
           echo " Enter marks of Science :  "
           read sc
           echo " Enter marks of Maths :  "
           read ma
           record=" $rn      $nm       $en       $sc       $ma "
           echo $record > stud_db
           ;;


        2) echo " Showing Database of student..."
           echo " Rollno    Name    English    Science    Maths "
           cat stud_db
           ;;


        3) echo " Enter Roll number of student : "
           read rn
           echo " Enter Name of student : "
           read nm
           echo " Enter marks of English :  "
           read en
           echo " Enter marks of Science :  "
           read sc
           echo " Enter marks of Maths :  "
           read ma
           record="$rn       $nm       $en       $sc       $ma "
           echo $record >> stud_db
           ;;


        4) echo " Enter Roll Number : "
           read rn
           grep ^$rn stud_db
           if [ $? -ne 0 ];
           then
                   echo " Record Not Found ! "
           else
                   grep -v $rn stud_db >> tmp
                   cp tmp stud_db
                   echo " Data deleted successfully !"
           fi
           ;;


        5) echo " Enter Roll Number : "
           read rn1
           grep ^$rn1 stud_db
           if [ $? -ne 0 ];
           then
                   echo " Record Not Found ! "
           else
                   echo " Enter new Roll Number :  "
                   read rn
                   echo " Enter Name of student : "
                   read nm
                   echo " Enter marks of English :  "
                   read en
                   echo " Enter marks of Science :  "
                   read sc
                   echo " Enter marks of Maths :  "
                   read ma
                   record="$rn       $nm       $en       $sc       $ma "
                   var=`grep -n ^$rn1 stud_db | cut -c 1`
                   echo $var
                   var1=`expr $var - 1`
                   head -$var1 stud_db > temp
                   echo $record >> temp
                   var3=`wc -l < stud_db`
                   var2=`expr $var3 - $var `
                   tail -$var2 stud_db >> temp
                   cp temp stud_db
           fi
           ;;


        6) echo " Enter Roll Number : "
           read rn
           grep ^$rn stud_db
           if [ $? -ne 0 ];
           then
                   echo " Record Not Found ! "
           fi
           ;;


        7) ;;


        * ) echo " Enter Right choice !"
        esac

        echo " Do you want to continue ? (y/n)"
        read i
        if [ $i != "y" ]
        then
                exit
        fi
done
