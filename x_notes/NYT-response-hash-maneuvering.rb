article_snippet = response_hash["response"]["docs"][0]["snippet"] #string
article_headline = response_hash["response"]["docs"][0]["headline"] # hash {"main" => string }
article_id = response_hash["response"]["docs"][0]["_id"]

Filter out
# obituaries - where (response_hash["response"]["docs"][1]["news_desk"] = "Obituary")


response_hash["response"]["docs"][1]["news_desk"]

#this isn't working...
def list_news_desk(response)
	response["response"]["docs"].collect do |article|
		article["news_desk"]
	end
end

response = {
	"url" => "www.nyt.com",
	"snippet" => "THEY are calling it ''Harvey's Mondrian'' at the Museum of Modern Art.  The ''Mondrian'' that Harvey Tulcensky, an artist who is employed as an art-handler at the museum, painted in eight hours one Sunday not long ago is part of a juggling act that...",
 "lead_paragraph"=> "THEY are calling it ''Harvey's Mondrian'' at the Museum of Modern Art. The ''Mondrian'' that Harvey Tulcensky, an artist who is employed as an art-handler at the museum, painted in eight hours one Sunday not long ago is part of a juggling act that the museum is performing to redesign its own house. The place has been in transformation since the great Picasso exhibition of 1980 and closed entirely since the first of the year; when it reopens May 17, the museum will be more than double its former size, with its inner spaces all shifted around. The Modern Museum has been closed as part of a four-year, $55 million expansion and renovation that saw a residential condominium superimposed on it. The architects have the final word on the building, but it is the art curators and department directors who have the final say on what is being done inside. Each curator or director - those for paintings and sculpture, drawings, or photography - is the boss on how each area's interior space will look when the public enters the museum again in May.",
 "abstract"=>nil,
 "print_page"=>"13",
 "blog"=>[],
 "source"=>"The New York Times", 
 "multimedia"=>[],
 "headline"=>{"main"=>"THE FINE ART OF MODERNIZING THE MODERN"},
 "keywords"=>[{"name"=>"subject", "value"=>"TERMS NOT AVAILABLE"}],
 "pub_date"=>"1984-03-06T00:00:00Z",
 "document_type"=>"article",
 "news_desk"=>"Cultural Desk",
 "section_name"=>"Arts",
 "subsection_name"=>nil,
 "byline"=>
  {"person"=>
    [{"organization"=>"",
      "role"=>"reported",
      "firstname"=>"Nan",
      "rank"=>1,
      "lastname"=>"ROBERTSON"}],
   "original"=>"By NAN ROBERTSON"},
 "type_of_material"=>"News",
 "_id"=>"4fd14fd78eb7c8105d630b01",
 "word_count"=>1275
}