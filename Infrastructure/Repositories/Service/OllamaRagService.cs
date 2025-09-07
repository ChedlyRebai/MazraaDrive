using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Text.Json;
using Microsoft.SemanticKernel;
using Microsoft.SemanticKernel.Connectors.OpenAI;
using Microsoft.SemanticKernel.Embeddings;
using Microsoft.SemanticKernel.Text;
using Qdrant.Client;
using Qdrant.Client.Grpc;
using Core.Entities;
using Microsoft.EntityFrameworkCore;
using Core.Interfaces;
using Infrastructure.Data;

namespace Core.Services
{
    public class OllamaRagService : IRagService
    {
        private readonly Kernel _kernel;
        private readonly QdrantClient _qdrantClient;
        private readonly AppDbContext _context;
        private readonly ITextEmbeddingGenerationService _embeddingService;
        private const string CollectionName = "document_chunks";
        private const int ChunkSize = 1000;
        private const int ChunkOverlap = 200;

        public Task<string> QueryAsync(string question, string? context = null)
        {
            throw new NotImplementedException();
        }

        public Task IndexDocumentAsync(int documentId, string content, string metadata)
        {
            throw new NotImplementedException();
        }

        public Task<List<DocumentChunk>> RetrieveRelevantChunksAsync(string query, int topK = 5)
        {
            throw new NotImplementedException();
        }

        public Task<bool> RemoveDocumentFromIndexAsync(int documentId)
        {
            throw new NotImplementedException();
        }

        //         public OllamaRagService(AppDbContext context, string ollamaUrl = "http://localhost:11434")
        //         {
        //             _context = context;

        //             // Initialize Semantic Kernel with Ollama
        //             var kernelBuilder = Kernel.CreateBuilder();

        //             kernelBuilder.AddOpenAIChatCompletion(
        //                 modelId: "llama2",
        //                 apiKey: "ollama",
        //                 endpoint: new Uri(ollamaUrl)
        //             );

        //             kernelBuilder.AddOpenAITextEmbeddingGeneration(
        //                 modelId: "nomic-embed-text",
        //                 apiKey: "ollama"
        //             );

        //             _kernel = kernelBuilder.Build();
        //             _embeddingService = _kernel.GetRequiredService<ITextEmbeddingGenerationService>();

        //             // Initialize Qdrant client (vector database)
        //             _qdrantClient = new QdrantClient("localhost", 6334);

        //             InitializeCollectionAsync().Wait();
        //         }

        //         private async Task InitializeCollectionAsync()
        //         {
        //             try
        //             {
        //                 var collections = await _qdrantClient.ListCollectionsAsync();
        //                 if (!collections.Collections.Any(c => c.Name == CollectionName))
        //                 {
        //                     await _qdrantClient.CreateCollectionAsync(CollectionName, new VectorParams
        //                     {
        //                         Size = 768,
        //                         Distance = Distance.Cosine
        //                     });
        //                 }
        //             }
        //             catch (Exception ex)
        //             {
        //                 Console.WriteLine($"Error initializing Qdrant collection: {ex.Message}");
        //             }
        //         }

        //         public async Task IndexDocumentAsync(int documentId, string content, string metadata)
        //         {
        //             var document = await _context.Documents.FindAsync(documentId);
        //             if (document == null)
        //                 throw new ArgumentException("Document not found");

        //             // Split content into chunks
        //             var chunks = SplitTextIntoChunks(content, ChunkSize, ChunkOverlap);

        //             for (int i = 0; i < chunks.Count; i++)
        //             {
        //                 var chunk = chunks[i];
        //                 var embedding = await GenerateEmbeddingAsync(chunk);

        //                 // Store chunk in database
        //                 var documentChunk = new DocumentChunk
        //                 {
        //                     DocumentId = documentId,
        //                     Content = chunk,
        //                     ChunkIndex = i,
        //                     Embedding = JsonSerializer.Serialize(embedding)
        //                 };

        //                 _context.DocumentChunks.Add(documentChunk);
        //                 await StoreInVectorDbAsync(documentId, i, chunk, embedding, metadata);
        //             }

        //             document.IsIndexed = true;
        //             document.IndexedAt = DateTime.UtcNow;
        //             await _context.SaveChangesAsync();
        //         }

        //         public async Task<List<DocumentChunk>> RetrieveRelevantChunksAsync(string query, int topK = 5)
        //         {
        //             var queryEmbedding = await GenerateEmbeddingAsync(query);
        //             var relevantChunks = new List<DocumentChunk>();

        //             try
        //             {
        //                 // CORRECTED: Convert float[] to ReadOnlyMemory<float> and use proper parameter names
        //                 var searchResult = await _qdrantClient.SearchAsync(
        //                     collectionName: CollectionName,
        //                     vector: new ReadOnlyMemory<float>(queryEmbedding), // Convert to ReadOnlyMemory<float>
        //                     limit: (ulong)topK,
        //                     payloadSelector: new WithPayloadSelector { Enable = true }
        //                 );

        //                 foreach (var scoredPoint in searchResult)
        //                 {
        //                     if (scoredPoint.Payload.TryGetValue("document_id", out var docIdValue) &&
        //                         scoredPoint.Payload.TryGetValue("chunk_index", out var chunkIndexValue))
        //                     {
        //                         int documentId = GetIntFromValue(docIdValue);
        //                         int chunkIndex = GetIntFromValue(chunkIndexValue);

        //                         if (documentId > 0 && chunkIndex >= 0)
        //                         {
        //                             var chunk = await _context.DocumentChunks
        //                                 .FirstOrDefaultAsync(c => c.DocumentId == documentId && c.ChunkIndex == chunkIndex);

        //                             if (chunk != null)
        //                             {
        //                                 chunk.SimilarityScore = scoredPoint.Score;
        //                                 relevantChunks.Add(chunk);
        //                             }
        //                         }
        //                     }
        //                 }
        //             }
        //             catch (Exception ex)
        //             {
        //                 Console.WriteLine($"Error searching Qdrant: {ex.Message}");
        //                 relevantChunks = await FallbackSimilaritySearchAsync(query, topK);
        //             }

        //             return relevantChunks.OrderByDescending(c => c.SimilarityScore).ToList();
        //         }

        //         private int GetIntFromValue(Google.Protobuf.WellKnownTypes.Value value)
        //         {
        //             return value.KindCase switch
        //             {
        //                 Google.Protobuf.WellKnownTypes.Value.KindOneofCase.NumberValue => (int)value.NumberValue,
        //                 Google.Protobuf.WellKnownTypes.Value.KindOneofCase.StringValue => int.TryParse(value.StringValue, out int result) ? result : -1,
        //                 _ => -1
        //             };
        //         }

        //         public async Task<string> QueryAsync(string question, string? context = null)
        //         {
        //             if (string.IsNullOrEmpty(context))
        //             {
        //                 var relevantChunks = await RetrieveRelevantChunksAsync(question, 3);
        //                 context = string.Join("\n\n", relevantChunks.Select(c => c.Content));
        //             }

        //             var prompt = $"""
        //             Use the following context to answer the question. If you don't know the answer, just say so.

        //             Context:
        //             {context}

        //             Question: {question}

        //             Answer:
        //             """;

        //             var result = await _kernel.InvokePromptAsync<string>(prompt);
        //             return result;
        //         }

        //         public async Task<bool> RemoveDocumentFromIndexAsync(int documentId)
        //         {
        //             try
        //             {
        //                 var chunks = await _context.DocumentChunks
        //                     .Where(c => c.DocumentId == documentId)
        //                     .ToListAsync();

        //                 _context.DocumentChunks.RemoveRange(chunks);

        //                 var filter = new Filter
        //                 {
        //                     Must =
        //                     {
        //                         new Condition
        //                         {
        //                             Field = new FieldCondition
        //                             {
        //                                 Key = "document_id",
        //                                 Match = new Match { Integer = documentId }
        //                             }
        //                         }
        //                     }
        //                 };

        //                 await _qdrantClient.DeleteAsync(CollectionName, filter);

        //                 var document = await _context.Documents.FindAsync(documentId);
        //                 if (document != null)
        //                 {
        //                     document.IsIndexed = false;
        //                     document.IndexedAt = null;
        //                 }

        //                 await _context.SaveChangesAsync();
        //                 return true;
        //             }
        //             catch (Exception ex)
        //             {
        //                 Console.WriteLine($"Error removing document from index: {ex.Message}");
        //                 return false;
        //             }
        //         }

        //         private List<string> SplitTextIntoChunks(string text, int chunkSize, int chunkOverlap)
        //         {
        // #pragma warning disable SKEXP0050
        //             var lines = TextChunker.SplitPlainTextLines(text, chunkSize / 2);
        //             return TextChunker.SplitPlainTextParagraphs(lines, chunkSize, chunkOverlap);
        // #pragma warning restore SKEXP0050
        //         }

        //         private async Task<float[]> GenerateEmbeddingAsync(string text)
        //         {
        //             var embedding = await _embeddingService.GenerateEmbeddingAsync(text);
        //             return embedding.ToArray();
        //         }

        //         private async Task StoreInVectorDbAsync(int documentId, int chunkIndex, string content, float[] embedding, string metadata)
        //         {
        //             try
        //             {
        //                 var point = new PointStruct
        //                 {
        //                     Id = (ulong)(documentId * 1000 + chunkIndex),
        //                     Vectors = new Vectors
        //                     {
        //                         Vector = new Vector
        //                         {
        //                             Data = { embedding }
        //                         }
        //                     },
        //                     Payload =
        //                     {
        //                         ["document_id"] = documentId,
        //                         ["chunk_index"] = chunkIndex,
        //                         ["content"] = content,
        //                         ["metadata"] = metadata
        //                     }
        //                 };

        //                 await _qdrantClient.UpsertAsync(CollectionName, new[] { point });
        //             }
        //             catch (Exception ex)
        //             {
        //                 Console.WriteLine($"Error storing in vector DB: {ex.Message}");
        //             }
        //         }

        //         private async Task<List<DocumentChunk>> FallbackSimilaritySearchAsync(string query, int topK)
        //         {
        //             var queryEmbedding = await GenerateEmbeddingAsync(query);
        //             var allChunks = await _context.DocumentChunks.ToListAsync();

        //             foreach (var chunk in allChunks)
        //             {
        //                 if (chunk.EmbeddingVector == null && !string.IsNullOrEmpty(chunk.Embedding))
        //                 {
        //                     chunk.EmbeddingVector = JsonSerializer.Deserialize<float[]>(chunk.Embedding);
        //                 }

        //                 if (chunk.EmbeddingVector != null)
        //                 {
        //                     chunk.SimilarityScore = CosineSimilarity(queryEmbedding, chunk.EmbeddingVector);
        //                 }
        //             }

        //             return allChunks.OrderByDescending(c => c.SimilarityScore).Take(topK).ToList();
        //         }

        //         private float CosineSimilarity(float[] vecA, float[] vecB)
        //         {
        //             var dotProduct = vecA.Zip(vecB, (a, b) => a * b).Sum();
        //             var magnitudeA = Math.Sqrt(vecA.Sum(x => x * x));
        //             var magnitudeB = Math.Sqrt(vecB.Sum(x => x * x));
        //             return (float)(dotProduct / (magnitudeA * magnitudeB));
        //         }



    }

    
}