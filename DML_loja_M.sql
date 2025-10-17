USE Loja_M;

INSERT INTO Cliente(Nome)
VALUES
('Ana'),
('Bruno'),
('Carla'),
('Diego');

SELECT * FROM Cliente;

INSERT INTO Produto(Nome, Preco)
VALUES
('Teclado', 150.00),
('Mouse', 80.00),
('Monitor', 900.00),
('Impressora', 600.00),
('Headset', 200.00);

SELECT * FROM Produto;


INSERT INTO Pedido(Data_Horario, ID_Cliente, ID_Produto)
VALUES
('2025-10-07 06:30:00', 1, 1), --Ana comprou um teclado
('2025-10-07 06:30:00', 2, 2), --Bruno Comprou um mouse
('2025-10-07 06:30:00', 2, 3), --Bruno Comprou um monitor
('2025-10-07 06:30:00', 3, 5); --Carla Comprou um headset

--Diego não fez nenhum pedido
--Ninguém comprou a impressora
SELECT * FROM Pedido;

BEGIN TRANSACTION;

INSERT INTO Cliente (Nome) VALUES ('Ana');
UPDATE Produto SET Preco = 200 WHERE ID_Produto = 1;

COMMIT;

BEGIN TRANSACTION;

INSERT INTO Cliente (Nome) VALUES ('Bruno');
UPDATE Produto SET Preco = 999 WHERE ID_Produto = 2;

ROLLBACK;

BEGIN TRANSACTION;

INSERT INTO Cliente (Nome) VALUES ('João');
SAVE TRANSACTION Ponto1;

INSERT INTO Cliente (Nome) VALUES ('João');
ROLLBACK TRANSACTION Ponto1;  -- Volta até o ponto salvo

COMMIT;
GO

SELECT * FROM Cliente;
SELECT * FROM Produto;