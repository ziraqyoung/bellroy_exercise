module BigFiveResults
  RESULTS_ENDPOINT = "https://www.personalitytest.net/cgi-bin/shortipipneo3.cgi?View=69481551311787926994210&VX=VX1&VY=24&VZ=K112&Q1=4&Q2=2&Q3=5&Q4=2&Q5=2&Q6=5&Q7=1&Q8=5&Q9=4&Q10=2&Q11=2&Q12=2&Q13=5&Q14=4&Q15=4&Q16=4&Q17=4&Q18=2&Q19=5&Q20=4&Q21=1&Q22=2&Q23=4&Q24=4&Q25=2&Q26=4&Q27=4&Q28=2&Q29=4&Q30=4&Q31=4&Q32=2&Q33=2&Q34=4&Q35=4&Q36=4&Q37=1&Q38=4&Q39=4&Q40=2&Q41=2&Q42=4&Q43=4&Q44=4&Q45=4&Q46=2&Q47=2&Q48=2&Q49=2&Q50=4&Q51=2&Q52=2&Q53=4&Q54=4&Q55=4&Q56=5&Q57=1&Q58=2&Q59=4&Q60=4&Q61=4&Q62=4&Q63=4&Q64=2&Q65=4&Q66=4&Q67=2&Q68=2&Q69=4&Q70=2&Q71=4&Q72=2&Q73=4&Q74=4&Q75=4&Q76=2&Q77=4&Q78=2&Q79=4&Q80=4&Q81=2&Q82=2&Q83=5&Q84=2&Q85=5&Q86=2&Q87=4&Q88=2&Q89=4&Q90=4&Q91=4&Q92=2&Q93=4&Q94=2&Q95=4&Q96=4&Q97=2&Q98=4&Q99=4&Q100=2&Q101=2&Q102=4&Q103=4&Q104=4&Q105=4&Q106=4&Q107=4&Q108=2&Q109=2&Q110=4&Q111=2&Q112=4&Q113=4&Q114=2&Q115=2&Q116=4&Q117=4&Q118=4&Q119=2&Q120=4"
  API_ENDPOINT = "https://recruitbot.trikeapps.com/api/v1/roles/bellroy-tech-team-recruit/big_five_profile_submissions"
  LINE_FORMAT = /(?<category>[a-zA-Z]+([- ]*|[a-zA-Z]*)*)(\.*|\s+|.)(?<score>\d{1,3})/
  MODELS = {
    'EXTRAVERSION': [
      'Friendliness',
      'Gregariousness',
      'Assertiveness',
      'Activity Level',
      'Excitement-Seeking',
      'Cheerfulness'
    ],
    'AGREEABLENESS': [
      'Trust',
      'Morality',
      'Altruism',
      'Cooperation',
      'Modesty',
      'Sympathy'
    ],
    'CONSCIENTIOUSNESS': [
      'Self-Efficacy',
      'Orderliness',
      'Dutifulness',
      'Achievement-Striving',
      'Self-Discipline',
      'Cautiousness'
    ],
    'NEUROTICISM': [
      'Anxiety',
      'Anger',
      'Depression',
      'Self-Consciousness',
      'Immoderation',
      'Vulnerability'
    ],
    'OPENNESS TO EXPERIENCE': [
      'Imagination',
      'Artistic Interests',
      'Emotionality',
      'Adventurousness',
      'Intellect',
      'Liberalism'
    ],
  }
end
