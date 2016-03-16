# Quake log parser

Parses the log of quake games and reports number of kills per player and reasons of death.

## How to run the application locally

Make sure Ruby and Rails are installed on your system. On the command line write and run commands below:

  `ruby -v`
  
You will know whether it's installed or not if you see their version numbers!


Then clone the git repository for your computer/server using:

  `git clone https://github.com/guifigueiroa/quake_log_parser.git`
  
Enter the directory where you cloned the application and run the application:

  `ruby main.rb`
  
## Execution

When you run the applitions it prompts the following

```sh
  Log file contains 21 games played.
  Which game do you want to consult? (Between 1 and 21, anything else to exit)
```
You can choose the game you want to report and there are two reports available

```sh
  1 - Kills report
  2 - Kill by means report
```

The "Kills report" is presented as follows
```sh
game_5: {  
        total_kills: 14,
        players: ["Dono da Bola", "Isgalamido", "Zeh", "Assasinu Credi"],    
        kills: {
                "Isgalamido": 2,
                "Zeh": 1,
                "Dono da Bola": 0,
                "Assasinu Credi": 1
        }          
}
```

And the "Kill by means" report shows

```sh
game_5: {       
        kill_by_means: {
                "MOD_ROCKET": 4,
                "MOD_ROCKET_SPLASH": 4,
                "MOD_TRIGGER_HURT": 5,
                "MOD_RAILGUN": 1,          
        }                
}
```
