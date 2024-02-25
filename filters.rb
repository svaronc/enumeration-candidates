# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program
# method to find the candidate by id
def find(id)
  index = @candidates.find_index {|candidate| candidate[:id] == id}
  index ? @candidates[index] : nil
end
  # method to validate the experience of the candidate
def experienced?(candidate)
  if candidate[:years_of_experience] > 2
    return true
  else 
    return false
  end
end
  
def qualified_candidates(candidates)
    # Your code Here
    qualified = []
    candidates.each do |candidate|
      if experienced?(candidate) && candidate[:github_points] > 100 && candidate_languages(candidate) && candidate[:age] > 17 
        qualified.push(candidate) && applied_date(candidate)
      end
    end
    return qualified
end
  
  # More methods will go below

def candidate_languages(candidate)
  return candidate[:languages].include?('Ruby' || 'Python')
end

def applied_date(candidate)
  date_difference = Date.today - candidate[:date_applied]
  if date_difference < 15
    return true 
  end
end

def ordered_by_qualifications(candidates)
  return candidates.sort_by! do |candidate|
    [-candidate[:years_of_experience], -candidate[:github_points]]
  end
end