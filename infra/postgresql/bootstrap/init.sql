-- =========================================================
-- PostgreSQL Database Bootstrap Script
-- TODO Platform
-- =========================================================


-- =========================================================
-- Create application role
-- =========================================================
create role todo_platform_user
    with
    login
    password '<replace-with-secure-password>'
    nosuperuser
    nocreatedb
    nocreaterole
    noinherit;


-- =========================================================
-- Create database
-- =========================================================
create database todo_platform
owner todo_platform_user;


-- =========================================================
-- Grant database connection access
-- =========================================================
grant connect
on database todo_platform
to todo_platform_user;


-- =========================================================
-- Connect to database
-- =========================================================
\connect todo_platform;
-- Alternative:
-- \c todo_platform


-- =========================================================
-- Grant schema usage
-- =========================================================
grant usage
on schema public
to todo_platform_user;


-- =========================================================
-- Grant table permissions
-- =========================================================
grant
select,
insert,
update,
delete
on all tables
in schema public
to todo_platform_user;


-- =========================================================
-- Grant sequence permissions
-- =========================================================
grant
    usage,
select
on all sequences
    in schema public
    to todo_platform_user;


-- =========================================================
-- Ensure future tables inherit permissions
-- =========================================================
alter default privileges
in schema public
grant
select,
insert,
update,
delete
on tables
to todo_platform_user;


-- =========================================================
-- Ensure future sequences inherit permissions
-- =========================================================
alter default privileges
in schema public
grant
    usage,
select
on sequences
    to todo_platform_user;


-- =========================================================
-- Allow schema object creation
-- Required for Django migrations
-- =========================================================
grant create
on schema public
to todo_platform_user;


-- =========================================================
-- Configure default schema search path
-- =========================================================
alter role todo_platform_user
set search_path = public;


-- =========================================================
-- Verify configuration
-- =========================================================
select current_database();

select current_user;

show search_path;
