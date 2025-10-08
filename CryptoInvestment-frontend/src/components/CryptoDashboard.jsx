import React, { useEffect, useState } from 'react';
import axios from 'axios';
import { Line } from 'react-chartjs-2';
import {
  Chart as ChartJS,
  Title,
  Tooltip,
  Legend,
  LineElement,
  CategoryScale,
  LinearScale,
  PointElement,
} from 'chart.js';

ChartJS.register(Title, Tooltip, Legend, LineElement, CategoryScale, LinearScale, PointElement);

export default function CryptoDashboard() {
  const [cryptos, setCryptos] = useState([]);
  const [selectedCryptos, setSelectedCryptos] = useState([]);
  const [priceHistories, setPriceHistories] = useState({});
  const [dateRange, setDateRange] = useState({ start: '', end: '' });
  const backendUrl = import.meta.env.VITE_BACKEND_URL;

  // --- Obtener lista de criptos ---
  const fetchCryptos = async () => {
    try {
      const res = await axios.get(`${backendUrl}/api/cryptos`);
      const data = res.data.data || [];
      setCryptos(data);
      if (selectedCryptos.length === 0 && data.length > 0) {
        setSelectedCryptos([data[0].symbol]);
      }
    } catch (error) {
      console.error('Error fetching cryptos:', error);
    }
  };

  // --- Simular historial de precios según rango de fechas ---
  const simulateHistory = (symbol) => {
    const crypto = cryptos.find(c => c.symbol === symbol);
    if (!crypto) return [];

    const basePrice = crypto.quote.USD.price;
    const history = [];

    let startDate = dateRange.start ? new Date(dateRange.start) : new Date(Date.now() - 6*24*60*60*1000);
    let endDate = dateRange.end ? new Date(dateRange.end) : new Date();

    // Asegurarse de que start <= end
    if (startDate > endDate) [startDate, endDate] = [endDate, startDate];

    for (let d = new Date(startDate); d <= endDate; d.setDate(d.getDate() + 1)) {
      const variation = (Math.random() - 0.5) * crypto.quote.USD.percent_change_24h;
      history.push({
        date: new Date(d).toLocaleDateString(),
        price: basePrice + (basePrice * variation) / 100,
      });
    }

    return history;
  };

  // --- Efectos ---
  useEffect(() => {
    fetchCryptos();
    const interval = setInterval(fetchCryptos, 30000);
    return () => clearInterval(interval);
  }, []);

  useEffect(() => {
    const histories = {};
    selectedCryptos.forEach(symbol => {
      histories[symbol] = simulateHistory(symbol);
    });
    setPriceHistories(histories);
  }, [cryptos, selectedCryptos, dateRange]);

  // --- Preparar datos para Chart.js ---
  const chartData = {
    labels: priceHistories[selectedCryptos[0]]?.map(h => h.date) || [],
    datasets: selectedCryptos.map((symbol, index) => ({
      label: symbol,
      data: priceHistories[symbol]?.map(h => h.price) || [],
      borderColor: `hsl(${index * 60},70%,50%)`,
      fill: false,
    })),
  };

  // --- Toggle selección ---
  const toggleCrypto = (symbol) => {
    setSelectedCryptos(prev =>
      prev.includes(symbol) ? prev.filter(s => s !== symbol) : [...prev, symbol]
    );
  };

  // --- Manejar cambios en rango de fechas ---
  const handleDateChange = (e) => {
    const { name, value } = e.target;
    setDateRange(prev => ({ ...prev, [name]: value }));
  };

  return (
    <div style={{ padding: '20px', fontFamily: 'Arial, sans-serif' }}>
      <h1>CryptoInvestment Dashboard</h1>

      {/* --- Formulario rango de fechas --- */}
      <div style={{ marginBottom: '20px', display: 'flex', gap: '12px', alignItems: 'center', flexWrap: 'wrap' }}>
        <label>
          Desde:
          <input
            type="date"
            name="start"
            value={dateRange.start}
            onChange={handleDateChange}
            style={{ marginLeft: '6px' }}
          />
        </label>
        <label>
          Hasta:
          <input
            type="date"
            name="end"
            value={dateRange.end}
            onChange={handleDateChange}
            style={{ marginLeft: '6px' }}
          />
        </label>
      </div>

      {/* --- Grid principal: selección y gráfico --- */}
      <div style={{
        display: 'grid',
        gridTemplateColumns: '250px 1fr',
        gap: '20px',
        alignItems: 'start'
      }}>
        {/* Izquierda: selección */}
        <div style={{ border: '1px solid #ccc', padding: '10px', borderRadius: '6px' }}>
          <h3>Selecciona criptos:</h3>
          <div style={{ display: 'flex', flexDirection: 'column', gap: '8px' }}>
            {cryptos.map(c => (
              <label key={c.symbol}>
                <input
                  type="checkbox"
                  checked={selectedCryptos.includes(c.symbol)}
                  onChange={() => toggleCrypto(c.symbol)}
                  style={{ marginRight: '6px' }}
                />
                {c.name} ({c.symbol})
              </label>
            ))}
          </div>
        </div>

        {/* Derecha: gráfico */}
        <div style={{ border: '1px solid #ccc', padding: '10px', borderRadius: '6px' }}>
          {selectedCryptos.length > 0 ? (
            <Line data={chartData} />
          ) : (
            <p>Selecciona criptos para ver el gráfico.</p>
          )}
        </div>
      </div>

      {/* --- Abajo: tabla resumen de seleccionados --- */}
      <div style={{ marginTop: '20px', overflowX: 'auto' }}>
        <table border="1" cellPadding="8" style={{ borderCollapse: 'collapse', width: '100%' }}>
          <thead>
            <tr>
              <th>Nombre</th>
              <th>Precio USD</th>
              <th>% Cambio 24h</th>
              <th>Volumen 24h</th>
            </tr>
          </thead>
          <tbody>
            {cryptos
              .filter(c => selectedCryptos.includes(c.symbol))
              .map(c => (
                <tr key={c.symbol}>
                  <td>{c.name}</td>
                  <td>${c.quote?.USD?.price.toFixed(2)}</td>
                  <td>{c.quote?.USD?.percent_change_24h.toFixed(2)}%</td>
                  <td>${c.quote?.USD?.volume_24h.toLocaleString()}</td>
                </tr>
              ))}
          </tbody>
        </table>
      </div>
    </div>
  );
}
