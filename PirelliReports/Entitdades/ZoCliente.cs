using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Entidades
{
    //[Serializable]
    public class ZoCliente
    {
        private string cod;

        public string Cod
        {
            get { return cod; }
            set { cod = value; }
        }
        private string codCliMatriz;

        public string CodCliMatriz
        {
            get { return codCliMatriz; }
            set { codCliMatriz = value; }
        }
        private string codCliRefill;

        public string CodCliRefill
        {
            get { return codCliRefill; }
            set { codCliRefill = value; }
        }
        private string cuit;

        public string Cuit
        {
            get { return cuit; }
            set { cuit = value; }
        }
        private string centroEmisor;

        public string CentroEmisor
        {
            get { return centroEmisor; }
            set { centroEmisor = value; }
        }
        private string tipo;

        public string Tipo
        {
            get { return tipo; }
            set { tipo = value; }
        }
        private string razSoc;

        public string RazSoc
        {
            get { return razSoc; }
            set { razSoc = value; }
        }
        private string nomFant;

        public string NomFant
        {
            get { return nomFant; }
            set { nomFant = value; }
        }
        private string dirSuc;

        public string DirSuc
        {
            get { return dirSuc; }
            set { dirSuc = value; }
        }
        private string dirFact;

        public string DirFact
        {
            get { return dirFact; }
            set { dirFact = value; }
        }
        private string barrio;

        public string Barrio
        {
            get { return barrio; }
            set { barrio = value; }
        }
        private string ciudad;

        public string Ciudad
        {
            get { return ciudad; }
            set { ciudad = value; }
        }
        private string codProv;


        public string CodProv
        {
            get { return codProv; }
            set { codProv = value; }
        }
        private string pais;

        public string Pais
        {
            get { return pais; }
            set { pais = value; }
        }
        private string codRegion;

        public string CodRegion
        {
            get { return codRegion; }
            set { codRegion = value; }
        }
        private string telefonoSuc;

        public string TelefonoSuc
        {
            get { return telefonoSuc; }
            set { telefonoSuc = value; }
        }
        private string telefonoFact;

        public string TelefonoFact
        {
            get { return telefonoFact; }
            set { telefonoFact = value; }
        }
        private string terminalPOS;

        public string TerminalPOS
        {
            get { return terminalPOS; }
            set { terminalPOS = value; }
        }
        private string eMail;

        public string EMail
        {
            get { return eMail; }
            set { eMail = value; }
        }
        private string paginaWEB;

        public string PaginaWEB
        {
            get { return paginaWEB; }
            set { paginaWEB = value; }
        }
        private string ctc_car;

        public string Ctc_car
        {
            get { return ctc_car; }
            set { ctc_car = value; }
        }
        private string ctc_truck;

        public string Ctc_truck
        {
            get { return ctc_truck; }
            set { ctc_truck = value; }
        }
        private string nota;

        public string Nota
        {
            get { return nota; }
            set { nota = value; }
        }
        private string fechaAlta;

        public string FechaAlta
        {
            get { return fechaAlta; }
            set { fechaAlta = value; }
        }
        private string fechaUpd;

        public string FechaUpd
        {
            get { return fechaUpd; }
            set { fechaUpd = value; }
        }
        private string flgBajaLogica;

        public string FlgBajaLogica
        {
            get { return flgBajaLogica; }
            set { flgBajaLogica = value; }
        }
        private string flgFilBusq;

        public string FlgFilBusq
        {
            get { return flgFilBusq; }
            set { flgFilBusq = value; }
        }
        private double latitud;

        public double Latitud
        {
            get { return latitud; }
            set { latitud = value; }
        }
        private double longitud;

        public double Longitud
        {
            get { return longitud; }
            set { longitud = value; }
        }
    }
}