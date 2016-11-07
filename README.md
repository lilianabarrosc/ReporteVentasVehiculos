# ReporteVentasVehiculos
App en capas
capa entidades: contiene los atributos de cada entidad.
capa datos: contiene el llamado de los procediemintos almacenados a la bd y su ejecucion.
capa negocio: llama a la capa de datos y entidades para realiazar los CRUD.
capa presentacion: contien las pag de administracion de cada entidad.

Para agregar los procedimientos almacenados, se aplican directamente en agregar funciones de postgress

ejemplo de conexion con postgress (quedo con conexion a sqlserver)
string connstring = "";
// Making connection with Npgsql provider
NpgsqlConnection conn = new NpgsqlConnection(connstring);
conn.Open();
NpgsqlDataAdapter sda = new NpgsqlDataAdapter("SpName", conn);
sda.SelectCommand.CommandType = CommandType.StoredProcedure;
                sda.SelectCommand.Parameters.Add("@lstExtension", result);
