import { BrowserRouter as Router, Route, Routes } from 'react-router-dom';
import PostsList from './PostsList.jsx'
import PostDetail from './PostDetail.jsx'

function App() {
  return (
    <Router>
      <Routes>
        <Route path="/" element={<PostsList />} />
        <Route path="/posts/:id" element={<PostDetail />} />
      </Routes>
    </Router>
  );
}

export default App
