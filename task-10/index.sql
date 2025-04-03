CREATE TABLE Patients (
    PatientID INT PRIMARY KEY,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    DateOfBirth DATE NOT NULL,
    Gender VARCHAR(10),
    PhoneNumber VARCHAR(15),
    Email VARCHAR(255) UNIQUE,
    Address VARCHAR(255),
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UpdatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

----

CREATE TABLE Doctors (
    DoctorID INT PRIMARY KEY,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    Specialty VARCHAR(100),
    PhoneNumber VARCHAR(15),
    Email VARCHAR(255) UNIQUE,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

----

CREATE TABLE Appointments (
    AppointmentID INT PRIMARY KEY,
    PatientID INT NOT NULL,
    DoctorID INT NOT NULL,
    AppointmentDate TIMESTAMP NOT NULL,
    ReasonForVisit VARCHAR(255),
    STATUS VARCHAR(50) DEFAULT 'Scheduled',
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID) ON DELETE CASCADE,
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID) ON DELETE CASCADE
);

----

CREATE TABLE MedicalRecords (
    RecordID INT PRIMARY KEY,
    PatientID INT NOT NULL,
    Diagnosis VARCHAR(255),
    Treatment VARCHAR(255),
    Prescription VARCHAR(255),
    RecordDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID) ON DELETE CASCADE
);

----

INSERT INTO Patients (PatientID, FirstName, LastName, DateOfBirth, Gender, PhoneNumber, Email, Address)
VALUES 
(1, 'Aarav', 'S', '1990-08-15', 'Male', '1234567890', 'aarav@gmail.com', 'New Delhi, India'),
(2, 'Priya', 'P', '1985-05-10', 'Female', '1234567891', 'priya@gmail.com', 'Mumbai, India'),
(3, 'Ravi', 'K', '1978-11-20', 'Male', '1234567892', 'ravi@gmail.com', 'Bangalore, India'),
(4, 'Ananya', 'D', '2003-01-30', 'Female', '1234567893', 'ananya@gmail.com', 'Chennai, India'),
(5, 'Vikram', 'S', '1982-12-25', 'Male', '1234567894', 'vikram@gmail.com', 'Hyderabad, India');

----

INSERT INTO Doctors (DoctorID, FirstName, LastName, Specialty, PhoneNumber, Email)
VALUES 
(101, 'Dr. Rajesh', 'G', 'Cardiologist', '9812222222', 'rajesh@hospital.com'),
(102, 'Dr. Neha', 'V', 'Orthopedist', '9055555551', 'neha@hospital.com'),
(103, 'Dr. Amit', 'B', 'Pediatrician', '8887774444', 'amit@hospital.com'),
(104, 'Dr. Rekha', 'R', 'Dermatologist', '8888888800', 'rekha@hospital.com'),
(105, 'Dr. Vikram', 'S', 'General Practitioner', '333333344', 'vikram@hospital.com');

----

INSERT INTO Appointments (AppointmentID, PatientID, DoctorID, AppointmentDate, ReasonForVisit, STATUS)
VALUES 
(1, 1, 101, '2025-04-10 10:00:00', 'Heart checkup', 'Scheduled'),
(2, 2, 102, '2025-04-12 14:30:00', 'Knee pain', 'Scheduled'),
(3, 3, 103, '2025-04-14 08:00:00', 'Vaccination', 'Scheduled'),
(4, 4, 104, '2025-04-16 09:30:00', 'Skin rash', 'Scheduled'),
(5, 5, 105, '2025-04-18 15:00:00', 'Routine checkup', 'Scheduled');

----

INSERT INTO MedicalRecords (RecordID, PatientID, Diagnosis, Treatment, Prescription, RecordDate)
VALUES 
(1, 1, 'Hypertension', 'Blood pressure management', 'ABC', '2025-04-10 10:30:00'),
(2, 2, 'Osteoarthritis', 'Physical therapy and pain relief', 'DFC', '2025-04-12 15:00:00'),
(3, 3, 'Routine checkup', 'General examination', 'None', '2025-04-14 08:30:00'),
(4, 4, 'Eczema', 'Topical treatment', 'HND cream', '2025-04-16 10:00:00'),
(5, 5, 'Healthy', 'No treatment required', 'None', '2025-04-18 15:30:00');

----

CREATE INDEX idx_appointments_doctor_id ON Appointments(DoctorID);

CREATE INDEX idx_medical_records_patient_id ON MedicalRecords(PatientID);

CREATE INDEX idx_appointments_patient_id ON Appointments(PatientID);

----

DELIMITER $$

CREATE TRIGGER UpdateAppointmentStatus
AFTER UPDATE ON Appointments
FOR EACH ROW
BEGIN
    IF NEW.Status = 'Completed' THEN
        UPDATE Patients
        SET UpdatedAt = NEW.AppointmentDate
        WHERE PatientID = NEW.PatientID;
    END IF;
END $$

DELIMITER ;

----

START TRANSACTION;

SET @LastRecordID = 0;
SET @LastAppointmentID = 0;

SELECT MAX(RecordID) + 1 INTO @LastRecordID FROM MedicalRecords;

SELECT MAX(AppointmentID) + 1 INTO @LastAppointmentID FROM Appointments;

INSERT INTO MedicalRecords (RecordID, PatientID, Diagnosis, Treatment, Prescription, RecordDate)
VALUES (@LastRecordID, 1, 'Flu', 'Rest and hydration', 'Paracetamol', '2025-04-05 10:00:00');

INSERT INTO Appointments (AppointmentID, PatientID, DoctorID, AppointmentDate, ReasonForVisit, STATUS)
VALUES (@LastAppointmentID, 1, 101, '2025-04-07 09:00:00', 'Flu consultation', 'Scheduled');


COMMIT;

ROLLBACK;

----

CREATE VIEW PatientAppointmentDetails AS
SELECT 
    p.PatientID,
    p.FirstName AS PatientFirstName,
    p.LastName AS PatientLastName,
    p.Email AS PatientEmail,
    d.FirstName AS DoctorFirstName,
    d.LastName AS DoctorLastName,
    a.AppointmentDate,
    a.ReasonForVisit,
    a.Status AS AppointmentStatus
FROM 
    Patients p
JOIN 
    Appointments a ON p.PatientID = a.PatientID
JOIN 
    Doctors d ON a.DoctorID = d.DoctorID;

----

SELECT * FROM PatientAppointmentDetails;

----

SHOW INDEX FROM Appointments;
SHOW INDEX FROM MedicalRecords;

----

UPDATE Appointments
SET STATUS = 'Completed'
WHERE AppointmentID = 1;

----

SELECT PatientID, UpdatedAt FROM Patients WHERE PatientID = 1;

----

SELECT * FROM PatientAppointmentDetails WHERE PatientID = 1;