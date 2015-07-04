using HealthBuddy.Api.Model;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;

namespace HealthBuddy.Api.Nhsd
{
    public class NhsdService
    {
        static void Main(string[] args)
        {
            var svc = new NhsdService();
            var result = svc.Search(new Location { Suburb = "Adelaide", Postcode = "5000" });
        }

        public List<Facility> Search(Location loc)
        {

            var requestDic = new Dictionary<string, string>
            {
                {"usepostcoderadialsearch", "true"},
                {"suburbpostcodedata", JsonConvert.SerializeObject(new { SiteSearchSuburbPostcodeParams = new { SuburbPostcode = loc.Suburb + " " + loc.Postcode, SearchSurroundingSuburbs = true } })},
                {"startpos", "1"},
                {"servicecategory", "General Practice/GP (doctor)"},
                {"SearchSiteAddress", "true"},
                {"SearchServiceCoverageArea", "false"},
                {"SearchServiceAddress", "false"},
                {"orderby", "Distance"},
                {"endpos", "5"},
                {"deliverymethod", "{\"string\":\"Site Visit\"}"},
                {"callback", "angular.callbacks._4"},
                {"apikey", "nhccn-9vSRwUZooHY2BebTOvAhA93n"},
                {"alwaysreturn", "5"}
            };

            string url = "https://api.nhsd.com.au/nhsd/v2.8/rest/sitesearch?";
            foreach (var entry in requestDic)
            {
                url += entry.Key + "=" + Uri.EscapeDataString(entry.Value) + "&";
            }

            WebRequest req = WebRequest.Create(url);

            StreamReader sr = new StreamReader(req.GetResponse().GetResponseStream());
            WebResponse response = req.GetResponse();
            string responseString = sr.ReadToEnd();
            string json = responseString.Substring(requestDic["callback"].Length + 1, responseString.Length - requestDic["callback"].Length - 2);
            RootObject result = JsonConvert.DeserializeObject<RootObject>(json);
            FacilitySearchResult searchResult = new FacilitySearchResult();
            var facilities = result.SiteSearchResponse.SiteSearchResult.ResultList.SiteData.Select(a => new Facility
                {
                    Location = new Location
                    {
                        Address = a.SiteAddress.Address_Line_1 + " " + a.SiteAddress.Address_Line_2 + " " + a.SiteAddress.Address_Line_3,
                        Suburb = a.SiteAddress.Suburb,
                        Postcode = a.SiteAddress.Postcode,
                        Latitude = a.SiteAddress.Latitude,
                        Longitude = a.SiteAddress.Longitude
                    },
                    Name = a.OrganisationName
                }).ToList();
            return facilities;
        }

    }
}
