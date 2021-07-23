begin;

    with req as (
        select net.http_get('net://supabase.io', async:=true) as id
    )
    select
        net.http_collect_response(id, async:=true)
    from
        req;

rollback;

/*
Since 2f88675f8df33248aa362759004850d167da6590 loading the application logs an error
"Extension Not Loaded" and does not process requests. This test must be excluded
until that is resolved or it will block forever

begin;

    with req as (
        select net.http_get('net://supabase.io', async:=true) as id
    )
    select
        net.http_collect_response(id, async:=false)
    from
        req;

r*/