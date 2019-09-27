require "where_unless_blank/version"
require "where_unless_blank/engine"

module WhereUnlessBlank
  extend ActiveSupport::Concern
  included do
    def self.where_unless_blank(opts = :chain)
      opts.delete_if {|k,v| v.blank? } if opts.kind_of?(Hash)
      where(opts)
    end
    def self.ilike_unless_blank(opts = :chain)
      operator_unless_blank(opts, 'ilike', '%', '%')
    end
    def self.like_unless_blank(opts = :chain)
      operator_unless_blank(opts, 'like', '%', '%')
    end
    def self.operator_unless_blank(opts, operator = '=', prefix = '', sufix = '')
      where(WhereUnlessBlank.build_opts(opts, operator, prefix, sufix))
    end
  end
  def self.build_opts(opts, operator = '=', prefix='', sufix='')
    opts.delete_if {|k,v| v.blank? } if opts.kind_of?(Hash)
    [opts.map{|k,v| "#{k} #{operator} ?"}.join(' AND '), opts.values.map{|v| "#{prefix}#{v}#{sufix}"}].flatten unless opts.blank?
  end
end