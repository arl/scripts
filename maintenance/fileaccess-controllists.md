
i want a certain folder (called public) to be read-write-execute accessible for 2 users
but i dont want that u1 accesses other files owned by u2 and vice-versa
u1 and u2 are supposed to add files/folders to 'public', and everything
added should be directly readable/writable/executable by u1 & u2,
WITHOUT HAVING TO BOTHER WITH PERMISSIONS and OWNERSHIP



1. i add u1 & u2 as members of a new group called g1
2. and i set g1 as groupn owner of 'public', and set rwx perms for group members on it

PROBLEM : if u1 create a file in 'public', file is owned by u1:u1 and it won't be accessible to u2

so i need that everything created under 'public' to be automatically created with the same group ownership as public

==> that is the role of the setgid flag on the permission mask

and i need to automatically set the r and w permissions on newly created files under public
==> that is the role of setfacl
	example : setfacl -d -m group:g1:rwx public

	-m -> modify the ACL
	-d -> apply to the default ACL (access-control-list)
	everything under public is created with g1 as group and rwx rights for group memebers



<<group-owned>> by g1 and have some default
permissions : rw by group members





