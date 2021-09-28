i="y"
while [ $i = "y" ]
do
clear
# MENU
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
        # Create Database
        1) echo -n "Enter name of Database:  "
           read db
           isFound=`ls | grep $db | wc -w`
           if [ $isFound -gt 0 ];
           then
                   echo -e " \n\n\n Database Already Exists ! "
           else
                   touch $db
                   echo -e " \n\n\n Database Created Successfully !\n\n\n "
           fi
           ;;


        # Display all the database Record
        2) echo -e " Enter name of Database : "
           read db
           isFound=`ls | grep $db | wc -w`
           if [ $isFound -gt 0 ];
           then
                   echo -e " Rollno\t\tName\t\tEnglish\t\tScience\t\tMaths\n"
                   cat $db
                   echo -e "\n\n\n\n"
           else
                   echo -e " \n\n\n Database Not Found !\n\n\n "
           fi
           ;;


        # Insertion of new database record
        3) echo -n "Enter name of Database:  "
           read db
           isFound=`ls | grep $db | wc -w`
           if [ $isFound -gt 0 ];
           then
                   echo " Enter Roll number of student: "
                   read rn
                   isRollFound=`cat $db | grep ^$rn | wc -w`
                   if [ $isRollFound -gt 0 ];
                   then
                           echo -e " \n\nRoll Already Exists \n\n "
                   else
                           echo " Enter Name of student : "
                           read nm
                           echo " Enter marks of English :  "
                           read en
                           echo " Enter marks of Science :  "
                           read sc
                           echo " Enter marks of Maths :  "
                           read ma
                           echo -e " $rn\t\t$nm\t\t$en\t\t$sc\t\t$ma " >> $db
                           echo -e " \n\n\nRecord Inserted Succesfully ! \n\n\n"
                   fi
           else
                   echo -e " \n\n\nDatabase Not Found ! \n\n\n"
           fi
           ;;


        # Deletion of Record
        4) echo -n "Enter name of Database:  "
           read db
           isFound=`ls | grep $db | wc -w`
           if [ $isFound -gt 0 ];
           then
                   echo " Enter Roll Number : "
                   read rn
                   isRollFound=`cat $db | grep $rn | wc -w`
                   if [ $isRollFound -gt 0 ]
                   then
                           oldRecord=`cat $db | grep $rn | wc -w`
                           sed -i 's/$oldRecord//g' $db
                           sed -i '/^$oldRecord/d' $db
                           echo -e " \n\n\nRecord deleted successfully ! "
                   else
                           echo -e " \n\n\nRecord Not Found ! \n\n\n"
                   fi
           else
                   echo -e " \n\n\nDatabase Not Found ! \n\n\n"
           fi
           ;;


        # Modify the Record
        5) echo -n "Enter name of Database:  "
           read db
           isFound=`ls | grep $db | wc -w`
           if [ $isFound -gt 0 ];
           then
                   echo " Enter Roll Number : "
                   read rn1
                   isRollFound=`cat $db | grep $rn1 | wc -w`
                   if [ $isRollFound -gt 0 ]
                   then
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
                           modifiedRecord=`echo -e " $rn\t\t$nm\t\t$en\t\t$sc\t\t$ma "`
                           oldRecord=`cat $db | grep ^$rn1`
                           echo -e " \tRollno\t\tName\t\tEnglish\t\tScience\t\tMaths\n "
                           echo -e " OLD RECORD: $oldRecord"
                           echo -e " NEW RECORD: $modifiedRecord"
                           sed -i 's/$oldRecord/$modifiedRecord/g' $db
                           echo -e " \n\n\nRecord Modified successfully ! "
                   else
                           echo -e " \n\n\nRecord Not Found ! \n\n\n"
                   fi
           else
                   echo -e " \n\n\nDatabase Not Found ! \n\n\n"
           fi
           ;;


        # Searching of Record
        6) echo -n "Enter name of Database:  "
           read db
           isFound=`ls | grep $db | wc -w`
           if [ $isFound -gt 0 ];
           then
                   echo " Enter Roll Number : "
                   read rn
                   c=`grep $rn $db`
                   if [ ${#c} -gt 5 ];
                   then
                           echo -e " Rollno\t\tName\t\tEnglish\t\tScience\t\tMaths\n"
                           grep $rn $db
                   else
                           echo -e " \n\n\nRecord Not Found ! "
                   fi
           else
                   echo -e " \n\n\nDatabase Not Found ! \n\n\n"
           fi
           ;;


        # Exit cmd
        # But you need to install figlet software for better thank you look
        # for Yum : "yum install figlet  -y"
        7) clear
           echo -e "\n\n\n\n\n\n\n\n\n\n\n\n\n"
           figlet " T  H  A  N  K  Y  O  U"
           echo -e "\n\n\n\n\n\n\n\n\n\n\n\n\n"
           exit
           ;;


        *) echo " Enter Right choice !"
           esac

        # Do you want tocontinue ?
        echo -e " \n\nDo you want to continue ? (y/n)"
           read i
           if [ $i != "y" ]
           then
                clear
                echo -e "\n\n\n\n\n\n\n\n\n\n\n\n\n"
                figlet " T  H  A  N  K  Y  O  U"
                echo -e "\n\n\n\n\n\n\n\n\n\n\n\n\n"
                exit
        fi

done
