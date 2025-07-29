module.exports = {
  extends: ['@commitlint/config-conventional'],
  rules: {
    'type-enum': [
      2, // error level (fail on vi o l ation)
      'always',
      ['feat', 'fix'], // ONLY allow 'feat' and 'fix'
    ],
  },
};
