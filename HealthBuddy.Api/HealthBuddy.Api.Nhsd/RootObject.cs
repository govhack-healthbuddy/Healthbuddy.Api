using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HealthBuddy.Api.Nhsd
{
    public class SiteAddress
    {
        public string Postcode { get; set; }
        public string AccuracyIndicator { get; set; }
        public string State { get; set; }
        public string GeocodeSource { get; set; }
        public string Suburb { get; set; }
        public string Latitude { get; set; }
        public string Longitude { get; set; }
        public string Address_Line_3 { get; set; }
        public string Address_Line_1 { get; set; }
        public string Address_Line_2 { get; set; }
    }

    public class ProviderCollection
    {
        public object ProviderData { get; set; }
    }

    public class ServiceCollection
    {
        public ServiceData ServiceData { get; set; }
    }

    public class SitePhone
    {
        public string Type { get; set; }
        public string PhNumber { get; set; }
        public string IsMain { get; set; }
        public object Prefix { get; set; }
    }

    public class SiteData
    {
        public object Description { get; set; }
        public SiteAddress SiteAddress { get; set; }
        public object Website { get; set; }
        public string OrganisationName { get; set; }
        public string Distance { get; set; }
        public string SiteName { get; set; }
        public string OrganisationID { get; set; }
        public ProviderCollection ProviderCollection { get; set; }
        public ServiceCollection ServiceCollection { get; set; }
        public object Email { get; set; }
        public string LastUpdate { get; set; }
        public string RecStatus { get; set; }
        public SitePhone SitePhone { get; set; }
        public string SiteID { get; set; }
    }

    public class ResultList
    {
        public List<SiteData> SiteData { get; set; }
    }

    public class CentrePoint
    {
        public string Latitude { get; set; }
        public string Longitude { get; set; }
    }

    public class SiteSearchResult
    {
        public ResultList ResultList { get; set; }
        public string TotalResults { get; set; }
        public CentrePoint CentrePoint { get; set; }
    }

    public class SiteSearchResponse
    {
        public SiteSearchResult SiteSearchResult { get; set; }
    }

    public class RootObject
    {
        public SiteSearchResponse SiteSearchResponse { get; set; }
    }

    public class TelehealthCapable
    {
    }

    public class SecondaryServiceTypes
    {
    }

    public class AvailabilityData
    {
        public string OpeningTime { get; set; }
        public string ClosingTime { get; set; }
        public string DayDescription { get; set; }
    }

    public class AvailabilityCollection
    {
        [JsonConverter(typeof(SingleOrArrayConverter<AvailabilityData>))]
        public List<AvailabilityData> AvailabilityData { get; set; }
    }

    public class SpecialisedServiceCategories
    {
        public string @string { get; set; }
    }

    public class ServiceAddress
    {
        public string Postcode { get; set; }
        public string State { get; set; }
        public string GeocodeSource { get; set; }
        public string Suburb { get; set; }
        public string Latitude { get; set; }
        public string Longitude { get; set; }
        //public string Address_Line_2 { get; set; }
        public string Address_Line_3 { get; set; }
    }

    public class ServiceDeliveryMethod
    {
        public string @string { get; set; }
    }

    public class PhoneData
    {
        public string Type { get; set; }
        public string PhNumber { get; set; }
        public string IsMain { get; set; }
        //public string Prefix { get; set; }  Causes problems - string or empty dictionary?
    }

    public class ServiceTelephoneNumberList
    {
        //public List<PhoneData> PhoneData { get; set; }
    }

    public class ServiceData
    {
        //public TelehealthCapable TelehealthCapable { get; set; }  Causes problems
        public SecondaryServiceTypes SecondaryServiceTypes { get; set; }
        public AvailabilityCollection Availability_Collection { get; set; }
        public string Distance { get; set; }
        public SpecialisedServiceCategories SpecialisedServiceCategories { get; set; }
        public ServiceAddress ServiceAddress { get; set; }
        public string SiteName { get; set; }
        public string ServiceTypeDescription { get; set; }
        public string OrganisationID { get; set; }
        public ServiceDeliveryMethod ServiceDeliveryMethod { get; set; }
        public string SSID { get; set; }
        public ServiceTelephoneNumberList ServiceTelephoneNumberList { get; set; }
        public string RecStatus { get; set; }
        public string SiteID { get; set; }
        public string ServiceCategoryDescription { get; set; }
        public string OpenNow { get; set; }
    }
}
