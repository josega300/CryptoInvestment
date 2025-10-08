import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'
import CryptoDashboard from './components/CryptoDashboard'

import './index.css'
import App from './App.jsx'

createRoot(document.getElementById('root')).render(
  <StrictMode>
    <CryptoDashboard />
  </StrictMode>,
)
