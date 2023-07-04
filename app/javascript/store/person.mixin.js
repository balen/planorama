import { mapActions } from "vuex";
import { CLYDE_SYNC_SELECTED, UNLINK_REGISTRATION_SELECTED } from "./person.store";
import { toastMixin } from "@/mixins";

export const personMixin = {
  mixins: [toastMixin],
  methods: {
    ...mapActions({
      clydeSyncSelected: CLYDE_SYNC_SELECTED,
      unlinkRegistrationSelected: UNLINK_REGISTRATION_SELECTED,
    }),
    clydeSync() {
      this.toastPromise(this.clydeSyncSelected(), 'Clyde successfully synced.')
    },
    unlinkRegistration() {
      this.toastPromise(this.unlinkRegistrationSelected(), 'Registration unlinked successfully')
    }
  }
}
