import requests
import json
import os
from time import sleep

# Create markets directory if it doesn't exist
os.makedirs('markets', exist_ok=True)

# Fetch bets
response = requests.get('https://api.manifold.markets/v0/bets?username=strutheo&limit=500')
bets = response.json()

# Save bets to file
with open('bets.json', 'w') as f:
    json.dump(bets, f, indent=2)

print(f"Saved {len(bets)} bets to bets.json")

# Extract unique contract IDs
contract_ids = set(bet['contractId'] for bet in bets)
print(f"Found {len(contract_ids)} unique contracts")

# Fetch and save each market
for contract_id in contract_ids:
    # Add small delay to be nice to the API
    sleep(0.1)
    
    try:
        response = requests.get(f'https://api.manifold.markets/v0/market/{contract_id}')
        market = response.json()
        
        # Save market data
        filename = f'markets/{contract_id}.json'
        with open(filename, 'w') as f:
            json.dump(market, f, indent=2)
            
        print(f"Saved market {contract_id}")
        
    except Exception as e:
        print(f"Error fetching market {contract_id}: {e}")

print("Done!")
