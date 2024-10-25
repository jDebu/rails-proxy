import axios from 'axios'
import { useEffect, useState } from 'react'
import { Link } from 'react-router-dom'

function PostsList() {
  const [posts, setPosts] = useState([])
  const [hasFetched, setHasFetched] = useState(false)

  useEffect(() => {
    if (!hasFetched) {
      axios.get('http://localhost:3000/proxy', {
        params: { url: 'http://localhost:3001/posts' }
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
        {Array.isArray(posts) && posts.length > 0 ? (
          posts.map(post => (
            <li key={post.id}>
              <Link to={`/posts/${post.id}`}>
                <h2>{post.title}</h2>
              </Link>
            </li>
          ))
        ) : (
          <p>No posts available.</p>
        )}
      </ul>
    </div>
  )
}

export default PostsList
