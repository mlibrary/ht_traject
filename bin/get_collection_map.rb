require 'yaml'
require_relative '../lib/ht_traject/ht_print_holdings'
require 'pp'

db = HathiTrust::PrintHoldings::DB
sql = 'select collection, name from ht_institutions i join ht_collections c on c.original_from_inst_id = i.inst_id'

ccof = {}
db[sql].order(:collection).each do |h|
  ccof[h[:collection].downcase] = h[:name]
end

tmap_dir = File.expand_path(File.join("..", 'lib', 'translation_maps', 'ht'), File.dirname(__FILE__))
File.open(File.join(tmap_dir, 'collection_code_to_original_from.yaml'), 'w:utf-8') {|f| f.puts ccof.to_yaml}

