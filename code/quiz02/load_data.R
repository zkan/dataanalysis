# Code for downloading a file from the Internet

fileUrl <- "https://dl.dropbox.com/u/7710864/data/csv_hid/ss06hid.csv"
download.file(fileUrl, destfile = "../../data/input/ss06hid.csv", method = "curl")
dateDownloaded <- date()

