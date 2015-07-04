using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HealthBuddy.Api.EventHub
{
    class EventHubMessage
    {
        public string time { get; set; }
        public string localtime { get; set; }
        public string topic { get; set; }
        public int tweetcount { get; set; }
        public int sentimentscore { get; set; }
        public string sentimentlabel { get; set; }
        public int neutralscore { get; set; }
        public int minscore { get; set; }
        public int maxscore { get; set; }
    }
}
