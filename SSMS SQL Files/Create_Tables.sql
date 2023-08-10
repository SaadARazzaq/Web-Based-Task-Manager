IF NOT EXISTS (
    SELECT name FROM sys.databases WHERE name = 'taskManagerDB'
)
CREATE DATABASE taskManagerDB;
GO

-- Switch the context to the taskManagerDB
USE taskManagerDB;
GO

-- Create the Roles table
CREATE TABLE Roles (
    RoleID INT IDENTITY(1,1) PRIMARY KEY,
    RoleName NVARCHAR(100) NOT NULL
);
GO

-- Create the Projects table
CREATE TABLE Projects (
    ProjectID INT IDENTITY(1,1) PRIMARY KEY,
    ProjectName NVARCHAR(100) NOT NULL
);
GO

-- Create the Priorities table
CREATE TABLE Priorities (
    PriorityID INT IDENTITY(1,1) PRIMARY KEY,
    PriorityName NVARCHAR(100) NOT NULL
);
GO

-- Create the Users table
CREATE TABLE Users (
    Email NVARCHAR(100) PRIMARY KEY,
    [Name] NVARCHAR(100) NOT NULL,
    [Password] NVARCHAR(100) NOT NULL,
    RoleID INT NOT NULL,
    CONSTRAINT FK_Users_Roles FOREIGN KEY (RoleID) REFERENCES Roles(RoleID)
);
GO

-- Create the Tasks table
CREATE TABLE Tasks (
    TaskID INT IDENTITY(1,1) PRIMARY KEY,
    TaskName NVARCHAR(100) NOT NULL,
    [Description] NVARCHAR(MAX),
    PriorityID INT NOT NULL,
    ProjectID INT NOT NULL,
    CreatedBy NVARCHAR(100) NOT NULL,
    CreatedOn DATETIME NOT NULL,
    CONSTRAINT FK_Tasks_Priorities FOREIGN KEY (PriorityID) REFERENCES Priorities(PriorityID),
    CONSTRAINT FK_Tasks_Projects FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID),
    CONSTRAINT FK_Tasks_Users FOREIGN KEY (CreatedBy) REFERENCES Users(Email)
);
GO

-- Create the Comments table
CREATE TABLE Comments (
    CommentID INT IDENTITY(1,1) PRIMARY KEY,
    TaskID INT NOT NULL,
    CommentText NVARCHAR(MAX) NOT NULL,
    CommentedBy NVARCHAR(100) NOT NULL,
    CommentedOn DATETIME NOT NULL,
    CONSTRAINT FK_Comments_Tasks FOREIGN KEY (TaskID) REFERENCES Tasks(TaskID),
    CONSTRAINT FK_Comments_Users FOREIGN KEY (CommentedBy) REFERENCES Users(Email)
);
GO

-- Create the Assignment table
CREATE TABLE Assignment (
    AssignmentID INT IDENTITY(1,1) PRIMARY KEY,
    TaskID INT NOT NULL,
    UserID NVARCHAR(100) NOT NULL,
    CONSTRAINT FK_Assignment_Tasks FOREIGN KEY (TaskID) REFERENCES Tasks(TaskID),
    CONSTRAINT FK_Assignment_Users FOREIGN KEY (UserID) REFERENCES Users(Email)
);
GO
