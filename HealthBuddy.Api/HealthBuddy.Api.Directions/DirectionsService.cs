using GoogleMapsApi.Entities.Directions.Request;
using GoogleMapsApi.Entities.Geocoding.Response;
using HealthBuddy.Api.Model;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;

namespace HealthBuddy.Api.Directions
{
    public class DirectionsService
    {
        //const string apiKey = "AIzaSyDIwRxZ2MUNnakY3_YQmW0XGua0_HncBt0";
        const string apiKey = "AIzaSyAjqWnOnzbYAuGKfRUKA3DWW1abQbKV_0Q";

        const string URL = "https://maps.googleapis.com/maps/api/directions/json?";

        static void Main(string[] args)
        {
            DirectionsService ds = new DirectionsService();
            Location origin = new Location { Suburb = "Sydney" };
            Location destination = new Location { Suburb = "Melbourne" };
            var result = ds.GetTravelTimes(origin, destination);
            foreach (var entry in result)
            {
                Console.WriteLine("{0}: {1}", entry.Mode, entry.Minutes);
            }
            Console.ReadLine();
        }

        private string StringForm(Location loc)
        {
            if (!string.IsNullOrEmpty(loc.Latitude) && !string.IsNullOrEmpty(loc.Longitude))
            {
                return loc.Latitude + "," + loc.Longitude;
            }
            return loc.Address + " " + loc.Suburb + " " + loc.Postcode + " Australia";
        }

        public List<TravelTime> GetTravelTimes(Location origin, Location destination)
        {
            var list = new List<TravelTime>();
            GetTravelTimeForMode(origin, destination, list, TravelMode.Driving);
            GetTravelTimeForMode(origin, destination, list, TravelMode.Transit);
            return list;
        }

        private void GetTravelTimeForMode(Location origin, Location destination, List<TravelTime> list, TravelMode mode)
        {
            var time = this.GetTravelTime(origin, destination, mode);
            if (time.HasValue)
            {
                list.Add(
                    new TravelTime
                    {
                        Mode = mode.ToString(),
                        Days = time.Value.Days,
                        Hours = time.Value.Hours,
                        Minutes = time.Value.Minutes,
                        Seconds = time.Value.Seconds
                    });
            }
        }

        public TimeSpan? GetTravelTime(Location origin, Location destination, TravelMode mode)
        {
            string originString = StringForm(origin);
            string destinationString = StringForm(destination);
            var request = new DirectionsRequest()
            {
                ApiKey = apiKey,
                Origin = originString,
                Destination = destinationString,
                TravelMode = mode,
                DepartureTime = DateTime.Now,
            };

            var response = GoogleMapsApi.GoogleMaps.Directions.Query(request);

            var route = response.Routes.FirstOrDefault();
            if (route != null)
            {
                // For routes that contain no waypoints, the route will consist of a single "leg".
                var leg = route.Legs.FirstOrDefault();
                if (leg != null)
                {
                    // Get the origin and destination's lat/long if not yet known.
                    origin.Latitude = origin.Latitude ?? leg.StartLocation.Latitude.ToString();
                    origin.Longitude = origin.Longitude ?? leg.StartLocation.Longitude.ToString();

                    destination.Latitude = destination.Latitude ?? leg.EndLocation.Latitude.ToString();
                    destination.Longitude = destination.Longitude ?? leg.EndLocation.Longitude.ToString();

                    return leg.Duration.Value;
                }
            }
            return null;
        }

        static object GetDirections2(string origin, string destination)
        {
            string url = URL;
            url += "&origin=" + origin;
            url += "&destination=" + destination;
            url += "&key=" + apiKey;
            url += "&region=au";
            var req = HttpWebRequest.Create(url);
            var response = req.GetResponse();
            StreamReader sr = new StreamReader(response.GetResponseStream());
            return JsonConvert.DeserializeObject(sr.ReadToEnd());

        }

        public void Lookup(Location loc)
        {
            var request = new GoogleMapsApi.Entities.Geocoding.Request.GeocodingRequest
            {
                Location = new GoogleMapsApi.Entities.Common.Location(double.Parse(loc.Latitude), double.Parse(loc.Longitude)),
                ApiKey = apiKey
            };

            var response = GoogleMapsApi.GoogleMaps.Geocode.Query(request);

            var result = response.Results.FirstOrDefault();
            if (result != null)
            {
                loc.Suburb = AddressComponent(result, "locality");
                loc.Postcode = AddressComponent(result, "postal_code");
                loc.Address = AddressComponent(result, "street_number");
                loc.Address += " " + AddressComponent(result, "route");
            }
        }

        private string AddressComponent(Result result, string componentName)
        {
            var component = result.AddressComponents.FirstOrDefault(a => a.Types.Contains(componentName));
            if (component != null)
            {
                return component.LongName;
            }
            return null;
        }
    }
}
