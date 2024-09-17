{\rtf1\ansi\ansicpg1251\cocoartf2639
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fmodern\fcharset0 Courier;\f1\fmodern\fcharset0 Courier-Oblique;}
{\colortbl;\red255\green255\blue255;\red195\green123\blue90;\red23\green23\blue26;\red174\green176\blue183;
\red185\green101\blue173;\red38\green157\blue169;\red31\green46\blue49;\red72\green151\blue245;\red89\green158\blue96;
}
{\*\expandedcolortbl;;\csgenericrgb\c76471\c48235\c35294;\csgenericrgb\c9020\c9020\c10196;\csgenericrgb\c68235\c69020\c71765;
\csgenericrgb\c72549\c39608\c67843;\csgenericrgb\c14902\c61569\c66275;\csgenericrgb\c12157\c18039\c19216;\csgenericrgb\c28235\c59216\c96078;\csgenericrgb\c34902\c61961\c37647;
}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx560\tx1120\tx1680\tx2240\tx2800\tx3360\tx3920\tx4480\tx5040\tx5600\tx6160\tx6720\pardirnatural\partightenfactor0

\f0\fs26 \cf2 \cb3 CREATE DATABASE \cf4 LAB1;\
\
\cf2 CREATE TABLE \cf4 users (\
    \cf5 id \cf2 SERIAL\cf4 ,\
    \cf5 firstname \cf2 VARCHAR\cf4 (\cf6 50\cf4 ),\
    \cf5 lastname \cf2 VARCHAR\cf4 (\cf6 50\cf4 )\
);\
\
\cf2 ALTER TABLE \cf4 users\
\cf2 ADD COLUMN \cf5 isadmin \cf2 INTEGER CHECK \cf4 (\cf5 isadmin \cf2 IN \cf4 (\cf6 0\cf4 , \cf6 1\cf4 ));\
\cf2 ALTER TABLE \cf4 users\
\cf2 DROP CONSTRAINT IF EXISTS \cf4 users_isadmin_check;\
\cf2 ALTER TABLE \cf4 users\
\cf2 ALTER COLUMN \cf5 isadmin \cf2 TYPE BOOLEAN\
USING \cf5 isadmin\cf4 ::\cf2 boolean\cf4 ;\
\cf2 ALTER TABLE \cf4 users\
\cf2 ALTER COLUMN \cf5 isadmin \cf2 SET DEFAULT FALSE\cf4 ;\
\cf2 ALTER TABLE \cf4 users\
\cf2 ADD PRIMARY KEY \cf4 (\cf5 id\cf4 );\
\cf2 CREATE TABLE \cf4 tasks (\
    \cf5 id \cf2 SERIAL\cf4 ,\
    \cf5 name \cf2 VARCHAR\cf4 (\cf6 50\cf4 ),\
    \cf5 user_id \cf2 INT\
\cf4 );\
\cf2 DROP TABLE \cf4 tasks;\
\
\cb7 \\\cf2 c \cf4 postgres\cb3 \
\
\cf2 SELECT 
\f1\i \cf8 pg_terminate_backend
\f0\i0 \cf4 (\cf5 pid\cf4 )\
\cf2 FROM \cf4 pg_stat_activity\
\cf2 WHERE \cf5 datname \cf4 = \cf9 'lab1'\cf4 ;\
\
\cf2 DROP DATABASE \cf4 LAB1;\
\
}