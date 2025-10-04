import http from 'k6/http';



export const options = {
    stages: [
    { duration: '1m', target: 20 }, // ramp up to 20 users in 1 minute
    { duration: '3m', target: 20 }, // hold steady for 3 minutes
    { duration: '1m', target: 0 },  // ramp down to 0 users in 1 minute
  ],
  thresholds: {
    http_req_failed: ['rate<0.05'], // http errors should be less than 1%
    http_req_duration: ['p(95)<2000'], // 95% of requests should be below 200ms
  },
};

export default function () {
  http.get('http://localhost:4321/login');
}