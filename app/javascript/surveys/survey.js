import PlanoModel from '../model.js';
import {Collection} from 'vue-mc';
import {
    required,
    string,
} from 'vue-mc/validation'
import { SurveyQuestions } from './survey_question.js';

export class Survey extends PlanoModel {
  defaults() {
    return {
      id: null,
      name: '',
      welcome: null,
      thank_you: null,
      alias: '',
      submit_string: '',
      header_image: null,
      use_captcha: false,
      public: false,
      authenticate: false,
      transition_acceptance_status: false,
      transition_decline_status: false,
      declined_msg: '',
      anonymous: false
    }
  }
  validation() {
    return {
      name: string.and(required)
    }
  }
  routes() {
    return {
      fetch: '/surveys/{id}',
      create:  '/surveys',
      save:  '/surveys/{id}',
      update: '/surveys/{id}',
      delete: '/surveys/{id}'
    }
  }

  mutations() {
    return {
      survey_questions: sq => new SurveyQuestions(sq)
    }
  }

};

export class Surveys extends Collection {
  options() {
    return {
      model: Survey,
    }
  }

  defaults() {
    return {
      sortField: 'name',
      sortOrder: 'asc',
      filter: '',
      perPage:15,
      page: 1,
      total: 0
    }
  }

  routes() {
    return {
      fetch: '/surveys?perPage={perPage}&sortField={sortField}&sortOrder={sortOrder}&filter={filter}',
    }
  }
};

export const survey_columns = [
  {
    key: '$.name',
    label: 'Name',
    stickyColumn: true,
    sortable: true
  },
  {
    key: '$.welcome',
    label: 'Description',
    sortable: true
  },
  'published',
  {
    key: '$.updated_at',
    label: 'Last Modified On',
    sortable: true,
    formatter: (d) => new Date(d).toLocaleString()
  },
  'updatedBy',
  'preview',
  'surveyLink',
  // welcome
  // thank_you
  // alias
  // submit_string
  // header_image
  // use_captcha
  // public
  // authenticate
  // transition_acceptance_status
  // transition_decline_status
  // declined_msg
  // anonymous
];
