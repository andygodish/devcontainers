package main

import (
	"bufio"
	"fmt"
	"os"
	"path/filepath"
	"strconv"
	"strings"
)

func main() {
	// Define the path to scan - we'll scan the devcontainers directory
	scanDir := "./devcontainers"

	// Create a slice to store all the dockerfile paths we find
	dockerfiles := []string{}

	// Walk through the directory tree
	err := filepath.Walk(scanDir, func(path string, info os.FileInfo, err error) error {
		if err != nil {
			fmt.Printf("Error accessing path %s: %v\n", path, err)
			return err
		}

		// Check if the file is named "dockerfile"
		if !info.IsDir() && filepath.Base(path) == "dockerfile" {
			// Get the relative path from the scan directory
			relPath, err := filepath.Rel(scanDir, path)
			if err != nil {
				fmt.Printf("Error getting relative path: %v\n", err)
				return nil
			}

			dockerfiles = append(dockerfiles, relPath)
		}

		return nil
	})

	if err != nil {
		fmt.Printf("Error walking directory: %v\n", err)
		os.Exit(1)
	}

	// Print out all the dockerfiles we found
	if len(dockerfiles) == 0 {
		fmt.Println("No dockerfiles found.")
	} else {
		fmt.Print("Please select one of the following devcontainer images to build:\n")
		fmt.Println()
		for i, df := range dockerfiles {
			fmt.Printf("%d. %s\n", i+1, df)
		}
	}

	// Get user input
	fmt.Println()
	fmt.Print("Enter the number of your selection: ")

	// Create a scanner to read input
	scanner := bufio.NewScanner(os.Stdin)
	scanner.Scan()
	userInput := scanner.Text()

	// Convert the input to an integer
	selection, err := strconv.Atoi(strings.TrimSpace(userInput))
	if err != nil {
		fmt.Println("Invalid input. Please enter a number.")
		os.Exit(1)
	}

	// Check if the selection is valid
	if selection < 1 || selection > len(dockerfiles) {
		fmt.Printf("Invalid selection. Please enter a number between 1 and %d.\n", len(dockerfiles))
		os.Exit(1)
	}

	// Get the selected dockerfile (adjusting for 0-based index)
	selectedDockerfile := dockerfiles[selection-1]

	// Display the selection
	fmt.Println()
	fmt.Printf("Building %s...\n", selectedDockerfile)
}
