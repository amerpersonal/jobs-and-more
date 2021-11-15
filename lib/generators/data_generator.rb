module Generators
  module DataGenerator

    def dummy_persons
      url = "https://randomuser.me/api/?results=100&inc=name,location,email,dob,cell,picture"

      response = Faraday.get url

      people = []
      if (response.status == 200)
        people = JSON.parse(response.body)['results']
      else
        Rails.logger.info("Request to URL #{url} failed with #{response.status} : #{response.body}")
      end

      people
    end

    def mock_companies
      [
        { name: 'Ingemark', email: 'info@ingemark.com' },
        { name: 'Amers', email: 'amer.zildzic@gmail.com' },
        { name: 'Ministry of Programming', email: 'info@mop.ba' },
        { name: 'Personal', email: 'info@personal.ba' },
        { name: 'Logosoft', email: 'info@logosoft.ba' }
      ]
    end

    def mock_jobs_attributes
      [
        {
          title: 'Software Developer',
          description: 'Work full-time at top Silicon Valley or other U.S. companies.
                  Earn a better salary compared to local companies in your city.
                  Grow as a developer by working with the smartest engineers from all over the world.
                  Get paid monthly directly to your bank account. Forget about issues with PayPal or Payoneer.' },

        {
          title: 'UI/UX designer',
          description: 'UX-UI Designers are generally responsible for collecting, researching,
                  investigating and evaluating user requirements. Their responsibility is
                  to deliver an outstanding user experience providing an exceptional and intuitive application design.'
        }
      ]
    end

    def mock_categories
      categories_names = ['IT', 'Cleaning', 'Construction', 'Mechanical engineering', 'Architecture', 'Sales', 'Support']

      categories_names.map { |c| { title: c } }
    end

    def mock_full_jobs(start_date, duration, step, companies, categories)
      job_attrs = []

      companies.each do |company|
        mock_jobs_attributes.each do |position|
          attrs = {
            title: position[:title],
            description: position[:description],
            start_date: start_date,
            end_date: start_date + duration,
            company: company,
            category: categories[0]
          }

          job_attrs.push(attrs)
          start_date = start_date + step
        end
      end

      job_attrs
    end
  end
end
