module.exports = {
  extends: ['@commitlint/config-conventional'],
  rules: {
    'type-enum': [
      2, // error level (fail on violation)
      'always',
      ['feat', 'fix'], // ONLY allow 'feat' and 'fix'
    ],
  },
};
