-- Users table indexes
CREATE INDEX idx_users_email
    ON users(email);

-- Bookings table indexes
CREATE INDEX idx_bookings_user_id
    ON bookings(user_id);

CREATE INDEX idx_bookings_property_id
    ON bookings(property_id);

CREATE INDEX idx_bookings_start_date
    ON bookings(start_date);

-- Properties table indexes
CREATE INDEX idx_properties_name
    ON properties(name);
