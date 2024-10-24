import axios from 'axios'
import { useEffect, useState } from 'react'
import './App.css'

function App() {
  const [posts, setPosts] = useState([])
  const [hasFetched, setHasFetched] = useState(false)

  useEffect(() => {
    console.log(hasFetched)
    if (!hasFetched) {
    console.log("Fetching posts...")
      axios.get('http://localhost:3000/proxy', {
        params: { url: 'http://localhost:3001/posts'}
      }).then(response => {
        setPosts(response.data)
        setHasFetched(true)
      }).catch(error => {
        console.error("Error fetching data from proxy:", error)
      })
    }
  }, [hasFetched])

  return (
    <div>
      <h1>Posts desde el Proxy</h1>
      <ul>
        {posts.map(post => (
          <li key={post.id}>
            <h2>{post.title}</h2>
            <p>{post.body}</p>
          </li>
        ))}
      </ul>
    </div>
  )
}

export default App
