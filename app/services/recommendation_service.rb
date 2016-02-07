class RecommendationService < Struct.new(:user)

  def self.for(yelp_id)
    user = User.find_by_yelp_id(yelp_id)
    new(user)
  end

  def recommendations
    { recommendations:
      {
        "W2RFJg1N_MzuI8I42MQ2VA": 29,
        "frvS-8am51BA9b4G1cbX9Q": 25,
        "TVUIj9fsVF3JwvHkz_6-KQ": 23,
        "ePiK7IM1ZWQiwuivFwKE1Q": 21,
        "miDl22E-Vx1bTBIQXmYF9g": 21,
        "QeD2Nre6KyYf1pci4W9QgA": 18,
        "wtoJcKF1MMapd6nW-8a21g": 18,
        "CdZKeUZtCjqV0ni2NeFlgA": 18,
        "Qi61w8ZGqtipWfoALZq1hw": 17,
        "0Q7ftIbv1r7Jiupuxi7WDw": 15
      }
    }
  end

  def businesses
    business_list = ["W2RFJg1N_MzuI8I42MQ2VA",
                     "frvS-8am51BA9b4G1cbX9Q",
                     "TVUIj9fsVF3JwvHkz_6-KQ",
                     "ePiK7IM1ZWQiwuivFwKE1Q",
                     "miDl22E-Vx1bTBIQXmYF9g",
                     "QeD2Nre6KyYf1pci4W9QgA",
                     "wtoJcKF1MMapd6nW-8a21g",
                     "CdZKeUZtCjqV0ni2NeFlgA",
                     "Qi61w8ZGqtipWfoALZq1hw",
                     "0Q7ftIbv1r7Jiupuxi7WDw"]
    business_list.collect{|b| BusinessMapper.get_by_yelp_id(b) }
  end

end
