using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http.Headers;
using System.Web.Http;

namespace HealthBuddy.Api
{
    public static class WebApiConfig
    {
        public static void Register(HttpConfiguration config)
        {
            // Web API configuration and services

            // Web API routes
            config.MapHttpAttributeRoutes();

            config.Routes.MapHttpRoute(
                name: "DefaultApi",
                routeTemplate: "api/{controller}/{id}",
                defaults: new { id = RouteParameter.Optional }
            );

            config.Routes.MapHttpRoute(
                name: "Travel",
                routeTemplate: "api/Travel/{origin}/{destination}",
                defaults: new { controller = "Travel" }
            );

            config.Formatters.JsonFormatter.SupportedMediaTypes.Add(new MediaTypeHeaderValue("application/json"));

            config.MessageHandlers.Add(new ResponseHandler());
        }
    }

    class ResponseHandler : System.Net.Http.MessageProcessingHandler
    {

        protected override System.Net.Http.HttpRequestMessage ProcessRequest(System.Net.Http.HttpRequestMessage request, System.Threading.CancellationToken cancellationToken)
        {
            return request;
        }

        protected override System.Net.Http.HttpResponseMessage ProcessResponse(System.Net.Http.HttpResponseMessage response, System.Threading.CancellationToken cancellationToken)
        {
            response.Headers.Add("Access-Control-Allow-Origin", "*");
            return response;
        }
    }
}
