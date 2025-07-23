
gh-status ()
{
  echo "MERGE QUEUE"
  PAGER= gh merge-queue

  echo
  echo "UP NEXT"
  PAGER= gh to-merge
}
