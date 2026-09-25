#!/bin/bash

echo "=================================="
echo "          USER MANAGEMENT         "
echo "=================================="
echo ""

read -p "Enter the username you want to check or create : " TARGET_USER

if id "$TARGET_USER" &>/dev/null; then
      echo "Status: User '$TARGET_USER' already exists"
else 
       echo "Status: user '$TARGET_USER' does not exists"
       read -p "Would you like to create this user? (y/n): " CREATE_CHOICE
       if [ "$CREATE_CHOICE" == "y" ] || [ "$CREATE_CHOICE" == "Y" ];then
           echo "Creating user..."
           sudo useradd -m "$TARGET_USER"
           echo "USER '$TARGET_USER' Created Successfully!"
       else
           echo "Skipping user Creation."
           exit 0
       fi
fi


echo ""
echo "----Group Assignment---"
read -p "Would you like to add the user to group? (y/n): " GROUP_CHOICE

if [ "$GROUP_CHOICE" == "y" ] || [ "GROUP_CHOICE" == "Y" ];then
   read -p "Enter the Group name: " TARGET_GROUP
   
   if grep -q "^$TARGET_GROUP:" /etc/group;then
      echo "Group '$TARGET_GROUP' found. Addinguser..."
      sudo usermod -aG "$TARGET_GROUP" "$TARGET_USER"
   else
      echo "ERROR: GROUP '$TARGET_GROUP' does not exist on this system"
   fi
else 
    echo "Skipping group assignment."
fi

echo ""
echo "User management Complete!"

