-- RUN THIS SCRIPT IN THE SUPABASE SQL EDITOR

-- 1. Create Properties Table
create table public.properties (
  id uuid default gen_random_uuid() primary key,
  created_at timestamp with time zone default timezone('utc'::text, now()) not null,
  title text not null,
  price numeric not null,
  type text not null, -- 'Sale' or 'Rent'
  currency text default 'USD',
  address text,
  bedrooms numeric,
  bathrooms numeric,
  area numeric,
  description text,
  status text default 'Available',
  images text[] -- Array of image URLs
);

-- 2. Create Visits Table
create table public.visits (
  id uuid default gen_random_uuid() primary key,
  created_at timestamp with time zone default timezone('utc'::text, now()) not null,
  customer_name text not null,
  customer_email text,
  customer_phone text,
  date date,
  time time,
  status text default 'Pending',
  property_id uuid references public.properties(id)
);

-- 3. Create Transactions Table
create table public.transactions (
  id uuid default gen_random_uuid() primary key,
  created_at timestamp with time zone default timezone('utc'::text, now()) not null,
  type text not null, -- 'Income' or 'Expense'
  category text,
  amount numeric not null,
  date date,
  description text
);

-- 4. Enable Row Level Security (RLS) - Optional for starter api
-- For simplicity in this demo, we will allow public read/write.
-- IN PRODUCTION: You should lock this down.
alter table public.properties enable row level security;
alter table public.visits enable row level security;
alter table public.transactions enable row level security;

-- Create policies to allow public access (Demo Mode)
create policy "Allow public read/write properties" on public.properties for all using (true) with check (true);
create policy "Allow public read/write visits" on public.visits for all using (true) with check (true);
create policy "Allow public read/write transactions" on public.transactions for all using (true) with check (true);
