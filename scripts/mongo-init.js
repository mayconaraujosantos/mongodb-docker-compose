db.createUser({
    user: 'app_user',
    pwd: 'app_pass',
    roles: [
      {
        role: 'dbOwner',
        db: 'my-app-db',
      },
    ],
  });