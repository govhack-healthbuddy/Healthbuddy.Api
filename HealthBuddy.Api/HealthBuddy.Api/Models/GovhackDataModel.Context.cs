﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace HealthBuddy.Api.Models
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class GovhackModelEntities : DbContext
    {
        public GovhackModelEntities()
            : base("name=GovhackModelEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Test> Tests { get; set; }
        public virtual DbSet<AllSaHospital> AllSaHospitals { get; set; }
        public virtual DbSet<myhospitals_contact_data> myhospitals_contact_data { get; set; }
        public virtual DbSet<emergencydept4hourlengthofstaymetadata> emergencydept4hourlengthofstaymetadata { get; set; }
        public virtual DbSet<ED001_HospitalStatus> ED001_HospitalStatus { get; set; }
    }
}
