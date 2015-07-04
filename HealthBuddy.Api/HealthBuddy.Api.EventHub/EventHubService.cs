using Microsoft.ServiceBus;
using Microsoft.ServiceBus.Messaging;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace HealthBuddy.Api.EventHub
{
    public class EventService
    {
        static string partitionId = "0";
        static string eventHubName = "dtieventhubfromstream";
        static string offset = null;
        const string consumerGroupName = "GovHackStreamConsumerGroup";
        static long receiverEpoch = 0;

        static Dictionary<string, int> TwitterSentiment { get; set; }

        static Thread WorkerThread;

        public static int? GetTwitterSentiment(string hashtag)
        {
            if (TwitterSentiment == null)
            {
                TwitterSentiment = new Dictionary<string, int>();
            }

            if (WorkerThread == null)
            {
                StartThread();
            }
            Random random = new Random();
            var entry = TwitterSentiment.Values.ToList().Skip(random.Next(TwitterSentiment.Count)).FirstOrDefault();
            if (entry != null)
            {
                return entry;
            }

            return null;
        }

        private static void StartThread()
        {
            WorkerThread = new Thread(new ThreadStart(() => MessageProcessingWithReceiveLoop().Wait()));
            WorkerThread.Start();
        }

        private static async Task MessageProcessingWithReceiveLoop()
        {
            string eventHubConnectionString = GetServiceBusConnectionString();
            EventHubClient eventHubClient = EventHubClient.CreateFromConnectionString(eventHubConnectionString, eventHubName);
            EventHubConsumerGroup consumerGroup = eventHubClient.GetConsumerGroup(consumerGroupName);
            EventHubReceiver consumer;

            if (offset != null)
            {
                consumer = await consumerGroup.CreateReceiverAsync(partitionId, offset, receiverEpoch); // All messages 
            }
            else
            {
                // Default to get oldest message 
                consumer = await consumerGroup.CreateReceiverAsync(partitionId, receiverEpoch); // All messages 
            }

            do
            {
                try
                {
                    var message = await consumer.ReceiveAsync();
                    if (message != null)
                    {
                        string msg;
                        var info = message.GetBytes();
                        msg = Encoding.UTF8.GetString(info);

                        Console.WriteLine("Processing: Seq number {0} Offset {1}  Partition {2} EnqueueTimeUtc {3} Message {4}",
                            message.SequenceNumber, message.Offset, message.PartitionKey, message.EnqueuedTimeUtc.ToShortTimeString(), msg);

                        var msgobj = JsonConvert.DeserializeObject<EventHubMessage>(msg);

                        TwitterSentiment[msgobj.topic] = msgobj.sentimentscore;
                    }
                }
                catch (Exception exception)
                {
                    Console.WriteLine("exception on receive {0}", exception.Message);
                }

            } while (true);
        }

        private static string GetServiceBusConnectionString()
        {
            //string connectionString = ConfigurationManager.AppSettings["Microsoft.ServiceBus.ConnectionString"];
            //if (string.IsNullOrEmpty(connectionString))
            //{
            //    Console.WriteLine("Did not find Service Bus connections string in appsettings (app.config)");
            //    return string.Empty;
            //}
            string conn = ServiceBusConnectionStringBuilder.CreateUsingSharedAccessKey(new Uri("sb://dtiservicebus.servicebus.windows.net"), "GovHackStreamReceiveApp", "6pZ1WoK74PBcKZbfAg6RFoynZuX8wMpR7T8YGZAwaZw=");
            //ServiceBusConnectionStringBuilder builder = new ServiceBusConnectionStringBuilder(connectionString);
            //builder.TransportType = TransportType.Amqp;
            return conn;
        }

    }
}
