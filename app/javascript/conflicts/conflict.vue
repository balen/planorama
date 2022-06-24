<template>
  <div>
    <div v-if="availability">
      <conflict-person-link :person="conflict.person"></conflict-person-link> {{conflictText}}
    </div>
    <div v-if="room_conflict">{{conflict.room.name}} {{conflictText}}</div>
    <div v-if="person_session_conflict">
      <conflict-person-link :person="conflict.person"></conflict-person-link>
      {{conflictText}}
      <!-- <conflict-session-link :session="conflict.session"></conflict-session-link> -->
    </div>
    <div v-if="back_to_back">BLAH</div>
  </div>  
</template>

<script>
import { CONFLICT_TEXT } from '@/constants/strings';
import ConflictPersonLink from './conflict_person_link';

export default {
  name: 'Conflict',
  props: {
    conflict: {
      required: true,
      type: Object
    }
  },
  components: {
    ConflictPersonLink
  },
  computed: {
    availability() {
      return this.conflict.conflict_type === 'availability';
    },
    room_conflict() {
      return this.conflict.conflict_type === 'room_conflict';
    },
    person_session_conflict() {
      return this.conflict.conflict_type === 'person_session_conflict';
    },
    back_to_back() {
      return this.conflict.conflict_type === 'back_to_back';
    },
    conflictText() {
      return CONFLICT_TEXT[this.conflict.conflict_type];
    },

  }
}
</script>

<style>

</style>
