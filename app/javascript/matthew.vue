<template>
  <div>
    <label> Add new player
      <input name="newPlayer" id="newPlayer" placeholder="first_name surname">
      <button v-on:click="addPlayer">Submit</button>
    </label>


    <label>Player 1
      <select v-model="team_sheet.player_1">
        <option v-for="player in club_players" v-bind:value="player.first_name + ' ' + player.surname">
          {{ player.first_name + " " + player.surname }}
        </option>
      </select>
    </label>
    <label>Player 2
      <select v-model="team_sheet.player_2">
        <option v-for="player in club_players" v-bind:value="player.first_name + ' ' + player.surname">
          {{ player.first_name + " " + player.surname }}
        </option>
      </select>
    </label>
    <label>Player 3
      <select v-model="team_sheet.player_3">
        <option v-for="player in club_players" v-bind:value="player.first_name + ' ' + player.surname">
          {{ player.first_name + " " + player.surname }}
        </option>
      </select>
    </label>
    <label>Player 4
      <select v-model="team_sheet.player_4">
        <option v-for="player in club_players" v-bind:value="player.first_name + ' ' + player.surname">
          {{ player.first_name + " " + player.surname }}
        </option>
      </select>
    </label>
    <label>Player 5
      <select v-model="team_sheet.player_5">
        <option v-for="player in club_players" v-bind:value="player.first_name + ' ' + player.surname">
          {{ player.first_name + " " + player.surname }}
        </option>
      </select>
    </label>
    <label>Player 6
      <select v-model="team_sheet.player_6">
        <option v-for="player in club_players" v-bind:value="player.first_name + ' ' + player.surname">
          {{ player.first_name + " " + player.surname }}
        </option>
      </select>
    </label>
    <label>Player 7
      <select v-model="team_sheet.player_7">
        <option v-for="player in club_players" v-bind:value="player.first_name + ' ' + player.surname">
          {{ player.first_name + " " + player.surname }}
        </option>
      </select>
    </label>
    <label>Player 8
      <select v-model="team_sheet.player_8">
        <option v-for="player in club_players" v-bind:value="player.first_name + ' ' + player.surname">
          {{ player.first_name + " " + player.surname }}
        </option>
      </select>
    </label>
    <label>Guest 1
      <select v-model="team_sheet.guest_1">
        <option v-for="player in players" v-bind:value="player.first_name + ' ' + player.surname">
          {{ player.first_name + " " + player.surname }}
        </option>
      </select>
    </label>
    <label>Guest 2
      <select v-model="team_sheet.guest_2">
        <option v-for="player in players" v-bind:value="player.first_name + ' ' + player.surname">
          {{ player.first_name + " " + player.surname }}
        </option>
      </select>
    </label>
    <label>Guest 3
      <select v-model="team_sheet.guest_3">
        <option v-for="player in players" v-bind:value="player.first_name + ' ' + player.surname">
          {{ player.first_name + " " + player.surname }}
        </option>
      </select>
    </label>

    <button v-on:click="submit">Submit</button>
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
          first_name: name[0],
          surname: name[1]
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
p {
  font-size: 2em;
  text-align: center;
}
  label{
    display: block;
  }
</style>
