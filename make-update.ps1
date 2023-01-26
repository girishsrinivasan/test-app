

git pull

$comment = "Updated {0}" -f (get-date)

$comment | Out-File -Encoding ascii ReadMe.md



git add .
git commit -a -m $comment
git push -u origin main


