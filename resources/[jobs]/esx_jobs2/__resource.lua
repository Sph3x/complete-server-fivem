version '1.0.0'

server_scripts {
  '@mysql-async/lib/MySQL.lua',
  '@es_extended/locale.lua',
  'locales/fr.lua',
  'config.lua',
  'server/esx_jobs_sv.lua'
}

client_scripts {
  '@es_extended/locale.lua',
  'locales/br.lua',
  'locales/de.lua',
  'locales/en.lua',
  'locales/fr.lua',
  'config.lua',
  --'jobs/brasseur.lua',
  --'jobs/fbi.lua',
  'jobs/fermier.lua',
  'jobs/fisherman.lua',
  'jobs/fuel.lua',
  'jobs/lumberjack.lua',
  --'jobs/mafia.lua',
  'jobs/miner.lua',
  --'jobs/biker.lua',
  --'jobs/reporter.lua',
  'jobs/slaughterer.lua',
  --'jobs/tabac.lua',
  'jobs/textil.lua',
  --'jobs/vanilla.lua',
  --'jobs/vigneron.lua',
  'jobs/cuisinier.lua',
  'jobs/electricien.lua',
  --'jobs/joaillier.lua',
  --'jobs/diver.lua',
  'jobs/fossoyeur.lua',
  --'jobs/bahama.lua',
  'client/esx_jobs_cl.lua'
}
