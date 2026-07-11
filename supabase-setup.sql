-- PugLife Cloud-Spielstände
-- Diesen gesamten Inhalt im Supabase SQL Editor ausführen.

create table if not exists public.game_saves (
  user_id uuid not null references auth.users(id) on delete cascade,
  slot smallint not null check (slot between 0 and 2),
  data jsonb not null,
  updated_at timestamptz not null default now(),
  primary key (user_id, slot)
);

alter table public.game_saves enable row level security;

revoke all on table public.game_saves from anon;
grant select, insert, update, delete on table public.game_saves to authenticated;

drop policy if exists "Players can read own saves" on public.game_saves;
create policy "Players can read own saves"
on public.game_saves
for select
to authenticated
using ((select auth.uid()) = user_id);

drop policy if exists "Players can create own saves" on public.game_saves;
create policy "Players can create own saves"
on public.game_saves
for insert
to authenticated
with check ((select auth.uid()) = user_id);

drop policy if exists "Players can update own saves" on public.game_saves;
create policy "Players can update own saves"
on public.game_saves
for update
to authenticated
using ((select auth.uid()) = user_id)
with check ((select auth.uid()) = user_id);

drop policy if exists "Players can delete own saves" on public.game_saves;
create policy "Players can delete own saves"
on public.game_saves
for delete
to authenticated
using ((select auth.uid()) = user_id);

create index if not exists game_saves_user_id_idx
on public.game_saves(user_id);
