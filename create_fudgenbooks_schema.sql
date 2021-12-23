/*
-- un-comment this to drop the objects
DROP TABLE [dbo].[fb_publishers] 
DROP TABLE [dbo].[fb_subjects] 
DROP TABLE [dbo].[fb_bookstore] 
DROP TABLE [dbo].[fb_authors] 
*/

CREATE TABLE [dbo].[fb_authors] (
	[author] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL ,
	[isbn] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[fb_bookstore] (
	[isbn] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL ,
	[title] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CS_AS NULL ,
	[price] [money] NOT NULL,
	[pages] [int] NOT NULL ,
	[pub_id] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[fb_publishers] (
	[pub_id] [int] NOT NULL ,
	[pub_name] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CS_AS NULL ,
	[pub_url] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CS_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[fb_subjects] (
	[subj] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL ,
	[isbn] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL 
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[fb_authors] ADD 
	CONSTRAINT [PK_authors] PRIMARY KEY  CLUSTERED 
	(
		[author],
		[isbn]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[fb_bookstore] ADD 
	CONSTRAINT [PK_bookstore] PRIMARY KEY  CLUSTERED 
	(
		[isbn]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[fb_publishers] ADD 
	CONSTRAINT [PK_publishers] PRIMARY KEY  CLUSTERED 
	(
		[pub_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[fb_subjects] ADD 
	CONSTRAINT [PK_subjects] PRIMARY KEY  CLUSTERED 
	(
		[subj],
		[isbn]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[fb_authors] ADD 
	CONSTRAINT [FK_authors_bookstore] FOREIGN KEY 
	(
		[isbn]
	) REFERENCES [dbo].[fb_bookstore] (
		[isbn]
	)
GO

ALTER TABLE [dbo].[fb_bookstore] ADD 
	CONSTRAINT [FK_bookstore_publishers] FOREIGN KEY 
	(
		[pub_id]
	) REFERENCES [dbo].[fb_publishers] (
		[pub_id]
	)
GO

ALTER TABLE [dbo].[fb_subjects] ADD 
	CONSTRAINT [FK_subjects_bookstore] FOREIGN KEY 
	(
		[isbn]
	) REFERENCES [dbo].[fb_bookstore] (
		[isbn]
	)
GO

