-- ============================================================
-- SolarCRM — Supabase SQL Setup
-- Run this in: Supabase Dashboard → SQL Editor → New Query
-- ============================================================

-- 1. Create the contacts table
create table if not exists contacts (
  id            uuid        default gen_random_uuid() primary key,
  name          text        not null,
  email         text,
  phone         text,
  address       text,
  stage         text        not null default 'New Lead',
  source        text,
  system_size   text,
  value         numeric     default 0,
  notes         text        default '',
  score         integer     default 50 check (score >= 0 and score <= 100),
  tasks         text[]      default '{}',
  last_contact  date,
  created_at    timestamptz default now()
);

-- 2. Enable Row Level Security
alter table contacts enable row level security;

-- 3. Allow all operations (open policy — tighten with auth later)
create policy "Public access"
  on contacts for all
  using (true)
  with check (true);

-- 4. Enable Realtime (for live updates across team members)
alter publication supabase_realtime add table contacts;

-- ============================================================
-- Optional: seed sample data to test
-- ============================================================
insert into contacts (name, email, phone, address, stage, source, system_size, value, notes, score, tasks, last_contact)
values
  ('Maria Gonzalez', 'maria@example.com', '(720) 555-0102', '4821 Elm St, Denver, CO', 'Proposal Sent', 'Referral', '10–20kW', 28000, 'Interested in battery storage. Follow up Friday.', 85, array['Send proposal PDF', 'Schedule site visit'], '2026-03-20'),
  ('James Whitfield', 'james.w@email.net', '(303) 555-0198', '702 Maple Ave, Aurora, CO', 'Consultation', 'Website', '5–10kW', 14500, 'HOA approval pending. Check back April.', 60, array['Confirm HOA status'], '2026-03-22'),
  ('Priya Sharma', 'priya.sharma@work.co', '(720) 555-0345', '19 Sunridge Blvd, Lakewood, CO', 'Installation', 'Google Ad', '20–50kW', 62000, 'Install scheduled April 3. Permit cleared.', 95, '{}', '2026-03-25'),
  ('Tom Callahan', 'tom@callahan.biz', '(720) 555-0011', '330 Oak Dr, Littleton, CO', 'New Lead', 'Door Knock', '< 5kW', 8200, '', 30, array['Initial call'], '2026-03-26'),
  ('Sofia Reyes', 'sofia.r@mail.com', '(303) 555-0512', '8 Meadow Ln, Thornton, CO', 'Completed', 'Referral', '10–20kW', 22000, 'Install complete. Asked for referral card.', 100, '{}', '2026-03-10');
