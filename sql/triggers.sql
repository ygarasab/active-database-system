create or replace function execute_sell()
returns trigger as $execute_sell$
    declare
        product products;
    begin
        select * into product from products where id = new.product_id limit 1;
        if new.amount >  product.amount then
            raise exception 'cannot sell more than stock amount';
        end if;
        update products set amount = amount - new.amount where id = new.product_id;

        select * into product from products where id = new.product_id limit 1;
        if product.amount = 0 then
            execute 'notify stock, ''No stock left for product '|| product.id || '''';
        elsif product.amount < 5 then
            execute 'notify stock, ''Low stock for product '|| product.id || '''';
        end if;
        return new;
    end;
$execute_sell$ language plpgsql;

create trigger execute_sell before insert on sells
    for each row execute procedure execute_sell();


