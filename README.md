# ☀️ SolarCRM

A production-ready solar sales CRM built with Next.js 14, Supabase, and Vercel.

## Stack
- **Frontend**: Next.js 14 (App Router) + TypeScript
- **Database**: Supabase (Postgres + Realtime)
- **Hosting**: Vercel (auto-deploy from GitHub)

---

## 🚀 Deploy in 4 Steps

### 1. Set up Supabase
1. Create a project at [supabase.com](https://supabase.com)
2. Go to **SQL Editor** → paste and run `supabase_setup.sql`
3. Go to **Settings → API** → copy your `Project URL` and `anon public key`

### 2. Configure environment
```bash
cp .env.example .env.local
# Fill in your Supabase credentials in .env.local
```

### 3. Run locally
```bash
npm install
npm run dev
# Open http://localhost:3000
```

### 4. Deploy to Vercel
```bash
git init && git add . && git commit -m "Initial SolarCRM"
# Push to GitHub, then import repo at vercel.com
# Add env vars in Vercel: NEXT_PUBLIC_SUPABASE_URL + NEXT_PUBLIC_SUPABASE_ANON_KEY
```

---

## Features
- Kanban pipeline across 9 deal stages
- Contact management with search & filters
- Lead scoring, task tracking, notes
- Dashboard with KPIs, stage breakdown, hot leads
- Real-time sync across team members (Supabase Realtime)
- Best practices guide for solar sales
