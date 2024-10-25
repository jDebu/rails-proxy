import { useParams } from 'react-router-dom'
import { useEffect, useState } from 'react'
import axios from 'axios'

function PostDetail() {
  const { id } = useParams()
  const [post, setPost] = useState(null)
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    axios.get('http://localhost:3000/proxy', {
      params: { url: `http://localhost:3001/posts/${id}` }
    }).then(response => {
      setPost(response.data)
      setLoading(false)
    }).catch(error => {
      console.error("Error fetching post details from proxy:", error)
      setLoading(false)
    })
  }, [id])

  if (loading) {
    return <p>Loading post details...</p>
  }

  if (!post) {
    return <p>No post found.</p>
  }

  return (
    <div>
      <h2>{post.title}</h2>
      <p>{post.body}</p>
    </div>
  )
}

export default PostDetail
