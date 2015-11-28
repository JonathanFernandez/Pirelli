using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Configuration;
using System.Data;
using System.Collections;
using System.Data.SqlClient;
namespace DBLayer
{
    public class AdoConn
    {
        SqlConnection sqlConn;
        SqlTransaction transaction;
        SqlDataReader reader;
        SqlDataAdapter adapter;
        SqlCommand command;
        string mensajeExcepcion;
        string mensajeSQLExcepcion;
        int cantidadParametros;

        private bool Conectar()
        {
            string cadenaConexion = ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString;
            //@"Server=Jona\SQLEXPRESS;Database=Comercial;Trusted_Connection=Yes;";
            //ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString;
            //"Persist Security Info=False;User ID=pcs;Password=pcs;Initial Catalog=T200120;Server=adv064ar;Connection Timeout=300";

            if (sqlConn == null)
            {
                sqlConn = new SqlConnection(cadenaConexion);
            }

            if (sqlConn.State == ConnectionState.Closed)
                sqlConn.Open();

            return (sqlConn.State == ConnectionState.Open);
        }

        private bool Conectar(string cadenaDeConexion)
        {
            string cadenaConexion = cadenaDeConexion;
            //@"Server=Jona\SQLEXPRESS;Database=Comercial;Trusted_Connection=Yes;";
            //ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString;
            //"Persist Security Info=False;User ID=pcs;Password=pcs;Initial Catalog=T200120;Server=adv064ar;Connection Timeout=300";

            if (sqlConn == null)
            {
                sqlConn = new SqlConnection(cadenaConexion);
            }

            if (sqlConn.State == ConnectionState.Closed)
                sqlConn.Open();

            return (sqlConn.State == ConnectionState.Open);
        }

        private bool Desconectar()
        {
            if (sqlConn != null)
                sqlConn.Close();

            return (sqlConn.State == ConnectionState.Closed);
        }

        //con conexiones default
        public DataSet ExecuteStoredProcedureDS(string nombreSp, ArrayList sqlParametros)
        {
            DataSet ds = new DataSet();

            if (Conectar())
            {
                command = new SqlCommand();
                command.Connection = sqlConn;
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = nombreSp;

                transaction = sqlConn.BeginTransaction();
                command.Transaction = transaction;

                try
                {
                    SqlCommandBuilder.DeriveParameters(command);

                    if (sqlParametros == null)
                        cantidadParametros = 0;
                    else
                        cantidadParametros = sqlParametros.Count;

                    for (int i = 1; i <= command.Parameters.Count - 1; i++)
                        command.Parameters[i].Value = sqlParametros[i - 1];


                    adapter = new SqlDataAdapter(command);

                    adapter.Fill(ds);

                    transaction.Commit();

                    Desconectar();

                }
                catch (SqlException sqlEx)
                {
                    transaction.Rollback();
                    mensajeSQLExcepcion = sqlEx.Message;
                }
                catch (Exception ex)
                {
                    transaction.Rollback();
                    mensajeExcepcion = ex.Message;
                }
            }

            return ds;
        }

        public DataTable ExecuteStoredProcedureDT(string nombreSp, ArrayList sqlParametros)
        {
            DataTable dt = new DataTable();

            if (Conectar())
            {
                command = new SqlCommand();
                command.Connection = sqlConn;
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = nombreSp;

                transaction = sqlConn.BeginTransaction();
                command.Transaction = transaction;

                try
                {
                    SqlCommandBuilder.DeriveParameters(command);

                    if (sqlParametros == null)
                        cantidadParametros = 0;
                    else
                        cantidadParametros = sqlParametros.Count;

                    for (int i = 1; i <= command.Parameters.Count - 1; i++)
                        command.Parameters[i].Value = sqlParametros[i - 1];


                    //adapter = new SqlDataAdapter(command);

                    //adapter.Fill(ds);

                    reader = command.ExecuteReader();

                    dt.Load(reader);

                    reader.Close();

                    transaction.Commit();

                    Desconectar();

                }
                catch (SqlException sqlEx)
                {
                    transaction.Rollback();
                    mensajeSQLExcepcion = sqlEx.Message;
                }
                catch (Exception ex)
                {
                    transaction.Rollback();
                    mensajeExcepcion = ex.Message;
                }
            }

            return dt;
        }

        public DataTable ExecuteQueryDT(string query)
        {
            DataTable dt = new DataTable();

            if (Conectar())
            {
                command = new SqlCommand();
                command.Connection = sqlConn;
                command.CommandType = CommandType.Text;
                command.CommandText = query;

                transaction = sqlConn.BeginTransaction();

                command.Transaction = transaction;
                try
                {

                    //adapter = new SqlDataAdapter(command);

                    //adapter.Fill(ds);
                    reader = command.ExecuteReader();

                    dt.Load(reader);

                    reader.Close();

                    transaction.Commit();

                    Desconectar();

                }
                catch (SqlException sqlEx)
                {
                    transaction.Rollback();
                    mensajeSQLExcepcion = sqlEx.Message;
                }
                catch (Exception ex)
                {
                    transaction.Rollback();
                    mensajeExcepcion = ex.Message;
                }
            }

            return dt;
        }

        public DataSet ExecuteQueryDS(string query)
        {
            DataSet ds = new DataSet();

            if (Conectar())
            {
                command = new SqlCommand();
                command.Connection = sqlConn;
                command.CommandType = CommandType.Text;
                command.CommandText = query;

                transaction = sqlConn.BeginTransaction();

                command.Transaction = transaction;
                try
                {

                    adapter = new SqlDataAdapter(command);

                    adapter.Fill(ds);
                    //reader = command.ExecuteReader();

                    //dt.Load(reader);

                    //reader.Close();

                    transaction.Commit();

                    Desconectar();

                }
                catch (SqlException sqlEx)
                {
                    transaction.Rollback();
                    mensajeSQLExcepcion = sqlEx.Message;
                }
                catch (Exception ex)
                {
                    transaction.Rollback();
                    mensajeExcepcion = ex.Message;
                }
            }

            return ds;
        }

        public bool ExecuteNonStoredProcedure(string nombreSp, ArrayList sqlParametros)
        {
            if (Conectar())
            {
                command = new SqlCommand();
                command.Connection = sqlConn;
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = nombreSp;

                transaction = sqlConn.BeginTransaction();
                command.Transaction = transaction;
                try
                {
                    SqlCommandBuilder.DeriveParameters(command);

                    if (sqlParametros == null)
                        cantidadParametros = 0;
                    else
                        cantidadParametros = sqlParametros.Count;

                    for (int i = 1; i <= command.Parameters.Count - 1; i++)
                        command.Parameters[i].Value = sqlParametros[i - 1];

                    command.ExecuteNonQuery();

                    transaction.Commit();

                    Desconectar();

                    return true;
                }
                catch (SqlException sqlEx)
                {
                    transaction.Rollback();
                    mensajeSQLExcepcion = sqlEx.Message;
                    return false;
                }
                catch (Exception ex)
                {
                    transaction.Rollback();
                    mensajeExcepcion = ex.Message;
                    return false;
                }
            }
            return false;

        }

        public bool ExecuteNonQuery(string query)
        {
            if (Conectar())
            {
                command = new SqlCommand();
                command.Connection = sqlConn;
                command.CommandType = CommandType.Text;
                command.CommandText = query;

                transaction = sqlConn.BeginTransaction();
                command.Transaction = transaction;
                try
                {
                    SqlCommandBuilder.DeriveParameters(command);

                    command.ExecuteNonQuery();

                    transaction.Commit();

                    Desconectar();

                    return true;
                }
                catch (SqlException sqlEx)
                {
                    transaction.Rollback();
                    mensajeSQLExcepcion = sqlEx.Message;
                    return false;
                }
                catch (Exception ex)
                {
                    transaction.Rollback();
                    mensajeExcepcion = ex.Message;
                    return false;
                }
            }
            return false;

        }

        //sin parametros de sp 
        public DataSet ExecuteStoredProcedureDS(string nombreSp)
        {
            DataSet ds = new DataSet();

            if (Conectar())
            {
                command = new SqlCommand();
                command.Connection = sqlConn;
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = nombreSp;

                transaction = sqlConn.BeginTransaction();
                command.Transaction = transaction;

                try
                {
                    adapter = new SqlDataAdapter(command);

                    adapter.Fill(ds);

                    transaction.Commit();

                    Desconectar();

                }
                catch (SqlException sqlEx)
                {
                    transaction.Rollback();
                    mensajeSQLExcepcion = sqlEx.Message;
                }
                catch (Exception ex)
                {
                    transaction.Rollback();
                    mensajeExcepcion = ex.Message;
                }
            }

            return ds;
        }

        public DataTable ExecuteStoredProcedureDT(string nombreSp)
        {
            DataTable dt = new DataTable();

            if (Conectar())
            {
                command = new SqlCommand();
                command.Connection = sqlConn;
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = nombreSp;

                transaction = sqlConn.BeginTransaction();
                command.Transaction = transaction;

                try
                {
                    //adapter = new SqlDataAdapter(command);

                    //adapter.Fill(ds);

                    reader = command.ExecuteReader();

                    dt.Load(reader);

                    reader.Close();

                    transaction.Commit();

                    Desconectar();

                }
                catch (SqlException sqlEx)
                {
                    transaction.Rollback();
                    mensajeSQLExcepcion = sqlEx.Message;
                }
                catch (Exception ex)
                {
                    transaction.Rollback();
                    mensajeExcepcion = ex.Message;
                }
            }

            return dt;
        }

        public bool ExecuteNonStoredProcedure(string nombreSp)
        {
            if (Conectar())
            {
                command = new SqlCommand();
                command.Connection = sqlConn;
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = nombreSp;

                transaction = sqlConn.BeginTransaction();
                command.Transaction = transaction;
                try
                {
                    command.ExecuteNonQuery();

                    transaction.Commit();

                    Desconectar();

                    return true;
                }
                catch (SqlException sqlEx)
                {
                    transaction.Rollback();
                    mensajeSQLExcepcion = sqlEx.Message;
                    return false;
                }
                catch (Exception ex)
                {
                    transaction.Rollback();
                    mensajeExcepcion = ex.Message;
                    return false;
                }
            }
            return false;

        }

        //con conexiones por parametros
        public DataSet ExecuteStoredProcedureDS(string nombreSp, ArrayList sqlParametros, string cadenaDeConexion)
        {
            DataSet ds = new DataSet();

            if (Conectar(cadenaDeConexion))
            {
                command = new SqlCommand();
                command.Connection = sqlConn;
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = nombreSp;

                transaction = sqlConn.BeginTransaction();
                command.Transaction = transaction;

                try
                {
                    SqlCommandBuilder.DeriveParameters(command);

                    if (sqlParametros == null)
                        cantidadParametros = 0;
                    else
                        cantidadParametros = sqlParametros.Count;

                    for (int i = 1; i <= command.Parameters.Count - 1; i++)
                        command.Parameters[i].Value = sqlParametros[i - 1];


                    adapter = new SqlDataAdapter(command);

                    adapter.Fill(ds);

                    transaction.Commit();

                    Desconectar();

                }
                catch (SqlException sqlEx)
                {
                    transaction.Rollback();
                    mensajeSQLExcepcion = sqlEx.Message;
                }
                catch (Exception ex)
                {
                    transaction.Rollback();
                    mensajeExcepcion = ex.Message;
                }
            }

            return ds;
        }

        public DataTable ExecuteStoredProcedureDT(string nombreSp, ArrayList sqlParametros, string cadenaDeConexion)
        {
            DataTable dt = new DataTable();

            if (Conectar(cadenaDeConexion))
            {
                command = new SqlCommand();
                command.Connection = sqlConn;
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = nombreSp;

                transaction = sqlConn.BeginTransaction();
                command.Transaction = transaction;

                try
                {
                    SqlCommandBuilder.DeriveParameters(command);

                    if (sqlParametros == null)
                        cantidadParametros = 0;
                    else
                        cantidadParametros = sqlParametros.Count;

                    for (int i = 1; i <= command.Parameters.Count - 1; i++)
                        command.Parameters[i].Value = sqlParametros[i - 1];


                    //adapter = new SqlDataAdapter(command);

                    //adapter.Fill(ds);

                    reader = command.ExecuteReader();

                    dt.Load(reader);

                    reader.Close();

                    transaction.Commit();

                    Desconectar();

                }
                catch (SqlException sqlEx)
                {
                    transaction.Rollback();
                    mensajeSQLExcepcion = sqlEx.Message;
                }
                catch (Exception ex)
                {
                    transaction.Rollback();
                    mensajeExcepcion = ex.Message;
                }
            }

            return dt;
        }

        public DataTable ExecuteQueryDT(string query, string cadenaDeConexion)
        {
            DataTable dt = new DataTable();

            if (Conectar(cadenaDeConexion))
            {
                command = new SqlCommand();
                command.Connection = sqlConn;
                command.CommandType = CommandType.Text;
                command.CommandText = query;

                transaction = sqlConn.BeginTransaction();

                command.Transaction = transaction;
                try
                {

                    //adapter = new SqlDataAdapter(command);

                    //adapter.Fill(ds);
                    reader = command.ExecuteReader();

                    dt.Load(reader);

                    reader.Close();

                    transaction.Commit();

                    Desconectar();

                }
                catch (SqlException sqlEx)
                {
                    transaction.Rollback();
                    mensajeSQLExcepcion = sqlEx.Message;
                }
                catch (Exception ex)
                {
                    transaction.Rollback();
                    mensajeExcepcion = ex.Message;
                }
            }

            return dt;
        }

        public DataSet ExecuteQueryDS(string query, string cadenaDeConexion)
        {
            DataSet ds = new DataSet();

            if (Conectar(cadenaDeConexion))
            {
                command = new SqlCommand();
                command.Connection = sqlConn;
                command.CommandType = CommandType.Text;
                command.CommandText = query;

                transaction = sqlConn.BeginTransaction();

                command.Transaction = transaction;
                try
                {

                    adapter = new SqlDataAdapter(command);

                    adapter.Fill(ds);
                    //reader = command.ExecuteReader();

                    //dt.Load(reader);

                    //reader.Close();

                    transaction.Commit();

                    Desconectar();

                }
                catch (SqlException sqlEx)
                {
                    transaction.Rollback();
                    mensajeSQLExcepcion = sqlEx.Message;
                }
                catch (Exception ex)
                {
                    transaction.Rollback();
                    mensajeExcepcion = ex.Message;
                }
            }

            return ds;
        }

        public bool ExecuteNonStoredProcedure(string nombreSp, ArrayList sqlParametros, string cadenaDeConexion)
        {
            if (Conectar(cadenaDeConexion))
            {
                command = new SqlCommand();
                command.Connection = sqlConn;
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = nombreSp;

                transaction = sqlConn.BeginTransaction();
                command.Transaction = transaction;
                try
                {
                    SqlCommandBuilder.DeriveParameters(command);

                    if (sqlParametros == null)
                        cantidadParametros = 0;
                    else
                        cantidadParametros = sqlParametros.Count;

                    for (int i = 1; i <= command.Parameters.Count - 1; i++)
                        command.Parameters[i].Value = sqlParametros[i - 1];

                    command.ExecuteNonQuery();

                    transaction.Commit();

                    Desconectar();

                    return true;
                }
                catch (SqlException sqlEx)
                {
                    transaction.Rollback();
                    mensajeSQLExcepcion = sqlEx.Message;
                    return false;
                }
                catch (Exception ex)
                {
                    transaction.Rollback();
                    mensajeExcepcion = ex.Message;
                    return false;
                }
            }
            return false;

        }

        public bool ExecuteNonQuery(string query, string cadenaDeConexion)
        {
            if (Conectar(cadenaDeConexion))
            {
                command = new SqlCommand();
                command.Connection = sqlConn;
                command.CommandType = CommandType.Text;
                command.CommandText = query;

                transaction = sqlConn.BeginTransaction();
                command.Transaction = transaction;
                try
                {
                    SqlCommandBuilder.DeriveParameters(command);

                    command.ExecuteNonQuery();

                    transaction.Commit();

                    Desconectar();

                    return true;
                }
                catch (SqlException sqlEx)
                {
                    transaction.Rollback();
                    mensajeSQLExcepcion = sqlEx.Message;
                    return false;
                }
                catch (Exception ex)
                {
                    transaction.Rollback();
                    mensajeExcepcion = ex.Message;
                    return false;
                }
            }
            return false;

        }

        //sin parametros de sp y son cadena de conexion
        public DataSet ExecuteStoredProcedureDS(string nombreSp, string cadenaDeConexion)
        {
            DataSet ds = new DataSet();

            if (Conectar(cadenaDeConexion))
            {
                command = new SqlCommand();
                command.Connection = sqlConn;
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = nombreSp;

                transaction = sqlConn.BeginTransaction();
                command.Transaction = transaction;

                try
                {
                    adapter = new SqlDataAdapter(command);

                    adapter.Fill(ds);

                    transaction.Commit();

                    Desconectar();

                }
                catch (SqlException sqlEx)
                {
                    transaction.Rollback();
                    mensajeSQLExcepcion = sqlEx.Message;
                }
                catch (Exception ex)
                {
                    transaction.Rollback();
                    mensajeExcepcion = ex.Message;
                }
            }

            return ds;
        }

        public DataTable ExecuteStoredProcedureDT(string nombreSp, string cadenaDeConexion)
        {
            DataTable dt = new DataTable();

            if (Conectar(cadenaDeConexion))
            {
                command = new SqlCommand();
                command.Connection = sqlConn;
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = nombreSp;

                transaction = sqlConn.BeginTransaction();
                command.Transaction = transaction;

                try
                {
                    //adapter = new SqlDataAdapter(command);

                    //adapter.Fill(ds);

                    reader = command.ExecuteReader();

                    dt.Load(reader);

                    reader.Close();

                    transaction.Commit();

                    Desconectar();

                }
                catch (SqlException sqlEx)
                {
                    transaction.Rollback();
                    mensajeSQLExcepcion = sqlEx.Message;
                }
                catch (Exception ex)
                {
                    transaction.Rollback();
                    mensajeExcepcion = ex.Message;
                }
            }

            return dt;
        }

        public bool ExecuteNonStoredProcedure(string nombreSp, string cadenaDeConexion)
        {
            if (Conectar(cadenaDeConexion))
            {
                command = new SqlCommand();
                command.Connection = sqlConn;
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = nombreSp;

                transaction = sqlConn.BeginTransaction();
                command.Transaction = transaction;
                try
                {
                    command.ExecuteNonQuery();

                    transaction.Commit();

                    Desconectar();

                    return true;
                }
                catch (SqlException sqlEx)
                {
                    transaction.Rollback();
                    mensajeSQLExcepcion = sqlEx.Message;
                    return false;
                }
                catch (Exception ex)
                {
                    transaction.Rollback();
                    mensajeExcepcion = ex.Message;
                    return false;
                }
            }
            return false;

        }
    }
}