// Importa os módulos necessários
const express = require('express');
const mysql = require('mysql2/promise');

// Configuração do servidor e banco de dados
const app = express();
const port = 3000;
app.use(express.json());

// Conexão com o banco de dados
// ter em conta o docker se estiver a utilizar as imagens / containers
const db = mysql.createPool({
    host: 'localhost',
    user: 'root', // Altere conforme necessário root 
    password: 'root', // Altere conforme necessário
    database: 'ipo'
});

// Rota para verificar se está ok !
app.post('/', async (req, res) => {
    try {
        res.json({ msg: 'OK'});
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});




// Rota para obter todas as marcas
app.get('/marcas', async (req, res) => {
    try {
        const [rows] = 
        await db.query('SELECT * FROM marca ORDER BY marca asc;');
        res.json(rows);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});


// Rota para obter uma MARCA por codmarca
app.get('/marcas/:cod', async (req, res) => {
    try {
        const sql = 'SELECT * FROM marca WHERE codmarca = ?';
        const [rows] = await db.query(sql, [req.params.cod]);
        if (rows.length === 0) {
            return res.status(404).
                    json({ error: 'Marca não encontrada' });
        }
        res.json(rows[0]);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});


// Rota para criar uma nova marca
app.post('/marcas/inserir', async (req, res) => {
    try {
        const { marca } = req.body;
        const sql = 'INSERT INTO marca (marca) VALUES (?)';
        const [result] = await db.query(sql, [marca]);
        res.json({ id: result.insertId, marca });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

// Rota para eliminar marca
app.post('/marca/eliminar/:cod', async (req, res) => {
    try {
        const sql  = 'DELETE FROM marca WHERE codmarca = ?';
        const [result] = await db.query(sql, [req.params.cod]);
        if (result.affectedRows === 0) {
            return res.status(404).json({ error: 'Marca não encontrada' });
        }
        res.json({ message: 'Marca eliminada com sucesso' });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});









// Rota para obter X:limit clientes a partir de Y:ofsset regitos ordenados por nome aSC
app.get('/clientes/:offset/:limit', async (req, res) => {
    try {
        const [rows] = 
        await db.query('SELECT * FROM cliente ORDER BY nome asc LIMIT ?,?;', 
                [Number(req.params.offset), Number(req.params.limit)]);
        res.json(rows);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

// Rota para criar um novo cliente
app.post('/cliente/inserir', async (req, res) => {
    try {
        const { nome, morada, nif } = req.body;
        const sql = 'INSERT INTO cliente (nome, morada, nif) VALUES (?, ?, ?)';
        const [result] = await db.query(sql, [nome, morada, nif]);
        res.json({ id: result.insertId, nome, morada, nif });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

// Rota para eliminar cliente
app.post('/cliente/eliminar/:cod', async (req, res) => {
    try {
        const sql  = 'DELETE FROM cliente WHERE codcli = ?';
        const [result] = await db.query(sql, [req.params.cod]);
        if (result.affectedRows === 0) {
            return res.status(404).json({ error: 'Cliente não encontrado' });
        }
        res.json({ message: 'Cliente eliminado com sucesso' });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});




 
// Rota para obter todas as lojas
app.get('/lojas', async (req, res) => {
    try {
        const [rows] = 
        await db.query('SELECT * FROM lojas ORDER BY nome asc;');
        res.json(rows);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

// Rota para obter uma lojas por stamp
app.get('/loja/:cod', async (req, res) => {
    try {
        const sql = 'SELECT * FROM lojas WHERE stamp = ?';
        const [rows] = await db.query(sql, [req.params.cod]);
        if (rows.length === 0) {
            return res.status(404).
                    json({ error: 'Loja não encontrada' });
        }
        res.json(rows[0]);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
}); 

// Rota para criar um novo loja
app.post('/loja/inserir', async (req, res) => {
    try {
        const { nome, local, telefone, email, website } = req.body;
        const sql = 'INSERT INTO lojas (nome, local, telefone, email, website) VALUES (?, ?, ?, ?, ?)';
        const [result] = await db.query(sql, [nome, local, telefone, email, website]);
        res.json({ id: result.insertId, nome, local, telefone, email, website });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

// Rota para editar um novo loja
app.post('/loja/editar/:cod', async (req, res) => {
    try {
        const { nome, local, telefone, email, website } = req.body;
        const sql = 'UPDATE lojas SET nome = ?, local = ?, telefone = ?, email = ?, website = ? WHERE stamp = ?';
        const [result] = await db.query(sql, [nome, local, telefone, email, website, req.params.cod]);
        res.json({ id: result.insertId, nome, local, telefone, email, website });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

// Rota para eliminar loja
app.post('/loja/eliminar/:cod', async (req, res) => {
    try {
        const sql  = 'DELETE FROM lojas WHERE stamp = ?';
        const [result] = await db.query(sql, [req.params.cod]);
        if (result.affectedRows === 0) {
            return res.status(404).json({ error: 'Loja não encontrada' });
        }
        res.json({ message: 'Loja eliminado com sucesso' });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});






// Rota para obter todas as empregados
app.get('/empregados', async (req, res) => {
    try {
        const [rows] = 
        await db.query('SELECT * FROM empregados ORDER BY nome asc;');
        res.json(rows);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

// Rota para obter uma empregados por id
app.get('/empregados/:cod', async (req, res) => {
    try {
        const sql = 'SELECT * FROM empregados WHERE id = ?';
        const [rows] = await db.query(sql, [req.params.cod]);
        if (rows.length === 0) {
            return res.status(404).
                    json({ error: 'Empregados não encontrada' });
        }
        res.json(rows[0]);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

// Rota para criar um novo empregados
app.post('/empregados/inserir', async (req, res) => {
    try {
        const { idloja, nome, funcao, email} = req.body;
        const sql = 'INSERT INTO empregados (idloja, nome, funcao, email) VALUES (?, ?, ?, ?)';
        const [result] = await db.query(sql, [idloja, nome, funcao, email]);
        res.json({ id: result.insertId, idloja, nome, funcao, email});
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

// Rota para criar um novo empregados
app.post('/empregados/editar/:cod', async (req, res) => {
    try {
        const { idloja, nome, funcao, email} = req.body;
        const sql = 'UPDATE empregados SET idloja = ?, nome = ?, funcao = ?, email = ? WHERE id = ?';
        const [result] = await db.query(sql, [idloja, nome, funcao, email, req.params.cod]);
        res.json({ id: result.insertId, idloja, nome, funcao, email});
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});


// Rota para eliminar loja
app.post('/empregados/eliminar/:cod', async (req, res) => {
    try {
        const sql  = 'DELETE FROM empregados WHERE id = ?';
        const [result] = await db.query(sql, [req.params.cod]);
        if (result.affectedRows === 0) {
            return res.status(404).json({ error: 'Empregados não encontrada' });
        }
        res.json({ message: 'Empregados eliminado com sucesso' });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});



// Inicia o servidor
app.listen(port, () => {
    console.log(`Servidor rodando em http://localhost:${port}`);
});

// node app.js



