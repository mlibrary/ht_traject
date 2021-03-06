#################################
# COMMON HT STUFF
#################################

# Start off by building up a data structure representing all the 974s
# and stick it in ht_fields. Also, query the database for the print
# holdings along the way with #fill_print_holdings!

each_record do |r, context|

  itemset = HathiTrust::Traject::ItemSet.new

  r.each_by_tag('974') do |f|
    itemset.add HathiTrust::Traject::Item.new_from_974(f) if f['u']
  end

  context.clipboard[:ht][:has_items] = (itemset.size > 0)
  context.clipboard[:ht][:items] = itemset

end

# make use of the HathiTrust::ItemSet object stuffed into
# [:ht][:items] to pull out all the other stuff we need.


# Skip calling out to the print holdings database if I'm
# on a machine that doesn't have access
unless ENV['SKIP_PH']
  each_record do |r, context|
    context.clipboard[:ht][:items].fill_print_holdings! if context.clipboard[:ht][:has_items]
  end
end


to_field 'ht_availability_f_stored' do |record, acc, context|
  acc.concat context.clipboard[:ht][:items].us_availability if context.clipboard[:ht][:has_items]
end

to_field 'ht_availability_intl_f_stored' do |record, acc, context|
  acc.concat context.clipboard[:ht][:items].intl_availability if context.clipboard[:ht][:has_items]
end

to_field 'ht_count_i_stored_single' do |record, acc, context|
  acc << context.clipboard[:ht][:items].size if context.clipboard[:ht][:has_items]
end

to_field 'ht_heldby_f_stored' do |record, acc, context|
  acc.concat context.clipboard[:ht][:items].print_holdings if context.clipboard[:ht][:has_items]
end

to_field 'ht_id_f' do |record, acc, context|
  acc.concat context.clipboard[:ht][:items].ht_ids if context.clipboard[:ht][:has_items]
end

to_field 'ht_id_z' do |record, acc, context|
  context.clipboard[:ht][:items].each do |item|
    acc << item.display_string
  end
end

to_field 'ht_id_update_i_stored' do |record, acc, context|
  acc.concat context.clipboard[:ht][:items].last_update_dates if context.clipboard[:ht][:has_items]
  acc.delete_if { |x| x.empty? }
end

to_field 'ht_rightscode_f_stored' do |record, acc, context|
  acc.concat context.clipboard[:ht][:items].rights_list if context.clipboard[:ht][:has_items]
end


to_field 'ht_source_z' do |record, acc, context|
  cc_to_of = Traject::TranslationMap.new('ht/collection_code_to_original_from')
  acc.concat context.clipboard[:ht][:items].collection_codes.map { |x| cc_to_of[x] } if context.clipboard[:ht][:has_items]
end
