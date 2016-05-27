// Player dictionaries

let players : [[String: Any]] = [
[
    "name": "Joe Smith",
    "height": 42,
    "experience": true,
    "guardian": "Jim and Jan Smith"
    ],
[
    "name": "Jill Tanner",
    "height": 36,
    "experience": true,
    "guardian": "Clara Tanner"
    ],
[
    "name": "Bill Bon",
    "height": 43,
    "experience": true,
    "guardian": "Sara and Jenny Bon"
    ],
[
    "name": "Eva Gordon",
    "height": 45,
    "experience": false,
    "guardian": "Wendy and Mike Gordon"
    ],
[
    "name": "Matt Gill",
    "height": 40,
    "experience": false,
    "guardian": "Charles and Sylvia Gill"
    ],
[
    "name": "Kimmy Stein",
    "height": 41,
    "experience": false,
    "guardian": "Bill and Hillary Stein"
    ],
[
    "name": "Sammy Adams",
    "height": 45,
    "experience": false,
    "guardian": "Jeff Adams"
    ],
[
    "name": "Karl Saygan",
    "height": 42,
    "experience": true,
    "guardian": "Heather Bledsoe"
    ],
[
    "name": "Suzane Greenberg",
    "height": 44,
    "experience": true,
    "guardian": "Henrietta Dumas"
    ],
[
    "name": "Sal Dali",
    "height": 41,
    "experience": false,
    "guardian": "Gala Dali"
    ],
[
    "name": "Joe Kavalier",
    "height": 39,
    "experience": false,
    "guardian": "Sam and Elaine Kavalier"
    ],
[
    "name": "Ben Finkelstein",
    "height": 44,
    "experience": false,
    "guardian": "Aaron and Jill Finkelstein"
    ],
[
    "name": "Diego Soto",
    "height": 41,
    "experience": true,
    "guardian": "Robin and Sarika Soto"
    ],
[
    "name": "Chloe Alaska",
    "height": 47,
    "experience": false,
    "guardian": "David and Jamie Alaska"
    ],
[
    "name": "Arnold Willis",
    "height": 43,
    "experience": false,
    "guardian": "Claire Willis"
    ],
[
    "name": "Phillip Helm",
    "height": 44,
    "experience": true,
    "guardian": "Thomas Helm and Eva Jones"
    ],
[
    "name": "Les Clay",
    "height": 42,
    "experience": true,
    "guardian": "Wynonna Brown"
    ],
[
    "name": "Herschel Krustofski",
    "height": 45,
    "experience": true,
    "guardian": "Hyman and Rachel Krustofski"
    ]
]

// Create initial team arrays

var dragons :[[String: Any]] = []
var sharks :[[String: Any]] = []
var raptors :[[String: Any]] = []


// Create arrays to group experienced and inexperienced players seperately

var experiencedPlayers : [[String: Any]] = []
var inexperiencedPlayers : [[String: Any]] = []


for player in players {
    if let experience = player["experience"] as? Bool { //unwrap optional
        if experience {
            experiencedPlayers.append(player)
        } else {
            inexperiencedPlayers.append(player)
        }
    } else {
        print("can't find value")
    }
}

// Sort experienced players from tall to short

experiencedPlayers.sortInPlace {
    item1, item2 in
    let height1 = item1["height"] as? Int
    let height2 = item2["height"] as? Int
    return height1 > height2
}

// Sort inexperienced players from short to tall

inexperiencedPlayers.sortInPlace {
    item1, item2 in
    let height1 = item1["height"] as? Int
    let height2 = item2["height"] as? Int
    return height1 < height2
}


// Calculate how many experienced or inexperienced players each team needs

var allTeams = [sharks, dragons, raptors]
let experiencedPlayerInTeamCount = experiencedPlayers.count / allTeams.count
let inexperiencedPlayerInTeamCount = inexperiencedPlayers.count / allTeams.count


// Put players into each team

for i in 0...experiencedPlayerInTeamCount-1 {
    dragons.append(experiencedPlayers[i])
    
}

for i in 0...inexperiencedPlayerInTeamCount-1 {
    dragons.append(inexperiencedPlayers[i])
}

//print(dragons)

for j in experiencedPlayerInTeamCount...(2 * experiencedPlayerInTeamCount-1) {
    sharks.append(experiencedPlayers[j])
}

for j in inexperiencedPlayerInTeamCount...(2 * inexperiencedPlayerInTeamCount-1){
    sharks.append(inexperiencedPlayers[j])
}

//print(sharks)

for k in (experiencedPlayerInTeamCount * 2)...(experiencedPlayerInTeamCount * 3 - 1){
    raptors.append(experiencedPlayers[k])
}

for k in (inexperiencedPlayerInTeamCount * 2)...(inexperiencedPlayerInTeamCount * 3 - 1){
    raptors.append(inexperiencedPlayers[k])
}

//print(raptors)

// Verify average height difference between teams

func calculateAverage(team: [[String: Any]]) -> Double {
    var sum = 0
    for player in team {
        if let height = player["height"] as? Int {
            sum += height
        }
    }
    return Double(sum) / Double (team.count)
}

calculateAverage(dragons)
calculateAverage(sharks)
calculateAverage(raptors)

// Composing letters

let dragonsPracticeTime = "March 17, 1pm"
let sharksPracticeTime = "March 17, 3pm"
let raptorsPracticeTime = "March 18, 1pm"

func generateLetter(team: [[String: Any]], teamName: String, teamPracticeTime: String) {
    for player in team {
        print("Dear \(player["guardian"]!), we are writing to let you know that your child \(player["name"]!) has been placed on team \(teamName). Please attend the first team practice at \(teamPracticeTime). Thank you!")
    }
    return
}

generateLetter(dragons, teamName: "Dragons", teamPracticeTime: dragonsPracticeTime)
generateLetter(sharks, teamName: "Sharks", teamPracticeTime: sharksPracticeTime)
generateLetter(raptors, teamName: "Raptors", teamPracticeTime: raptorsPracticeTime)


