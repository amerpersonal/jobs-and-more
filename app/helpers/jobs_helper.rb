module JobsHelper
  def categories
    Category.all
  end

  def companies
    Company.all
  end

  def categories_for_select
    categories.map { |c| [c.title, c.id] }
  end

  def companies_for_select
    companies.map { |c| [c.name, c.id] }
  end
end
