<template>
  <div class="team_entry_form">
    <div class="new-player">
      <label> Add new player <br/>
        <input name="newPlayer" class="text-box" id="newPlayer" placeholder="first_name surname">
      </label>

     <p class="astrix">* Please only add a new player if they dont appear in the selection lists.
      <br/> Please use First name and surname as they appear on materscoreboard. </p>
      <button class="add-new-player-button" v-on:click="addPlayer">Add New Player</button>
    </div>
    <label>Player 1
      <select class="select-box" v-model="team_sheet.player_1">
        <option v-for="player in club_players" v-bind:value="player.first_name + ' ' + player.surname">
          {{ player.first_name + " " + player.surname }}
        </option>
      </select>
    </label>
    <label>Player 2
      <select class="select-box" v-model="team_sheet.player_2">
        <option v-for="player in club_players" v-bind:value="player.first_name + ' ' + player.surname">
          {{ player.first_name + " " + player.surname }}
        </option>
      </select>
    </label>
    <label>Player 3
      <select class="select-box" v-model="team_sheet.player_3">
        <option v-for="player in club_players" v-bind:value="player.first_name + ' ' + player.surname">
          {{ player.first_name + " " + player.surname }}
        </option>
      </select>
    </label>
    <label>Player 4
      <select class="select-box" v-model="team_sheet.player_4">
        <option v-for="player in club_players" v-bind:value="player.first_name + ' ' + player.surname">
          {{ player.first_name + " " + player.surname }}
        </option>
      </select>
    </label>
    <label>Player 5
      <select class="select-box" v-model="team_sheet.player_5">
        <option v-for="player in club_players" v-bind:value="player.first_name + ' ' + player.surname">
          {{ player.first_name + " " + player.surname }}
        </option>
      </select>
    </label>
    <label>Player 6
      <select class="select-box" v-model="team_sheet.player_6">
        <option v-for="player in club_players" v-bind:value="player.first_name + ' ' + player.surname">
          {{ player.first_name + " " + player.surname }}
        </option>
      </select>
    </label>
    <label>Player 7
      <select class="select-box" v-model="team_sheet.player_7">
        <option v-for="player in club_players" v-bind:value="player.first_name + ' ' + player.surname">
          {{ player.first_name + " " + player.surname }}
        </option>
      </select>
    </label>
    <label>Player 8
      <select class="select-box" v-model="team_sheet.player_8">
        <option v-for="player in club_players" v-bind:value="player.first_name + ' ' + player.surname">
          {{ player.first_name + " " + player.surname }}
        </option>
      </select>
    </label>
    <label>Guest 1
      <input v-model="team_sheet.guest_1" class="text-box" placeholder="first_name surname (club)">
    </label>
    <label>Guest 2
      <input v-model="team_sheet.guest_2" class="text-box" placeholder="first_name surname (club)">
    </label>
    <label>Guest 3
      <input v-model="team_sheet.guest_3" class="text-box" placeholder="first_name surname (club)">
    </label>

    <button class="pure-button fuller-button blue-enter fixture-button form-button" v-on:click="submit">Submit</button>
  </div>
</template>

<script>
  export default {
    props: ['players', 'team_sheet', 'club', 'fixture'],

    mounted() {
      console.log(this.club);
    },
    data() {
      return {
        club_players: this.players
      }
    },
    methods: {

      addPlayer: function() {
        let newPlayerEl = document.getElementById("newPlayer");
        let name = newPlayerEl.value.split(" ");
        this.club_players.push({
          first_name: name[0].charAt(0).toUpperCase() + name[0].slice(1),
          surname: name[1].charAt(0).toUpperCase() + name[1].slice(1)
        })
        newPlayerEl.value = ""
        this.$http.post(`/user/player/add`, {player: name}).then(response => {
          if(response.ok) {
           console.log("yeah");
          }
        })
      },



      submit: function() {
        if (this.team_sheet.id == null){
          this.team_sheet.club_id = this.club;
          this.team_sheet.fixture_id = this.fixture;
          this.$http.post(`/user/team_sheets/`, {team_sheet: this.team_sheet}).then(response => {
            if(response.ok) {
              location.href = `/user/team_sheets/${response.data.teamsheet.id}`;
            }
          })
        }else {
          this.$http.put(`/user/team_sheets/${this.team_sheet.id}`, {team_sheet: this.team_sheet}).then(response => {
            if(response.ok) {
              location.href = `/user/team_sheets/${this.team_sheet.id}`;
            }
          })
        }
      }
    }
  }
</script>

<style scoped>
.team_entry_form {
  display: grid;
  grid-template-columns: 1fr;
  text-align: center;
  justify-content: center;
}
p {
  font-size: 2em;
  text-align: center;
}
label{
  display: block;
  padding: 0.5rem;
  color: #5bb5f9;
  background-color: #38393a;
  text-transform: capitalize;
}
.new-player{
  display:grid;
  grid-template-columns: 1fr;
  text-align: center;
  justify-content: center;
  background: #38393a;
  padding: 20px 0;
  border-bottom: 1px solid #5bb5f9;
}
.add-new-player-button{
  width: 370px;
  margin: auto;
  height: 2rem;
  background-color: #5bb5f9;
  font-weight: 600;
  font-size: 1rem;
}
.astrix{
  font-size: 0.9rem;
  font-style: oblique;
  color: white;
  line-height: 1.2rem;
}
.select-box {
  font-weight: 600;
  letter-spacing: 4px;
  height: 2rem;
  font-size: 1rem;
  padding: 0.3rem;
  background-color: #FAFCFD;
  border: 3px solid transparent;
}
.text-box{
  font-weight: 600;
  letter-spacing: 4px;
  height: 1rem;
  width: 230px;
  font-size: 1rem;
  padding: 0.3rem;
  background-color: #FAFCFD;
  border: 3px solid transparent;
  margin-top:12px;
}
</style>
