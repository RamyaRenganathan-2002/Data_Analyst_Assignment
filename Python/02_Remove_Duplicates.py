def remove_duplicates(text):
  result = ""
  for char in text:
    if char not in result:
      result += char
  print (result)

remove_duplicates("programming")
# output: progamin
remove_duplicates("bioinformatics")
# output: bionfrmatcs
remove_duplicates("formula one")
# output: formula ne
remove_duplicates("data analysis")
# output: dat nlysi
