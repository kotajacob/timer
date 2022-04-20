package main

import (
	"flag"
	"fmt"
	"log"
	"time"
)

const usage = `
Usage:
  timer 25s
  timer 11:32AM
  timer 3h40m50s
`

func main() {
	log.SetPrefix("timer: ")
	log.SetFlags(0)
	flag.Parse()
	if len(flag.Args()) != 1 {
		log.Fatalf("wrong number of arguments\n%v\n", usage)
	}

	duration, err := parseDuration(flag.Arg(0))
	if err != nil {
		log.Fatalf("%v\n%v\n", err, usage)
	}

	timer := time.NewTimer(duration)
	go counter(time.Second, duration)
	<-timer.C
	fmt.Println()
}

func counter(delay, duration time.Duration) {
	for {
		// Wipe the current line to avoid leaving characters at the end the
		// line. This is done by printing the ESC[2K code which clears the
		// current line.
		fmt.Printf("%s%s", "\x1b", "[2K")
		fmt.Printf("\r%v", duration)
		duration -= delay
		time.Sleep(delay)
	}
}

func parseDuration(s string) (time.Duration, error) {
	d, err := parseKitchen(s)
	if err != nil {
		d, err = time.ParseDuration(s)
	}
	return d, err
}

func parseKitchen(s string) (time.Duration, error) {
	targetTime, err := time.Parse(time.Kitchen, s)
	if err != nil {
		return time.Duration(0), err
	}

	now := time.Now()
	originTime := time.Date(
		0,
		time.January,
		1,
		now.Hour(),
		now.Minute(),
		now.Second(),
		0,
		time.UTC,
	)

	// The time of day requested has passed; so target tomorrow.
	if targetTime.Before(originTime) {
		targetTime = targetTime.AddDate(0, 0, 1)
	}

	duration := targetTime.Sub(originTime)

	return duration, err
}
