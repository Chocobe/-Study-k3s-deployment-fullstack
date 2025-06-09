import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'
import { 
  BrowserRouter,
} from 'react-router'
import MainRouter from './Router/MainRouter'
import './index.css'
// import HomePage from './pages/HomePage/HomePage.tsx'

createRoot(document.getElementById('root')!).render(
  <StrictMode>
    {/* <HomePage /> */}

    <BrowserRouter>
      <MainRouter />
    </BrowserRouter>
  </StrictMode>,
);
