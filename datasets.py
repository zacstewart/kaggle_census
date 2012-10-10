import numpy as np

def readFile(filename, delimiter=','):
  f = open(filename, 'rb')
  header = f.readline().strip().split(delimiter)
  header_map = dict(zip(header, range(len(header))))
  csv_reader = csv.reader(f, delimiter=delimiter, quotechar='"')
  cols = (i for i in range(header_map['LAND_AREA'], len(header)))
  matrix = np.loadtxt(csv_reader, skiprows=1, usecols=cols)
  f.close()
  return (header, matrix)
