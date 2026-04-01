import http from 'k6/http';
import { check, group, sleep } from 'k6';

/**
 * Load Test for CMS Distribution
 * 
 * Run with: 
 *   k6 run test-suite/load.test.js
 * Or with custom URL:
 *   k6 run -e BASE_URL=http://your-staging-server:2020 test-suite/load.test.js
 */

// 1. Configuration via Environment Variables
const BASE_URL = __ENV.BASE_URL || 'http://localhost:2020';

export let options = {
    stages: [
        { duration: '30s', target: 20 },  // Ramp-up: 0 to 20 users
        { duration: '1m', target: 100 },  // Stress: Stay at 100 users
        { duration: '30s', target: 0 },    // Ramp-down: Back to 0
    ],
    // 2. Performance SLAs (Thresholds)
    thresholds: {
        http_req_failed: ['rate<0.01'],      // Error rate must be less than 1%
        http_req_duration: ['p(95)<500'],    // 95% of requests must be faster than 500ms
    },
};

export default function () {
    group('CMS Base Page Performance', () => {
        const response = http.get(BASE_URL);
        
        check(response, {
            "status is 200 OK": (r) => r.status === 200,
            "response time < 1s": (r) => r.timings.duration < 1000,
            // A more robust check: verify it's actually the CMS and not just an error page with 200
            "content contains cms": (r) => r.body && r.body.toLowerCase().includes('cms'),
        });
    });

    // 3. User Think Time
    // Simulates a real user reading the page before the next action
    sleep(1);
};
