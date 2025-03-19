# SolidCache.configuration do |config|
#     config.key_hash_generator = ->(key) { Zlib.crc32(key) }
# end