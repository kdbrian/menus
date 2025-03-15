CREATE SCHEMA IF NOT EXISTS schema_menus;

CREATE  TABLE analytics_events ( 
	id                   integer  NOT NULL  ,
	event_name           varchar(20)    ,
	event_code           varchar(6)  NOT NULL  ,
	event_for            varchar(120)    ,
	tags                 varchar[]    ,
	created_at           date DEFAULT CURRENT_DATE   ,
	updated_at           date    ,
	deleted_at           date    ,
	CONSTRAINT pk_analytics_events PRIMARY KEY ( id ),
	CONSTRAINT unq_analytics_events_event_code UNIQUE ( event_code ) 
 );

CREATE  TABLE contact_info ( 
	id                   integer  NOT NULL  ,
	location_name        varchar(100)  NOT NULL  ,
	zip_code             varchar    ,
	lat_lng              jsonb    ,
	created_at           date DEFAULT CURRENT_DATE   ,
	updated_at           date    ,
	deleted_at           date    ,
	CONSTRAINT pk_contact_info PRIMARY KEY ( id )
 );

CREATE  TABLE menu_items ( 
	id                   integer  NOT NULL  ,
	contents             json[]    ,
	images               json    ,
	price                double precision    ,
	tags                 varchar[]    ,
	unit_at              varchar(6)    ,
	unit_scale           varchar    ,
	unit_symbol          varchar[]    ,
	serving_type         varchar    ,
	discounted           bit    ,
	total_kcal           double precision    ,
	meta                 jsonb    ,
	created_at           date DEFAULT CURRENT_DATE   ,
	updated_at           date    ,
	deleted_at           date    ,
	CONSTRAINT pk_menu_items PRIMARY KEY ( id )
 );

CREATE  TABLE reviews ( 
	id                   integer  NOT NULL  ,
	"content"            varchar    ,
	star_rating          varchar    ,
	created_at           date DEFAULT CURRENT_DATE   ,
	updated_at           date    ,
	deleted_at           date    ,
	CONSTRAINT pk_reviews PRIMARY KEY ( id )
 );

CREATE  TABLE roles ( 
	role_id              integer  NOT NULL  ,
	role_name            varchar(100)    ,
	code                 varchar(4) DEFAULT 901   ,
	description          varchar(48)    ,
	created_at           date DEFAULT CURRENT_DATE   ,
	updated_at           date    ,
	deleted_at           date    ,
	CONSTRAINT pk_roles PRIMARY KEY ( role_id )
 );

CREATE  TABLE system ( 
	id                   integer  NOT NULL  ,
	os                   integer    ,
	server_id            integer    ,
	created_at           date DEFAULT CURRENT_DATE   ,
	updated_at           date    ,
	deleted_at           date    ,
	CONSTRAINT pk_system PRIMARY KEY ( id )
 );

CREATE  TABLE users ( 
	id                   integer  NOT NULL  ,
	firebase_user_id     varchar    ,
	phone                bigint    ,
	email                varchar    ,
	meta                 jsonb    ,
	is_verified          bit    ,
	contact_info         integer    ,
	settings             json    ,
	date_joined          date DEFAULT CURRENT_DATE   ,
	created_at           date DEFAULT CURRENT_DATE   ,
	updated_at           date    ,
	deleted_at           date    ,
	CONSTRAINT pk_users PRIMARY KEY ( id ),
	CONSTRAINT unq_users_user_id UNIQUE ( firebase_user_id ) 
 );

CREATE  TABLE business ( 
	id                   integer  NOT NULL  ,
	name                 varchar(100)  NOT NULL  ,
	"location"           varchar  NOT NULL  ,
	contact_info         integer    ,
	profile_id           integer    ,
	created_at           date DEFAULT CURRENT_DATE   ,
	updated_at           date    ,
	deleted_at           date    ,
	CONSTRAINT pk_business PRIMARY KEY ( id )
 );

CREATE  TABLE delivery_info ( 
	user_id              integer    ,
	id                   integer  NOT NULL  ,
	contact_info         integer    ,
	is_public            bit    ,
	created_at           date DEFAULT CURRENT_DATE   ,
	updated_at           date    ,
	deleted_at           date    ,
	CONSTRAINT pk_delivery_info PRIMARY KEY ( id )
 );

CREATE  TABLE device_info ( 
	id                   integer  NOT NULL  ,
	user_id              integer  NOT NULL  ,
	name                 varchar(100)    ,
	model                varchar    ,
	meta                 jsonb    ,
	ip_adress            varchar    ,
	created_at           date DEFAULT CURRENT_DATE   ,
	updated_at           date    ,
	deleted_at           date    ,
	CONSTRAINT pk_device_info PRIMARY KEY ( id )
 );

CREATE  TABLE lists ( 
	id                   integer  NOT NULL  ,
	name                 varchar(100)    ,
	user_id              integer    ,
	meta                 jsonb    ,
	is_public            bit(9999999)    ,
	created_at           date DEFAULT CURRENT_DATE   ,
	updated_at           date    ,
	deleted_at           date    ,
	CONSTRAINT pk_lists PRIMARY KEY ( id )
 );

CREATE  TABLE menus ( 
	id                   integer  NOT NULL  ,
	title                varchar    ,
	business_id          integer    ,
	created_at           date DEFAULT CURRENT_DATE   ,
	updated_at           date    ,
	delete_at            date    ,
	tags                 varchar[]    ,
	CONSTRAINT pk_menus PRIMARY KEY ( id )
 );

CREATE  TABLE notification_channels ( 
	id                   integer  NOT NULL  ,
	channel_title        varchar(18)    ,
	created_by           integer    ,
	created_at           date DEFAULT CURRENT_DATE   ,
	updated_at           date    ,
	deleted_at           date    ,
	CONSTRAINT pk_notification_channels PRIMARY KEY ( id )
 );

CREATE  TABLE notification_subscribers ( 
	user_id              integer    ,
	channel_id           integer    
 );

CREATE  TABLE orders ( 
	id                   integer  NOT NULL  ,
	user_id              integer  NOT NULL  ,
	total                double precision    ,
	discounted           bit(9999999)    ,
	discount_amount      double precision    ,
	completed            bit    ,
	meta                 jsonb    ,
	delivery_info        integer    ,
	created_at           date DEFAULT CURRENT_DATE   ,
	updated_at           date    ,
	deleted_at           date    ,
	CONSTRAINT pk_orders PRIMARY KEY ( id )
 );

CREATE  TABLE user_roles ( 
	user_id              integer  NOT NULL  ,
	role_id              integer  NOT NULL  ,
	CONSTRAINT pk_user_roles PRIMARY KEY ( user_id )
 );

CREATE  TABLE analytics ( 
	id                   integer  NOT NULL  ,
	device_info          integer  NOT NULL  ,
	event_code           varchar(6)    ,
	created_at           date DEFAULT CURRENT_DATE   ,
	updated_at           date    ,
	deleted_at           date    ,
	CONSTRAINT pk_analytics PRIMARY KEY ( id )
 );

CREATE  TABLE list_reviews ( 
	id                   integer  NOT NULL  ,
	list_id              integer  NOT NULL  ,
	review_id            integer  NOT NULL  ,
	user_id              integer    ,
	created_at           date DEFAULT CURRENT_DATE   ,
	updated_at           date    ,
	deleted_at           date    ,
	CONSTRAINT pk_list_reviews PRIMARY KEY ( id )
 );

CREATE  TABLE menu_menu_items ( 
	menu                 integer    ,
	menu_items           integer    
 );

CREATE  TABLE menus_orders ( 
	menu_item_id         integer  NOT NULL  ,
	order_id             integer    ,
	CONSTRAINT pk_menu_order PRIMARY KEY ( menu_item_id )
 );

CREATE  TABLE order_review ( 
	id                   integer  NOT NULL  ,
	order_id             integer  NOT NULL  ,
	review_id            integer    ,
	created_at           date DEFAULT CURRENT_DATE   ,
	updated_at           date    ,
	deleted_at           date    ,
	CONSTRAINT pk_order_review PRIMARY KEY ( id )
 );

ALTER TABLE analytics ADD CONSTRAINT fk_analytics_device_info FOREIGN KEY ( device_info ) REFERENCES device_info( id );

ALTER TABLE analytics ADD CONSTRAINT fk_analytics_analytics_events FOREIGN KEY ( event_code ) REFERENCES analytics_events( event_code );

ALTER TABLE business ADD CONSTRAINT fk_business_contact_info FOREIGN KEY ( contact_info ) REFERENCES contact_info( id ) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE business ADD CONSTRAINT fk_business_user FOREIGN KEY ( profile_id ) REFERENCES users( id ) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE delivery_info ADD CONSTRAINT fk_delivery_info_contact_info FOREIGN KEY ( contact_info ) REFERENCES contact_info( id );

ALTER TABLE delivery_info ADD CONSTRAINT fk_delivery_info_users FOREIGN KEY ( user_id ) REFERENCES users( id );

ALTER TABLE device_info ADD CONSTRAINT fk_device_info_users FOREIGN KEY ( user_id ) REFERENCES users( id );

ALTER TABLE list_reviews ADD CONSTRAINT fk_list_reviews_lists FOREIGN KEY ( list_id ) REFERENCES lists( id );

ALTER TABLE list_reviews ADD CONSTRAINT fk_list_reviews_reviews FOREIGN KEY ( review_id ) REFERENCES reviews( id );

ALTER TABLE list_reviews ADD CONSTRAINT fk_list_reviews_users FOREIGN KEY ( user_id ) REFERENCES users( id );

ALTER TABLE lists ADD CONSTRAINT fk_lists_users FOREIGN KEY ( user_id ) REFERENCES users( id );

ALTER TABLE menu_menu_items ADD CONSTRAINT fk_menu_menu_items_menus FOREIGN KEY ( menu ) REFERENCES menus( id ) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE menu_menu_items ADD CONSTRAINT fk_menu_menu_items_menu_items FOREIGN KEY ( menu_items ) REFERENCES menu_items( id );

ALTER TABLE menus ADD CONSTRAINT fk_menus_contact_info FOREIGN KEY ( business_id ) REFERENCES business( id ) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE menus_orders ADD CONSTRAINT fk_menus_orders_orders FOREIGN KEY ( order_id ) REFERENCES orders( id ) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE menus_orders ADD CONSTRAINT fk_menus_orders_menu_items FOREIGN KEY ( menu_item_id ) REFERENCES menu_items( id ) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE notification_channels ADD CONSTRAINT fk_notification_channels_users FOREIGN KEY ( created_by ) REFERENCES users( id );

ALTER TABLE notification_subscribers ADD CONSTRAINT fk_notification_subscribers FOREIGN KEY ( channel_id ) REFERENCES notification_channels( id ) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE notification_subscribers ADD CONSTRAINT fk_notification_subscribers_users FOREIGN KEY ( user_id ) REFERENCES users( id ) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE order_review ADD CONSTRAINT fk_order_review_orders FOREIGN KEY ( order_id ) REFERENCES orders( id );

ALTER TABLE order_review ADD CONSTRAINT fk_order_review_reviews FOREIGN KEY ( review_id ) REFERENCES reviews( id );

ALTER TABLE orders ADD CONSTRAINT fk_orders_users FOREIGN KEY ( user_id ) REFERENCES users( id );

ALTER TABLE orders ADD CONSTRAINT fk_orders_delivery_info FOREIGN KEY ( delivery_info ) REFERENCES delivery_info( id );

ALTER TABLE user_roles ADD CONSTRAINT fk_user_roles_roles FOREIGN KEY ( role_id ) REFERENCES roles( role_id );

ALTER TABLE user_roles ADD CONSTRAINT fk_user_roles_users FOREIGN KEY ( user_id ) REFERENCES users( id );

ALTER TABLE users ADD CONSTRAINT fk_users_contact_info FOREIGN KEY ( contact_info ) REFERENCES contact_info( id );

COMMENT ON TABLE analytics_events IS 'REPRESENT EVENTS WE WITH TO TRACK SYSTEM WIDE';

COMMENT ON COLUMN analytics_events.event_code IS 'SPECIFICALLY USED FOR LOGING AND MIGHT LATER BE USED FOR EXAMPLE TO CREATE PERSONALIZED DASHES';

COMMENT ON COLUMN analytics_events.event_for IS 'PURPOSE OF EVENT';

COMMENT ON TABLE contact_info IS 'REPRESENTS CONTACT INFORMATION READY FOR ANY ENTITY THAT MIGHT NEED IT';

COMMENT ON TABLE menu_items IS 'MENU ITEMS ENTITY';

COMMENT ON TABLE reviews IS 'REVIEW ENTITY ALSO READY FOR ANY RELATION THAT NEEDS IT,
NOTE THAT A REVIEW CANNOT EXIST ON ITSELF, SHOULD LINK TO SOMETHING
E.G, linking to a list creates relation lists_reviews with links to this relation';

COMMENT ON TABLE roles IS 'THE APPLICATION SUPPORTED ROLES
WITH A CODE,NAME AND DESCRIPTION';

COMMENT ON TABLE system IS 'USE NOT YET CLEAR BUT REPRESENTS THE STRUCTURE OF THE SERVER';

COMMENT ON TABLE users IS '-- REPRESENTS ANY AUTHENTICATED CONTEXT INSIDE THE APP
-- NECESSARY TO PERFORM PERSISTENT AND MOSTLY PRIVATE ACTIONS
-- FOR EXAMPLE CREATING LISTS, REVIEWS OR ORDERS';