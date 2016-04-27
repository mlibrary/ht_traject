

#####################################
############ HATHITRUST STUFF #######
#####################################
#

## OK, so one weird thing we need to do is have different ht_json docs for mirlyn vs hathitrust, since they have differently-formatted 974s. Pass in the :ht symbol only for HT and the to_json will do the Right Thing.

to_field 'ht_json' do |record, acc, context|
  acc << context.clipboard[:ht][:items].to_json(:ht) if context.clipboard[:ht][:has_items]
end


# callnumber from the bib, instead of the item
to_field 'callnumber', extract_marc('050ab:090ab')
to_field 'callnoletters', extract_marc('050ab:090ab', :first=>true) do |rec, acc|
  unless acc.empty?
    m = /\A([A-Za-z]+)/.match(acc[0])
    acc[0] = m[1] if m
  end
end


# make use of the HathiTrust::ItemSet object stuffed into
# [:ht][:items] to pull out all the other stuff we need.


to_field 'ht_searchonly' do |record, acc, context|
  acc << !context.clipboard[:ht][:items].us_fulltext?
end

to_field 'ht_searchonly_intl' do |record, acc, context|
  acc << !context.clipboard[:ht][:items].intl_fulltext? 
end


to_field 'language008_full', marc_languages("008[35-37]") do |record, acc|
  acc.map! {|x| x.gsub(/\|/, '')}
end
