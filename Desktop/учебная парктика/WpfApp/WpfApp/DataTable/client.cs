//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WpfApp.DataTable
{
    using System;
    using System.Collections.Generic;
    
    public partial class client
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public client()
        {
            this.uslugi = new HashSet<uslugi>();
        }
    
        public string id_client { get; set; }
        public string Surname { get; set; }
        public string name { get; set; }
        public string patronimyc { get; set; }
        public int id_gender { get; set; }
        public System.DateTime birthday { get; set; }
        public string number_phone { get; set; }
        public string email { get; set; }
        public int id_adress_client { get; set; }
        public string adress_projiv { get; set; }
        public string pasport { get; set; }
        public string kod_podrazd { get; set; }
        public string kem_vidan { get; set; }
        public System.DateTime date_vidachi { get; set; }
        public string nubmer_dogovora { get; set; }
        public System.DateTime date_zaklyucheniya { get; set; }
        public int id_contract { get; set; }
        public string prichina_rastorgj { get; set; }
        public string lictev_chet { get; set; }
        public Nullable<System.DateTime> date_raztorjg_dogovora { get; set; }
        public Nullable<System.DateTime> date_podpisaniya { get; set; }
        public string number_oborud { get; set; }
    
        public virtual adress_client adress_client { get; set; }
        public virtual contract_type contract_type { get; set; }
        public virtual gender gender { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<uslugi> uslugi { get; set; }
    }
}
