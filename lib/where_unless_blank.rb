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

    class <<self
      alias_method :wub, :where_unless_blank
      alias_method :where_ub, :where_unless_blank
      alias_method :iub, :ilike_unless_blank
      alias_method :ilike_ub, :ilike_unless_blank
      alias_method :lub, :like_unless_blank
      alias_method :like_ub, :like_unless_blank
    end
  end

  def self.build_opts(opts, operator = '=', prefix='', sufix='')
    opts.delete_if {|k,v| v.blank? } if opts.kind_of?(Hash)
    [opts.map{|k,v| "#{k} #{operator} ?"}.join(' AND '), opts.values.map{|v| "#{prefix}#{v}#{sufix}"}].flatten unless opts.blank?
  end
end