module.exports = {
  apps: [{
    name: 'LvCreations-Bot',
    script: './src/index.js',
    instances: 1,
    autorestart: true,
    watch: ['src'],
    ignore_watch: ['node_modules', 'data.json', 'logs'],
    max_memory_restart: '500M',
    env: {
      NODE_ENV: 'production'
    },
    error_file: './logs/error.log',
    out_file: './logs/out.log',
    log_date_format: 'YYYY-MM-DD HH:mm:ss Z',
    merge_logs: true,
    restart_delay: 4000,
    min_uptime: '10s',
    max_restarts: 10,
    exp_backoff_restart_delay: 100
  }]
};
