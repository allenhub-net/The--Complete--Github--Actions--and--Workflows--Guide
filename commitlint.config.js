module.exports = {
  extends: ['@commitlint/config-conventional'],
  rules: {
    'type-enum': [
      2, // error level (fail on vi o l ati on)
      'always',
      ['feat', 'fix'], // ONLY allow 'feat' and 'fix'
    ],
  },
};
