DROP DATABASE entidadComercial;
CREATE DATABASE entidadComercial;
USE entidadComercial;
CREATE TABLE bodegas
(
	idBodega VARCHAR(4)PRIMARY KEY,
    nombreBodega VARCHAR(60),
    estatusBodega VARCHAR(1)
) ENGINE=INNODB DEFAULT CHARSET=latin1;
CREATE TABLE lineas
(
	idLinea VARCHAR(4) PRIMARY KEY,
    nombreLinea VARCHAR(60),
    estatusLinea VARCHAR(1)
) ENGINE=INNODB DEFAULT CHARSET=latin1;
CREATE TABLE marcas
(
	idMarca VARCHAR(4) PRIMARY KEY,
    nombreMarca VARCHAR(60),
    estatusMarca VARCHAR(1)
) ENGINE=INNODB DEFAULT CHARSET=latin1;
CREATE TABLE productos
(
	idProducto VARCHAR(4) PRIMARY KEY,
    nombreProducto VARCHAR(60),
    codigoLinea VARCHAR(5),
    codigoMarca VARCHAR(5),
    existenciaProducto FLOAT (10,2),
    estatusProducto VARCHAR(1),
    FOREIGN KEY (codigo_linea) REFERENCES lineas(codigo_linea),
    FOREIGN KEY (codigo_marca) REFERENCES marcas(codigo_marca)
) ENGINE=INNODB DEFAULT CHARSET=latin1;
CREATE TABLE existencias
(
	idBodega VARCHAR(4),
    codigoProducto VARCHAR(18),
    saldoxistencia FLOAT(10,2),
    PRIMARY KEY (codigo_bodega, codigo_producto),
	FOREIGN KEY (codigo_bodega) REFERENCES bodegas(codigo_bodega),
    FOREIGN KEY (codigo_producto) REFERENCES productos(codigo_producto)
) ENGINE=INNODB DEFAULT CHARSET=latin1;
CREATE TABLE vendedores
(
	idVendedor VARCHAR(4) PRIMARY KEY,
    nombreVendedor VARCHAR(60),
    direccionVendedor VARCHAR(60),
    telefonoVendedor VARCHAR(50),
    nitVendedor VARCHAR(20),
    estatusVendedor VARCHAR(1)
) ENGINE=INNODB DEFAULT CHARSET=latin1;
CREATE TABLE clientes
(
	idCliente VARCHAR(4) PRIMARY KEY,
    nombreCliente VARCHAR(60),
    direccionCliente VARCHAR(60),
    nitCliente VARCHAR(20),
    telefonoCliente VARCHAR(50),
    codigoVendedor VARCHAR(5),
    estatusCliente VARCHAR(1),
    FOREIGN KEY (codigo_vendedor) REFERENCES vendedores(codigo_vendedor)
) ENGINE=INNODB DEFAULT CHARSET=latin1;
CREATE TABLE proveedores
(
	idProveedor VARCHAR(4) PRIMARY KEY,
    nombreProveedor VARCHAR(60),
    direccionProveedor VARCHAR(60),
    telefonoProveedor VARCHAR(50),
    nitProveedor VARCHAR(50),
    estatusProveedor VARCHAR(1)
) ENGINE=INNODB DEFAULT CHARSET=latin1;
CREATE TABLE comprasEncabezado
(
	CompraEncabezado VARCHAR(4) PRIMARY KEY,
    codigoProveedor VARCHAR(5),
    fechaCompraEncabezado DATE,
	totalCompraEncabezado FLOAT(10,2),
    estatusCompraEncabezado VARCHAR(1),
    FOREIGN KEY (codigo_proveedor) REFERENCES proveedores(codigo_proveedor)
) ENGINE=INNODB DEFAULT CHARSET=latin1;
CREATE TABLE comprasDetalle
(
	CompraEncabezado VARCHAR(4),
    codigoProducto VARCHAR(18),
    cantidadCompraDet FLOAT(10,2),
    costoCompraDet FLOAT(10,2),
	codigoBodega VARCHAR(5),
    PRIMARY KEY (CompraEncabezado, codigo_producto),
    FOREIGN KEY (CompraEncabezado) REFERENCES compras_encabezado(CompraEncabezado),
    FOREIGN KEY (codigoProducto) REFERENCES productos(codigoProducto),
    FOREIGN KEY (codigoBodega) REFERENCES bodegas(codigoBodega)
) ENGINE=INNODB DEFAULT CHARSET=latin1;
CREATE TABLE ventasEncabezado
(
	VentaEncabezado VARCHAR(4) PRIMARY KEY,
    codigoCliente VARCHAR(5),
    fechaVentaEnca DATE,
    totalVentaEnca FLOAT(10,2),
    estatusVentaEnca VARCHAR(1),
    FOREIGN KEY (codigoCliente) REFERENCES clientes(codigoCliente)
) ENGINE=INNODB DEFAULT CHARSET=latin1;
CREATE TABLE ventasDetalle
(
	VentaEncabezado VARCHAR(4),
    codigoProducto VARCHAR(18),
    cantidadVentaDet FLOAT(10,2),
    costoVentaDet FLOAT(10,2),
    precioVentaDet FLOAT(10,2),
    codigoBodega VARCHAR(5),
    PRIMARY KEY (VentaEncabezado, codigoProducto),
    FOREIGN KEY (VentaEncabezado) REFERENCES ventasEncabezado(VentaEncabezado),
    FOREIGN KEY (codigoProducto) REFERENCES productos(codigoProducto),
    FOREIGN KEY (codigoBodega) REFERENCES bodegas(codigoBodega)
) ENGINE=INNODB DEFAULT CHARSET=latin1;
    