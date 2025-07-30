#!/bin/bash
clear

echo ""
cat assets/banner.txt
echo ""

read -p "Entre les URLs des sites à tester (séparées par un espace) : " -a SITES

for TARGET in "${SITES[@]}"
do
  echo "Test en cours sur : $TARGET"
  for i in {1..100}; do
    RESPONSE=$(curl -s -o /dev/null -w "%{http_code} %{time_total}\\n" "$TARGET")
    echo "[#] $i => $RESPONSE" | tee -a logs/test_log.txt
  done
  echo "Fin du test pour $TARGET"
  echo ""
done

echo -e "\nTest terminé."