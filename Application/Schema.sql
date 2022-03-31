-- Your database schema. Use the Schema Designer at http://localhost:8001/ to add some tables.
CREATE TABLE items (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    name TEXT NOT NULL,
    price DOUBLE PRECISION NOT NULL
);
