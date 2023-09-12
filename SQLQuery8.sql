CREATE PROCEDURE Display_Customers
AS
Select CustomerID, CompanyName, ContactName, ContactTitle, Address, Region From Customers
EXECUTE Display_Customers 
EXECUTE xp_fileexist 'c:\myTest.txt'
EXECUTE sys.sp_who 

Create database ToyzUnlimited
use ToyzUnlimited

CREATE TABLE Toys (
ProductCode VARCHAR(5) PRIMARY KEY,
Name VARCHAR(30),
Category VARCHAR(30),
Manufacturer VARCHAR(40),
AgeRange VARCHAR(15),
UnitPrice MONEY,
Netweight INT,
QtyOnHand INT
);

INSERT INTO Toys (ProductCode, Name, Category, Manufacturer, AgeRange, UnitPrice, Netweight, QtyOnHand)
VALUES
('T001', 'Building Blocks', 'Building Toys', 'ToyCo', '3-5 years', 15.99, 500, 30),
('T002', 'Board Game: Chess', 'Board Games', 'GameMasters', '8-12 years', 19.99, 800, 25),
('T003', 'Dollhouse', 'Dolls & Dollhouses', 'PlayTime', '5-8 years', 29.99, 1200, 40),
('T004', 'Remote Control Car', 'Remote Control Toys', 'TechToys', '8-12 years', 34.99, 600, 22),
('T005', 'Puzzle: Animals', 'Puzzles', 'PuzzleLand', '3-5 years', 9.99, 300, 30),
('T006', 'LEGO Set: Space Explorer', 'Building Toys', 'BrickBuilders', '6-10 years', 24.99, 600, 28),
('T007', 'Action Figures Set', 'Action Figures', 'ToyzInc', '5-8 years', 12.99, 400, 35),
('T008', 'Art Supplies Kit', 'Arts & Crafts', 'CreativeArts', '3-5 years', 14.99, 400, 25),
('T009', 'Video Game: Adventure Quest', 'Video Games', 'GameWorld', '12-16 years', 49.99, 800, 20),
('T010', 'Stuffed Animals: Teddy Bear', 'Stuffed Animals', 'CuddleFriends', '3-5 years', 8.99, 200, 22),
('T011', 'Science Experiment Kit', 'Educational Toys', 'ScienceWizards', '8-12 years', 18.99, 500, 27),
('T012', 'Play Kitchen Set', 'Role Play & Pretend Play', 'ImaginationPlay', '3-5 years', 23.99, 1000, 30),
('T013', 'RC Drone: Explorer', 'Remote Control Toys', 'SkyTech', '12-16 years', 59.99, 700, 23),
('T014', 'Musical Instrument Set', 'Musical Instruments', 'MelodyMakers', '3-5 years', 29.99, 800, 32),
('T015', 'Outdoor Sports Set', 'Outdoor Toys', 'ActiveKids', '6-10 years', 35.99, 1200, 40);

--Lệnh tạo Thủ tục lưu trữ có tên là HeavyToys cho phép liệt kê tất cả các loại đồ chơi có trọng lượng lớn hơn 500g.
CREATE PROCEDURE HeavyToys AS
BEGIN
SELECT ProductCode, Name, Netweight
FROM Toys
WHERE Netweight > 500;
END;

--Lệnh tạo Thủ tục lưu trữ có tên là PriceIncreasecho phép tăng giá của tất cả các loại đồ chơi lên thêm 10 đơn vị giá.
CREATE PROCEDURE PriceIncrease AS
BEGIN
UPDATE Toys
SET UnitPrice = UnitPrice + 10;
END;


--lệnh tạo Thủ tục lưu trữ có tên là QtyOnHand làm giảm số lượng đồ chơi còn trong của hàng mỗi thứ 5 đơn vị
CREATE PROCEDURE QtyOnHand AS
BEGIN
UPDATE Toys
SET QtyOnHand = QtyOnHand - 5;
END;

-- Thực thi thủ tục lưu trữ "PriceIncrease" để tăng giá sản phẩm lên 10 đơn vị giá
EXEC PriceIncrease;

-- Thực thi thủ tục lưu trữ "QtyOnHand" để giảm số lượng đồ chơi còn trong cửa hàng mỗi thứ 5 đơn vị
EXEC QtyOnHand;

-- Thực thi Thủ tục lưu trữ có tên là HeavyToys cho phép liệt kê tất cả các loại đồ chơi có trọng lượng lớn hơn 500g.
EXEC HeavyToys;



