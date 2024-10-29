CREATE TABLE [Event] (
	[event_id] int IDENTITY(1,1) NOT NULL UNIQUE,
	[event_name] int NOT NULL,
	[event_type] int NOT NULL,
	[start_date] int NOT NULL,
	[end_date] int NOT NULL,
	[description] int NOT NULL,
	PRIMARY KEY ([event_id])
);

CREATE TABLE [Venue] (
	[venue_id] int IDENTITY(1,1) NOT NULL UNIQUE,
	[venue_name] int NOT NULL,
	[address] int NOT NULL,
	[capacity] int NOT NULL,
	[facilities] int NOT NULL,
	[start_time] int NOT NULL,
	PRIMARY KEY ([venue_id])
);

CREATE TABLE [Organizer] (
	[organizer_id] int IDENTITY(1,1) NOT NULL UNIQUE,
	[organizer_name] int NOT NULL,
	[contact_person] int NOT NULL,
	[phone] int NOT NULL,
	[email] int NOT NULL,
	PRIMARY KEY ([organizer_id])
);

CREATE TABLE [Artist] (
	[artist_id] int IDENTITY(1,1) NOT NULL UNIQUE,
	[artist_name] int NOT NULL,
	[genre] int NOT NULL,
	[contact_info] int NOT NULL,
	[event_name] int NOT NULL,
	PRIMARY KEY ([artist_id])
);

CREATE TABLE [Ticket] (
	[ticket_id] int IDENTITY(1,1) NOT NULL UNIQUE,
	[event_name] int NOT NULL,
	[ticket_type] int NOT NULL,
	[price] int NOT NULL,
	[quantity_available] int NOT NULL,
	[venue_name] int NOT NULL,
	PRIMARY KEY ([ticket_id])
);

CREATE TABLE [Attendee] (
	[attendee_id] int IDENTITY(1,1) NOT NULL UNIQUE,
	[first_name] int NOT NULL,
	[last_name] int NOT NULL,
	[email] int NOT NULL,
	[phone] int NOT NULL,
	[ticket_id] int NOT NULL,
	PRIMARY KEY ([attendee_id])
);

CREATE TABLE [Schedule] (
	[schedule_id] int IDENTITY(1,1) NOT NULL UNIQUE,
	[event_id] int NOT NULL,
	[start_time] int NOT NULL,
	[end_time] int NOT NULL,
	[activity_description] int NOT NULL,
	PRIMARY KEY ([schedule_id])
);

ALTER TABLE [Event] ADD CONSTRAINT [Event_fk1] FOREIGN KEY ([event_name]) REFERENCES [Ticket]([event_name]);
ALTER TABLE [Venue] ADD CONSTRAINT [Venue_fk5] FOREIGN KEY ([start_time]) REFERENCES [Schedule]([start_time]);
ALTER TABLE [Organizer] ADD CONSTRAINT [Organizer_fk3] FOREIGN KEY ([phone]) REFERENCES [Artist]([contact_info]);
ALTER TABLE [Artist] ADD CONSTRAINT [Artist_fk4] FOREIGN KEY ([event_name]) REFERENCES [Event]([event_name]);
ALTER TABLE [Ticket] ADD CONSTRAINT [Ticket_fk0] FOREIGN KEY ([ticket_id]) REFERENCES [Attendee]([ticket_id]);

ALTER TABLE [Ticket] ADD CONSTRAINT [Ticket_fk5] FOREIGN KEY ([venue_name]) REFERENCES [Venue]([venue_name]);
ALTER TABLE [Attendee] ADD CONSTRAINT [Attendee_fk3] FOREIGN KEY ([email]) REFERENCES [Organizer]([email]);
ALTER TABLE [Schedule] ADD CONSTRAINT [Schedule_fk0] FOREIGN KEY ([schedule_id]) REFERENCES [Event]([event_id]);