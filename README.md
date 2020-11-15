# Stress API
This is a simple dumb API that it's useful to check if a system auto-scales as it's expected.

This API can stress the host CPU cores or its memory. If the system is designed to auto-scale depending on a the
amount of CPU or Memory usage, then it will be able to check if the system auto-scaling is working or not.  

---
## How to use
This API is listening on port `80` to the following endpoints: 
### GET

`/cpu`
```text
Returns the current CPU load average between all cores
```  
---
`/memory`
```text
Returns the current memory load
```  
---
`/stress_cpu`
```text

```  
---
`/stress_memory`
```text

```  
---
`/status`
```text

```  
