
var people = ["Ackbar","Bossk","Chewie","Dooku","Eirtae","Fett","Greedo","Han",
           "IG88","Jabba","Kenobi","Luke","Mace","Nien","Oola","Palpatine",
           "QuiGonn","R2D2","Sidious","Tarkin","Unduli","Vader","Wedge"
           ,"Xizor","Yoda","Zorba"];

var votes = {};

for(var people_index = 0; people_index <= people.length - 1; people_index++){

  var candidate_pool = people.slice();
  var selected_candidates = [];

  for(var four_times = 0; four_times < 4; four_times++){
    var unique_candidate = candidate_pool[Math.floor(Math.random() * candidate_pool.length)];
    selected_candidates.push(unique_candidate);
    candidate_pool.splice(candidate_pool.indexOf(unique_candidate),1);
  };

  votes[people[people_index]] = {
    president: selected_candidates[0],
    vicePresident: selected_candidates[1],
    secretary: selected_candidates[2],
    treasurer: selected_candidates[3]
  };

}; //end for loop iterating through people
console.log(votes);
var voteCount = {
  president: {},
  vicePresident: {},
  secretary: {},
  treasurer: {}
};

for(var key in votes){

  var voter_selections = votes[key];

  for (var position in voter_selections) {

    if(position == "president"){
      if (isNaN(voteCount.president[voter_selections[position]]) ){
        voteCount.president[voter_selections[position]] = 1;
      }else{
        voteCount.president[voter_selections[position]] += 1;
      }
    }else if(position == "vicePresident"){
       if (isNaN(voteCount.vicePresident[voter_selections[position]]) ){
        voteCount.vicePresident[voter_selections[position]] = 1;
      }else{
        voteCount.vicePresident[voter_selections[position]] += 1;
      }
    }else if(position == "secretary"){
       if (isNaN(voteCount.secretary[voter_selections[position]]) ){
        voteCount.secretary[voter_selections[position]] = 1;
      }else{
        voteCount.secretary[voter_selections[position]] += 1;
      }
    }else if(position == "treasurer"){
       if (isNaN(voteCount.treasurer[voter_selections[position]]) ){
        voteCount.treasurer[voter_selections[position]] = 1;
      }else{
        voteCount.treasurer[voter_selections[position]] += 1;
      }
    }
  };

};

console.log(voteCount);

var officers = {
  president: undefined,
  vicePresident: undefined,
  secretary: undefined,
  treasurer: undefined
}
