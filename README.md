# WhereUnlessBlank

The behavior of "where" when querrying for a null value is include the statment and return rows with null value.

This gem creates a simple way to remove statements with null/blank values from query.

Very usefull for search forms avoiding you to worry about unfilled fields.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'where_unless_blank'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install where_unless_blank

## Usage
After install this gem three new methods will be available on `ActiveRecord::Base` instances.
`where_unless_blank`, `ilike_unless_blank` and `like_unless_blank`.

```
Person.where_unless_blank(age: params[:age]).ilike_unless_blank(name: params[:name])
Person.ilike_unless_blank(name: params[:name], surname: params[:surname])
Person.like_unless_blank(name: params[:name], surname: params[:surname])
```

If u like short names u can use:

`wub` or `where_ub` for `where_unless_blank`

`iub` or `ilike_ub` for `ilike_unless_blank`

`lub` or `like_ub` for `like_unless_blank`

If all params are blank it will behaivor like `all` method.


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/platbr/where_unless_blank.
