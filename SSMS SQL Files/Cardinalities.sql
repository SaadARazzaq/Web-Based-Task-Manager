IF NOT EXISTS(
	SELECT name FROM sys.databases WHERE name = 'web_task_managerDB'
)
CREATE DATABASE web_task_managerDB;

GO
	-- Switch the context to the web_task_managerDB
	USE web_task_managerDB;
GO

-- Adding Foreign Key Constraints

-- User and Settings
ALTER TABLE Settings
ADD User_ID INT;
GO

ALTER TABLE Settings
ADD CONSTRAINT FK_Settings_User
FOREIGN KEY (User_ID) REFERENCES [User](User_ID);
GO

-- Task and Project
ALTER TABLE Task
ADD Project_ID INT;
GO

ALTER TABLE Task
ADD CONSTRAINT FK_Task_Project
FOREIGN KEY (Project_ID) REFERENCES Project(Project_ID);
GO

-- Meeting and Project
ALTER TABLE Meeting
ALTER COLUMN Project_ID INT NOT NULL;
GO

ALTER TABLE Meeting
ADD CONSTRAINT FK_Meeting_Project
FOREIGN KEY (Project_ID) REFERENCES Project(Project_ID);
GO

-- Department and User (Assuming a user can belong to a single department)
ALTER TABLE [User]
ADD Department_ID INT;
GO

ALTER TABLE [User]
ADD CONSTRAINT FK_User_Department
FOREIGN KEY (Department_ID) REFERENCES Department(Department_ID);
GO

-- Report and User
ALTER TABLE Report
ADD CONSTRAINT FK_Report_User
FOREIGN KEY (User_ID) REFERENCES [User](User_ID);
GO

-- Report and Project
ALTER TABLE Report
ADD CONSTRAINT FK_Report_Project
FOREIGN KEY (Project_ID) REFERENCES Project(Project_ID);
GO

-- Report and Department
ALTER TABLE Report
ADD CONSTRAINT FK_Report_Department
FOREIGN KEY (Department_ID) REFERENCES Department(Department_ID);
GO

-- Notifications and User
ALTER TABLE Notifications
ADD CONSTRAINT FK_Notifications_User
FOREIGN KEY (User_ID) REFERENCES [User](User_ID);
GO

-- Notifications and Task
ALTER TABLE Notifications
ADD CONSTRAINT FK_Notifications_Task
FOREIGN KEY (Task_ID) REFERENCES Task(Task_ID);
GO

-- Comments and User
ALTER TABLE Comments
ADD CONSTRAINT FK_Comments_User
FOREIGN KEY (User_ID) REFERENCES [User](User_ID);
GO

-- Comments and Task
ALTER TABLE Comments
ADD CONSTRAINT FK_Comments_Task
FOREIGN KEY (Task_ID) REFERENCES Task(Task_ID);
GO

-- Dashboard and User (Assuming a user can have a single dashboard)
ALTER TABLE Dashboard
ADD User_ID INT;
GO

ALTER TABLE Dashboard
ADD CONSTRAINT FK_Dashboard_User
FOREIGN KEY (User_ID) REFERENCES [User](User_ID);
GO

-- Checklist and Task
ALTER TABLE Checklist
ADD Task_ID INT;
GO

ALTER TABLE Checklist
ADD CONSTRAINT FK_Checklist_Task
FOREIGN KEY (Task_ID) REFERENCES Task(Task_ID);
GO

-- TimeTracker and User
ALTER TABLE TimeTracker
ADD CONSTRAINT FK_TimeTracker_User
FOREIGN KEY (User_ID) REFERENCES [User](User_ID);
GO

-- TimeTracker and Task
ALTER TABLE TimeTracker
ADD CONSTRAINT FK_TimeTracker_Task
FOREIGN KEY (Task_ID) REFERENCES Task(Task_ID);
GO

-- SearchFilter and User (Assuming a user can have multiple search filters)
ALTER TABLE SearchFilter
ADD User_ID INT;
GO

ALTER TABLE SearchFilter
ADD CONSTRAINT FK_SearchFilter_User
FOREIGN KEY (User_ID) REFERENCES [User](User_ID);
GO

-- Adding User_ID in Task Assignment
ALTER TABLE [Task Assignment]
ADD User_ID INT;
GO

-- Adding foreign key constraint for User_ID in Task Assignment
ALTER TABLE [Task Assignment]
ADD CONSTRAINT FK_TaskAssignment_User
FOREIGN KEY (User_ID) REFERENCES [User](User_ID);
GO

-- Adding Task_ID in Task Assignment
ALTER TABLE [Task Assignment]
ADD CONSTRAINT FK_TaskAssignment_Task
FOREIGN KEY (Task_ID) REFERENCES Task(Task_ID);
GO

-- Adding User_ID in Task Members
ALTER TABLE [Task Members]
ADD User_ID INT;
GO

-- Adding foreign key constraint for User_ID in Task Members
ALTER TABLE [Task Members]
ADD CONSTRAINT FK_TaskMembers_User
FOREIGN KEY (User_ID) REFERENCES [User](User_ID);
GO
