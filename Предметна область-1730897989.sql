CREATE DATABASE event;
USE event;

CREATE TABLE IF NOT EXISTS `Event` (
	`event_id` INT NOT NULL AUTO_INCREMENT,
	`event_name` VARCHAR(255) NOT NULL,
	`event_type` VARCHAR(100) NOT NULL,
	`start_date` DATE NOT NULL,
	`end_date` DATE NOT NULL,
	`description` TEXT,
	PRIMARY KEY (`event_id`)
);

CREATE TABLE IF NOT EXISTS `Venue` (
	`venue_id` INT NOT NULL AUTO_INCREMENT,
	`venue_name` VARCHAR(255) NOT NULL,
	`address` VARCHAR(255) NOT NULL,
	`capacity` INT NOT NULL,
	`facilities` TEXT,
	PRIMARY KEY (`venue_id`)
);

CREATE TABLE IF NOT EXISTS `Organizer` (
	`organizer_id` INT NOT NULL AUTO_INCREMENT,
	`organizer_name` VARCHAR(255) NOT NULL,
	`contact_person` VARCHAR(255),
	`phone` VARCHAR(20) NOT NULL,
	`email` VARCHAR(255) NOT NULL,
	PRIMARY KEY (`organizer_id`)
);

CREATE TABLE IF NOT EXISTS `Artist` (
	`artist_id` INT NOT NULL AUTO_INCREMENT,
	`artist_name` VARCHAR(255) NOT NULL,
	`genre` VARCHAR(100),
	`contact_info` VARCHAR(255),
	`event_id` INT NOT NULL,
	`organizer_id` INT NOT NULL,
	PRIMARY KEY (`artist_id`),
	FOREIGN KEY (`event_id`) REFERENCES `Event`(`event_id`),
	FOREIGN KEY (`organizer_id`) REFERENCES `Organizer`(`organizer_id`)
);

CREATE TABLE IF NOT EXISTS `Ticket` (
	`ticket_id` INT NOT NULL AUTO_INCREMENT,
	`event_id` INT NOT NULL,
	`ticket_type` VARCHAR(50) NOT NULL,
	`price` DECIMAL(10, 2) NOT NULL,
	`quantity_available` INT NOT NULL,
	`venue_id` INT NOT NULL,
	PRIMARY KEY (`ticket_id`),
	FOREIGN KEY (`event_id`) REFERENCES `Event`(`event_id`),
	FOREIGN KEY (`venue_id`) REFERENCES `Venue`(`venue_id`)
);

CREATE TABLE IF NOT EXISTS `Attendee` (
	`attendee_id` INT NOT NULL AUTO_INCREMENT,
	`first_name` VARCHAR(100) NOT NULL,
	`last_name` VARCHAR(100) NOT NULL,
	`email` VARCHAR(255) NOT NULL,
	`phone` VARCHAR(20),
	`ticket_id` INT NOT NULL,
	PRIMARY KEY (`attendee_id`),
	FOREIGN KEY (`ticket_id`) REFERENCES `Ticket`(`ticket_id`)
);

CREATE TABLE IF NOT EXISTS `Schedule` (
	`schedule_id` INT NOT NULL AUTO_INCREMENT,
	`event_id` INT NOT NULL,
	`start_time` TIME NOT NULL,
	`end_time` TIME NOT NULL,
	`activity_description` TEXT,
	PRIMARY KEY (`schedule_id`),
	FOREIGN KEY (`event_id`) REFERENCES `Event`(`event_id`)
);
ALTER TABLE `Artist`
ADD COLUMN `organizer_id` INT;
ALTER TABLE `Artist` ADD CONSTRAINT `Artist_fk_event` FOREIGN KEY (`event_id`) REFERENCES `Event`(`event_id`),
ADD CONSTRAINT `Artist_fk_organizer` FOREIGN KEY (`organizer_id`) REFERENCES `Organizer`(`organizer_id`);
ALTER TABLE `Ticket` ADD CONSTRAINT `Ticket_fk_event` FOREIGN KEY (`event_id`) REFERENCES `Event`(`event_id`),
ADD CONSTRAINT `Ticket_fk_venue` FOREIGN KEY (`venue_id`) REFERENCES `Venue`(`venue_id`);
ALTER TABLE `Attendee` ADD CONSTRAINT `Attendee_fk_ticket` FOREIGN KEY (`ticket_id`) REFERENCES `Ticket`(`ticket_id`);
ALTER TABLE `Schedule` ADD CONSTRAINT `Schedule_fk_event` FOREIGN KEY (`event_id`) REFERENCES `Event`(`event_id`);
