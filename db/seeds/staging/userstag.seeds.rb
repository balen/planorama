if !Person.find_by(name: 'chicon admin')
    p = Person.create(
        name: 'chicon admin',
        password: 321321
    )

    EmailAddress.create(
        person: p,
        isdefault: true,
        email: 'chiconadmin@test.com',
        is_valid: true
    )

    PersonRole.create(
        person: p,
        role: PersonRole.roles[:admin]
    )

end

if !Person.find_by(name: 'test')
    p = Person.create(
        name: 'test',
        password: 111111
        # confirmed_at: Time.now
    )

    EmailAddress.create(
        person: p,
        isdefault: true,
        email: 'test@test.com',
        is_valid: true
    )

    PersonRole.create(
        person: p,
        role: PersonRole.roles[:admin]
    )
end

p "Created special admin user for staging environment."
