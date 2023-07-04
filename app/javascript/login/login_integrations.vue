<template>
  <div class="d-flex flex-column" v-if="enabledIntegrations.length">
    <p class="lines-around d-flex align-items-center w-100 pt-3" v-if="enabledIntegrationsNoClyde.length">OR</p>
    <!-- The oauth params to pass through have to be GET params rather than hidden inputs -->
    <form :action="integration.endpoint + '?redirect=' + redirect" method="post" v-for="integration in enabledIntegrationsNoClyde" :key="integration.endpoint" class="w-100">
      <input type="hidden" v-model="csrfToken" name="authenticity_token" />
      <b-button type="submit" variant="primary" class="w-100 mb-2">{{ integration.buttonText || "Log in with " + integration.name }}</b-button>
    </form>
    <span v-if="clydeIntegration" class="pt-3">You can also <router-link :to="'/login/clyde?redirect=' + redirect">Log In</router-link> with {{ clydeIntegration.linkText || 'Clyde' }}.</span>
  </div>
</template>

<script>
import { loginIntegrationsMixin } from '@/store/login_integrations.mixin';

export default {
  name: "LoginIntegrations",
  mixins: [loginIntegrationsMixin],
  params: {
    redirect: {
      type: String,
      default: null
    }
  },
  computed: {
    enabledIntegrationsNoClyde() {
      return this.enabledIntegrations.filter(i => i.name !== 'clyde')
    }
  }
}
</script>

<style lang="sass">
.lines-around::after,
.lines-around::before {
  content: "";
  flex: 1 1 0%;
  border-bottom: 1px solid black;
}
.lines-around::before {
  margin-right: 0.5rem;
}
.lines-around::after {
  margin-left: 0.5rem;
}
</style>
