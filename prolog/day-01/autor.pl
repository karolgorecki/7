% Make a simple knowledge base. Represent some of your favorite books and authors.
autor(aMickiewicz, dziady).
autor(aMickiewicz, panTadeusz).
autor(bPrus, lalka).
autor(wSzekspir, makbet).
autor(jKochanowski, treny).
autor(jKochanowski, szachy).
autor(jKochanowski, zgoda).
autor(jSlowacki, kordian).

% Find all books in your knowledge base written by one author.
/*
| ?- autor(aMickiewicz, What).
What = dziady ? a
What = panTadeusz

| ?- autor(What, dziady).     
What = aMickiewicz ? a 
*/