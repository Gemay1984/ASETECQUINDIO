-- COPIA Y PEGA ESTO EN EL EDITOR SQL DE SUPABASE

-- 1. Tabla de Propiedades
create table public.properties (
  id uuid default gen_random_uuid() primary key,
  created_at timestamp with time zone default timezone('utc'::text, now()) not null,
  title text not null,
  price numeric not null,
  type text not null,
  currency text default 'USD',
  address text,
  bedrooms numeric,
  bathrooms numeric,
  area numeric,
  description text,
  status text default 'Available',
  images text[]
);

-- 2. Tabla de Visitas
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

-- 3. Tabla de Transacciones
create table public.transactions (
  id uuid default gen_random_uuid() primary key,
  created_at timestamp with time zone default timezone('utc'::text, now()) not null,
  type text not null,
  category text,
  amount numeric not null,
  date date,
  description text
);

-- 4. Permitir acceso público (Para que funcione sin login complejo)
alter table public.properties enable row level security;
alter table public.visits enable row level security;
alter table public.transactions enable row level security;

create policy "Acceso publico propiedades" on public.properties for all using (true) with check (true);
create policy "Acceso publico visitas" on public.visits for all using (true) with check (true);
create policy "Acceso publico transacciones" on public.transactions for all using (true) with check (true);
