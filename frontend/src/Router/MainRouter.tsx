import { 
  Routes,
  Route,
} from 'react-router';
import HomePage from '../pages/HomePage/HomePage';
import HelloPage from '../pages/HelloPage/HelloPage';

function MainRouter() {
  return (
    <Routes>
      <Route
        path="/"
        element={<HomePage />}
      />

      <Route
        path="/hello"
        element={<HelloPage />}
      />
    </Routes>
  );
}

export default MainRouter;

