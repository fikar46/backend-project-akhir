const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
var fs = require('fs');
// var { uploader } = require('./helpers/uploader')
var { uploader } = require('./helpers/uploader')
var port = process.env.PORT || 2000;

var app = express({defaultErrorHandler:false});

app.use(cors())
app.use(bodyParser.urlencoded({extended:false}))
app.use(bodyParser.json())
app.use(express.static('public'))
const mysql = require('mysql');
// ----------------- MYSQL CONFIG -----------------------

const conn = mysql.createConnection({
    host:'localhost',
    user:'root',
    password:'fikar123',
    database:'warehousenesia',
    port: 3306
});



app.get('/', (req,res) => {
    // res.send('<h1>Selamat Datang di APIKU!</h1>')
    var sql = 'select * from users'
    conn.query(sql , (err,result) => {
        console.log('masuk Pak Eko0000000')
        // console.log(result)
        res.send(result)
    })
})

app.get('/user' , (req,res) => {
    var sql = 'select * from users'
    conn.query(sql ,(err,result)=>{
        res.send(result)
        // console.log(result)
    })
})

app.get('/usercheck', (req,res) => {
    var username = req.query.username;
    var sql = `select * from users where username = '${username}'`;
    conn.query(sql, (err,result)=> {
        res.send(result)
        // console.log(result.length)
    })
})

app.post('/login' , (req,res) => {
    var username = req.body.username;
    var password = req.body.password;
    var sql = `select * from users where (username = '${username}') and (password = '${password}');`
    conn.query(sql , (err,result) => {
        if (err) throw err;
        if(result !== undefined){
            res.send(result)
        }else{
            res.send('Username atau Password yang anda masukan Salah')
        }
    })
    
})

app.post('/register' , (req,res) => {
    var newUser = {
        username : req.body.username,
        password : req.body.password,
        phone : req.body.phone,
        email : req.body.email
    }
    var sql = 'insert into users set ? ;'
    conn.query(sql,newUser , (err,result)=>{
        if(err) {
            // console.log(err.message)
            // console.log(result)
            return res.status(500).json({ message: "There's an error on the server. Please contact the administrator.", error: err.message });
        }else{
            res.send(result)
        }
        // res.send(result)
    })
})

app.get('/keeplogin' , (req,res)=> {
    var username = req.query.username;
    console.log(username)
    var sql = `select * from users where username = '${username}'`
    conn.query(sql , (err,result) => {
        if(err) throw err
        res.send(result)
        // console.log(result)
    })
})
app.get('/country' , (req,res) => {
    var sql = 'select * from country'
    conn.query(sql ,(err,result)=>{
        res.send(result)
        // console.log(result)
    })
})
app.post('/add-product-image' , (req,res) => {
    var newProductImage = req.body
    var sql = 'insert into gambar_produk set ? ;'
    conn.query(sql,newProductImage , (err,result)=>{
            res.send(result)
    })
})
app.post('/add-product' , (req,res) => {
    var newProduct = req.body
    var sql = 'insert into produk set ? ;'
    conn.query(sql,newProduct , (err,result)=>{
            res.send(result)
    })
})
app.post('/edit-product/:id' , (req,res) => {
    var EditProduct = req.body
    var sql = `update produk set ? where id=${req.params.id}`
    conn.query(sql,EditProduct , (err,result)=>{
            res.send(result)
    })
})
app.post('/proses-order/:id' , (req,res) => {
    var Editorder = req.body
    var sql = `update order_user set ? where id_order=${req.params.id}`
    conn.query(sql,Editorder , (err,result)=>{
            res.send(result)
            console.log(err)
    })
})
app.post('/proses-pembayaran/:id' , (req,res) => {
    var Editorder = req.body
    var sql = `update bukti_pembayaran set ? where id=${req.params.id}`
    conn.query(sql,Editorder , (err,result)=>{
            res.send(result)
    })
})
app.post('/edit-product-image/:id' , (req,res) => {
    var EditProductImage = req.body
    var sql = `update gambar_produk set ? where id_produk=${req.params.id}`
    conn.query(sql,EditProductImage , (err,result)=>{
            res.send(result)
            console.log(err)
    })
})
app.post('/delete-product/:id' , (req,res) => {
    var sql = `delete from produk where id= ${req.params.id}`
    conn.query(sql,(err,result)=>{
            res.send(result)
    })
    var sql2 = `delete from gambar_produk where id_produk= ${req.params.id}`
    conn.query(sql2,(err,result)=>{
            console.log(result)
    })
})

app.get('/get-produk',(req,res)=>{
    var sql =`select 
    p.id as id,
    p.nama as nama,
    p.harga as harga,
    p.deskripsi as deskripsi, 
    c.id as id_country,
    c.nama as country,
    k.id as id_kategori,
    k.nama_kategori as kategori
    from produk p
    join kategori k on p.kategori = k.id
    join country c on p.country = c.id`
    conn.query(sql,(err,result)=>{
        res.send(result)
    })
})
app.get('/get-produk-image',(req,res)=>{
    var sql =`select 
    p.id as id,
    p.nama as nama,
    gp.gambar1 as gambar1,
    gp.gambar2 as gambar2,
    gp.gambar3 as gambar3
    from produk p
    join kategori k on p.kategori = k.id
    join gambar_produk gp on p.id = gp.id_produk
    join country c on p.country = c.id`
    conn.query(sql,(err,result)=>{
        res.send(result)
    })
})
app.get('/get-kategori',(req,res)=>{
    var sql =`select * from kategori`
    conn.query(sql,(err,result)=>{
        res.send(result)
    })
})
app.get('/get-country',(req,res)=>{
    var sql =`select * from country`
    conn.query(sql,(err,result)=>{
        res.send(result)
    })
})
app.post('/post-image',(req,res)=>{
    var postImage = req.body
    var sql ='insert into gambar_produk set ?'
    conn.query(sql,postImage,(err,result)=>{
        res.send(result)
    })
})
app.post('/addToCart',(req,res)=>{
    var postToCart = req.body
    var sql ='insert into cart set ?'
    conn.query(sql,postToCart,(err,result)=>{
        res.send(result)
    })
})
app.post('/updateToCart',(req,res)=>{
    var id = req.body.id_product
    var postToCart = req.body.qty
    var sql =`update cart set qty= '${postToCart}' where id_product=${id} `
    conn.query(sql,(err,result)=>{
        res.send(result)
        console.log(err)
    })
})
app.get('/cartcheck', (req,res) => {
    var id_product = req.query.id_product;
    var username = req.query.username
    var sql = `select * from cart where id_product = '${id_product}' and username ='${username}'`;
    conn.query(sql, (err,result)=> {
        res.send(result)
        console.log(result)
        
        // console.log(result.length)
    })
})
app.get('/bukti-pembayaran', (req,res) => {
    var sql = `select * from bukti_pembayaran`;
    conn.query(sql, (err,result)=> {
        res.send(result)
    })
})
app.post('/addToOrder',(req,res)=>{
    var postToOrder = req.body
    var sql ='insert into order_user set ?'
    conn.query(sql,postToOrder,(err,result)=>{
        res.send(result)
        console.log(err)
    })
})
app.post('/getOrder',(req,res)=>{
    var username = req.body.username
    var sql =`select * from order_user where username = '${username}'`
    conn.query(sql,(err,result)=>{
        res.send(result)
        console.log(err)
    })
})
app.post('/deleteCart',(req,res)=>{
    var id_product = req.body.id_product
    var sql =`delete from cart where id_product = ${id_product}`
    conn.query(sql,(err,result)=>{
        res.send(result)
    })
})
app.post('/deleteCartFromCheckout',(req,res)=>{
    var username = req.body.username
    var sql =`delete from cart where username = '${username}'`
    conn.query(sql,(err,result)=>{
        res.send(result)
        console.log(err)
    })
})
app.post('/addToAddress',(req,res)=>{
    var postToAddress = req.body
    var sql ='insert into alamat set ?'
    conn.query(sql,postToAddress,(err,result)=>{
        res.send(result)
        console.log(err)
    })
})
app.post('/addToTransaksi',(req,res)=>{
    var postToTransaksi = req.body
    var sql ='insert into transaksi set ?'
    conn.query(sql,postToTransaksi,(err,result)=>{
        res.send(result)
        console.log(err)
    })
})

app.post("/country/:id",(req,res)=>{
    var page = req.body.page
    var sql =`select
    p.id as id,
    c.id as id_negara,
    k.id as kategori,
    p.nama as nama,
    p.harga as harga,
    p.deskripsi as deskripsi,
    c.nama as negara,
    gp.gambar1 as gambar
    from produk p 
    join kategori k on p.kategori = k.id
    join country c on p.country = c.id
    join gambar_produk gp on p.id = gp.id_produk
    where c.id = ${req.params.id}
    limit ${page},6
    `
    conn.query(sql,(err,result)=>{
        res.send(result)
    })
})
app.post("/suggestion-product",(req,res)=>{
    var country = req.body.country
    var product = req.body.product
    var sql =`select
    p.id as id,
    c.id as id_negara,
    k.id as kategori,
    p.nama as nama,
    p.harga as harga,
    p.deskripsi as deskripsi,
    c.nama as negara,
    gp.gambar1 as gambar
    from produk p 
    join kategori k on p.kategori = k.id
    join country c on p.country = c.id
    join gambar_produk gp on p.id = gp.id_produk
    where c.id = ${country}
    and p.id != ${product}
    order by RAND()
    limit 3
    `
    conn.query(sql,(err,result)=>{
        res.send(result)
    })
})
app.post("/country-category",(req,res)=>{
    var id = req.body.country;
    var id_kategori = req.body.category
    var sql =`select
    p.nama as nama,
    p.harga as harga,
    p.deskripsi as deskripsi,
    c.nama as negara,
    gp.gambar1 as gambar
    from produk p 
    join kategori k on p.kategori = k.id
    join country c on p.country = c.id
    join gambar_produk gp on p.id = gp.id_produk
    where c.id =${id} and k.id =${id_kategori}
    `
    conn.query(sql,(err,result)=>{
        res.send(result)
    })
})
app.get('/category' , (req,res) => {
    var sql = 'select * from kategori'
    conn.query(sql ,(err,result)=>{
        res.send(result)
        // console.log(result)
    })
})
app.post('/cart' , (req,res) => {
    var username = req.body.username
    var sql = `select
    p.id as id_produk,
    p.nama as nama,
    p.harga as harga,
    c.qty as qty,
    gp.gambar1 as gambar
    from cart c
    join produk p on c.id_product = p.id
    join gambar_produk gp on c.id_product = gp.id_produk 
    where c.username ='${username}'`
    conn.query(sql ,(err,result)=>{
        res.send(result)
        if(err){
            console.log(err)
        }
        // console.log(result)
    })
})
app.post('/order' , (req,res) => {
    var username = req.body.username
    var sql = `select
    p.id as id_produk,
    p.nama as nama,
    p.harga as harga,
    o.qty as qty,
    o.status as status,
    gp.gambar1 as gambar
    from order_user o
    join produk p on o.id_product = p.id
    join gambar_produk gp on o.id_product = gp.id_produk 
    where o.username ='${username}'
    and o.status = 'pending'`
    conn.query(sql ,(err,result)=>{
        res.send(result)
        if(err){
            console.log(err)
        }
        // console.log(result)
    })
})
app.post('/history' , (req,res) => {
    var username = req.body.username
    var sql = `select
    p.id as id_produk,
    p.nama as nama,
    p.harga as harga,
    o.qty as qty,
    o.status as status,
    gp.gambar1 as gambar
    from order_user o
    join produk p on o.id_product = p.id
    join gambar_produk gp on o.id_product = gp.id_produk 
    where o.username ='${username}' and o.status = 'done'`
    conn.query(sql ,(err,result)=>{
        res.send(result)
        if(err){
            console.log(err)
        }
        // console.log(result)
    })
})
app.get('/order-admin' , (req,res) => {
    var sql = `select
    o.id_order as id,
    o.orderId as orderId,
    p.id as id_produk,
    p.nama as nama,
    p.harga as harga,
    o.qty as qty,
    o.status as status,
    bp.status as status_pembayaran,
    gp.gambar1 as gambar
    from order_user o
    join produk p on o.id_product = p.id
    join gambar_produk gp on o.id_product = gp.id_produk
    left join bukti_pembayaran bp on o.orderId = bp.id_order
    where o.status = 'pending'`
    conn.query(sql ,(err,result)=>{
        res.send(result)
        if(err){
            console.log(err)
        }
        // console.log(result)
    })
})
app.get('/order-admin-top' , (req,res) => {
    var sql = `select
    distinct 
    o.orderId as orderId,
    t.harga as harga,
    o.status as status,
    bp.status as status_pembayaran
    from transaksi t
    join order_user o on o.orderId = t.orderId
    join produk p on p.id = o.id_product
    join bukti_pembayaran bp on bp.id_order = t.orderId
    where o.status = 'pending'`
    conn.query(sql ,(err,result)=>{
        res.send(result)
        if(err){
            console.log(err)
        }
        // console.log(result)
    })
})
app.get('/history-admin-top' , (req,res) => {
    var sql = `select
    distinct 
    o.orderId as orderId,
    t.harga as harga,
    o.status as status,
    bp.status as status_pembayaran
    from transaksi t
    join order_user o on o.orderId = t.orderId
    join produk p on p.id = o.id_product
    join bukti_pembayaran bp on bp.id_order = t.orderId
    where o.status != 'pending'`
    conn.query(sql ,(err,result)=>{
        res.send(result)
        if(err){
            console.log(err)
        }
        // console.log(result)
    })
})
app.get('/history-admin' , (req,res) => {
    var sql = `select
    o.username as username,
    o.id_order as id_order,
    p.id as id_produk,
    p.nama as nama,
    p.harga as harga,
    o.qty as qty,
    o.status as status,
    bp.status as status_pembayaran,
    gp.gambar1 as gambar
    from order_user o
    join produk p on o.id_product = p.id
    join gambar_produk gp on o.id_product = gp.id_produk
    left join bukti_pembayaran bp on o.orderId = bp.id_order
    where o.status != 'pending'`
    conn.query(sql ,(err,result)=>{
        res.send(result)
        if(err){
            console.log(err)
        }
        // console.log(result)
    })
})
app.post('/history-user' , (req,res) => {
    var username= req.body.username
    var sql = `select
    t.orderId as orderId,
    t.harga as harga,
    bp.date as date
    from transaksi t
    join bukti_pembayaran bp on bp.id_order = t.orderId
    where bp.username = '${username}'`
    conn.query(sql ,(err,result)=>{
        res.send(result)
        if(err){
            console.log(err)
        }
        // console.log(result)
    })
})
app.get("/product-detail/:id",(req,res)=>{
    var sql =`select
    p.id as id,
    k.id as kategori,
    p.nama as nama,
    p.harga as harga,
    p.deskripsi as deskripsi,
    c.nama as negara,
    gp.gambar1 as gambar,
    gp.gambar2 as gambar2,
    gp.gambar3 as gambar3
    from produk p 
    join kategori k on p.kategori = k.id
    join country c on p.country = c.id
    join gambar_produk gp on p.id = gp.id_produk
    where p.id = ${req.params.id}
    `
    conn.query(sql,(err,result)=>{
        res.send(result)
    })
})
app.get("/product",(req,res)=>{
    var sql =`select
    c.id as id_negara,
    p.id as id,
    k.id as kategori,
    p.nama as nama,
    p.harga as harga,
    p.deskripsi as deskripsi,
    c.nama as negara,
    gp.gambar1 as gambar,
    gp.gambar2 as gambar2,
    gp.gambar3 as gambar3
    from produk p 
    join kategori k on p.kategori = k.id
    join country c on p.country = c.id
    join gambar_produk gp on p.id = gp.id_produk
    order by RAND()
    limit 6 
    `
    conn.query(sql,(err,result)=>{
        res.send(result)
    })
})
app.post('/alamat' , (req,res) => {
    var username = req.body.username
    var sql = `select * from alamat
    where username ='${username}'`
    conn.query(sql ,(err,result)=>{
        res.send(result)
        if(err){
            console.log(err)
        }
        // console.log(result)
    })
})
app.post('/promo' , (req,res) => {
    var promo = req.body.promo
    var sql = `select * from promo where nama ='${promo}'`
    conn.query(sql ,(err,result)=>{
        res.send(result)
        if(err){
            console.log(err)
        }
        // console.log(result)
    })
})
app.post('/bukti-pembayaran' , (req,res) => {
   
    try {
        const path = '/brand/images'; //file save path
        const upload = uploader(path, 'PRD').fields([{ name: 'image'}]); //uploader(path, 'default prefix')
        
        upload(req, res, (err) => {
            console.log('masuk pak eko')
            if(err){
                return res.status(500).json({ message: 'Upload picture failed !', error: err.message });
            }

            const { image } = req.files;
            console.log(image)
            const imagePath = image ? path + '/' + image[0].filename : null;
            console.log(imagePath)

            console.log(req.body.data)
            const data = JSON.parse(req.body.data);
            console.log(data)
            data.image = imagePath;
            console.log(data.image)
            console.log(data)
            var sql = 'INSERT INTO bukti_pembayaran SET ?';
            conn.query(sql, data, (err, results) => {
                if(err) {
                    console.log(err.message)
                    fs.unlinkSync('./public' + imagePath);
                    return res.status(500).json({ message: "There's an error on the server. Please contact the administrator.", error: err.message });
                }
               
                console.log(results);
                sql = 'SELECT * from bukti_pembayaran;';
                conn.query(sql, (err, results) => {
                    if(err) {
                        console.log(err.message);
                        return res.status(500).json({ message: "There's an error on the server. Please contact the administrator.", error: err.message });
                    }
                    console.log(results);
                    
                    res.send(results);
                })   
            })    
        })
    } catch(err) {
        console.log(err)
        console.log('ga masuk pak eko')
        return res.status(500).json({ message: "There's an error on the server. Please contact the administrator.", error: err.message });
    }

})

// var pembayaran = req.body
//     var sql = `insert into bukti_pembayaran set ?`
//     conn.query(sql,pembayaran ,(err,result)=>{
//         res.send(result)
//         if(err){
//             console.log(err)
//         }
//         // console.log(result)
//     })



app.listen(port, () => console.log('API Aktif di port ' + port))