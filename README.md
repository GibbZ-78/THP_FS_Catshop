:warning: :construction: :bangbang: This repo is still WIP :bangbang: :construction: :warning:  
  
# THP Full-stack (Winter 2022)
## Proposition of a THP-dedicated RSKYS, _a.k.a._ Rails Starter Kit for Young Sailors

### :scroll: Content
  
- **Framework:** this repo contains a complete _Rails_ directory using version 5.2.6 (as recommanded by THP as of March 2022, even though v7.0.2 is out already) and PostGreSQL.

- **Database:** as already stated above, this starter kit relies on PostGreSQL (last server version was 14.2 by the time I wrote) for all environment - development, test and production. Some adaptations might however be needed to deploy in production on 

- **Mailer:** in its current version, this starter kit uses SendGrid as a mailer, for DEV & PROD environments. Alternatley, Letter Opener could be used in developement with little additional configuration.

- **CSS**: the present Rails starter kit is proposed with a full version of Bootstrap 5+ being loaded via the related gem (within the Gemfile)

- **Turbolinks:** being skipped for compatibility reasons with Javascript and related events management (e.g. Bootstrap)

### :bulb: How to
  
1. Clone the current :octocat: repository to your local :computer:
2. Change to the related directory
3. Make sure you have PostGreSQL installed and running on your machine
4. (Re)create the development and test databases using the ```rails db:create``` command
5. Once verified your different migration files in the _db/_ directory, (Re)generate your tables' scheme launching ```rails db:migrate```
6. Fill development database with ```rails db:seed``` one made sure you completed your _db/seed.rb_ file
7. Have (extra supra) fun :satisfied: with this empty yet preconfigured Rails environment!

### :computer: Development Environment

- Ubuntu 20.04 running on WSL 2 hosted by Windows 10
- Ruby 2.7.4
- Rails 5.2.6

### :closed_lock_with_key: Credits
  
&copy; 2022 - Jean-Baptiste VIDAL ([:octocat:](https://github.com/GibbZ-78))  
    
Enjoy, _wanderer_ :wink: !  
  