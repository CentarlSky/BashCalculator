#!/bin/bash

# ANSI color codes
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to perform addition
addition() {
  local result=$((num1 + num2))
  echo -e "Result: ${BLUE}$result${NC}"
}

# Function to perform subtraction
subtraction() {
  local result=$((num1 - num2))
  echo -e "Result: ${BLUE}$result${NC}"
}

# Function to perform multiplication
multiplication() {
  local result=$((num1 * num2))
  echo -e "Result: ${BLUE}$result${NC}"
}

# Function to perform division
division() {
  if ((num2 == 0)); then
    echo -e "${RED}Error: Division by zero is not allowed.${NC}"
  else
    local result=$(awk "BEGIN {printf \"%.2f\", $num1 / $num2}")
    echo -e "Result: ${BLUE}$result${NC}"
  fi
}

# Function to perform exponentiation
exponentiation() {
  local result=$((num1 ** num2))
  echo -e "Result: ${BLUE}$result${NC}"
}

# Function to calculate square root
square_root() {
  if ((num1 < 0)); then
    echo -e "${RED}Error: Square root of a negative number is not allowed.${NC}"
  else
    local result=$(awk "BEGIN {printf \"%.2f\", sqrt($num1)}")
    echo -e "Result: ${BLUE}$result${NC}"
  fi
}

# Function to perform modulus operation
modulus() {
  local result=$((num1 % num2))
  echo -e "Result: ${BLUE}$result${NC}"
}

# Function to validate numeric input
validate_input() {
  local input="$1"
  if [[ ! "$input" =~ ^[+-]?[0-9]*[.]?[0-9]+$ ]]; then
    return 1
  else
    return 0
  fi
}

# Main menu
while true; do
  clear
  echo -e "${BLUE}Bash Calculator Menu:${NC}"
  echo "1. Addition"
  echo "2. Subtraction"
  echo "3. Multiplication"
  echo "4. Division"
  echo "5. Exponentiation"
  echo "6. Square Root"
  echo "7. Modulus"
  echo "8. Quit"

  read -p "Enter your choice (1/2/3/4/5/6/7/8): " choice

  case "$choice" in
    1|2|3|4|5|6|7)
      read -p "Enter first number: " num1
      read -p "Enter second number: " num2
      
      if validate_input "$num1" && validate_input "$num2"; then
        case "$choice" in
          1) addition ;;
          2) subtraction ;;
          3) multiplication ;;
          4) division ;;
          5) exponentiation ;;
          6) square_root ;;
          7) modulus ;;
        esac
      else
        echo -e "${RED}Error: Please enter valid numeric values.${NC}"
      fi
      ;;
    8)
      echo -e "Exiting Calculator. ${RED}Goodbye!${NC}"
      exit 0
      ;;
    *)
      echo -e "${RED}Invalid choice. Please select a valid option (1/2/3/4/5/6/7/8).${NC}"
      ;;
  esac

  read -p "Press Enter to continue..."
done
