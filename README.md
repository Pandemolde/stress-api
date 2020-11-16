# Stress API
This is a simple dumb API that it's useful to check if a system auto-scales as it's expected.

This API exposes some methods that allows to stress the host CPU cores or its memory. If the system is designed to auto-scale depending on a the
amount of CPU or Memory usage, then it will be able to check if the system auto-scaling is working or not.  

---
## How to use
This API is listening on port `80` to the following endpoints for HTTP `GET` requests: 

<br></br>

`/stress_cpu`

Generates 100% load to all CPU cores during the given interval
```shell script
curl http://127.0.0.1:5000/stress_cpu?interval=10
```  
---
<br></br>
`/stress_memory`

Generates memory load on the host memory (it may crash) 
```shell script
curl http://127.0.0.1:5000/stress_memory
```  
---
<br></br>
`/status`
Returns the current status of the API and the host
```shell script
curl http://127.0.0.1:5000/status
```  
---
`/cpu`

Returns the current CPU load average between all cores
```shell script
curl http://127.0.0.1:5000/cpu
```  
---
<br></br>
`/memory`

Returns the current memory load
```shell script
curl http://127.0.0.1:5000/memory
```  
---
<br></br>
