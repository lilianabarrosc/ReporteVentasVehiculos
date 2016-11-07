# ReporteVentasVehiculos
App en capas

Para agregar los procedimientos almacenados, se aplican directamente en agregar funciones de postgress

ejemplo de conexion con postgress (quedo con conexion a sqlserver)
string connstring = "";
// Making connection with Npgsql provider
NpgsqlConnection conn = new NpgsqlConnection(connstring);
conn.Open();
NpgsqlDataAdapter sda = new NpgsqlDataAdapter("SpName", conn);
sda.SelectCommand.CommandType = CommandType.StoredProcedure;
                sda.SelectCommand.Parameters.Add("@lstExtension", result);
