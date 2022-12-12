<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 * @link https://developer.wordpress.org/apis/wp-config-php/
 * @link https://core.trac.wordpress.org/browser/trunk/wp-config-sample.php
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', MYSQL_DATABASE );

/** MySQL database username */
define( 'DB_USER', MYSQL_USER );

/** MySQL database password */
define( 'DB_PASSWORD', MYSQL_PASSWORD );

/** MySQL hostname */
define( 'DB_HOST', 'mariadb:3306' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'Ed|uF^|>&t-utMGJRFX5$o*k>>Wv3El{M&k7HKfGLi%E8_hlWhw% (9,xn#-mdhD');
define('SECURE_AUTH_KEY',  ',V](cwM`,EY.67lv96cVM-q|Ck*}pJ8*<9T^EF~zh#cOfxm8blCxYiHteQq3~|c-');
define('LOGGED_IN_KEY',    'j`XvI tcD*ZGvw4K@;?VMs`a`I_Iw4i</lD`~p4&(7:mF<5X;Gq]n,aW?W<l`xB*');
define('NONCE_KEY',        'N)nU-9nb/ZIk6iPRq3&pFsPw|[ g^|:pvnk2ri+r$) UMuCi.> ##@=<O&Zz^u[v');
define('AUTH_SALT',        'J@.-+-~83](L!|L_>b!In[7(0|EhR~.#T*VjQ1Q9,A/EDi?[K}0x&`(HtO0c{h?*');
define('SECURE_AUTH_SALT', '_OBxBUGP.|2jO!c4*XrfdG:~,hH8`rNG!FjfT+^kZ-JORKrFY`e![&p>R l96Rhg');
define('LOGGED_IN_SALT',   'x }SK*){$>Jx}o?vYzP/b482{8|?FH-}m6Tt%|:g8/{,kXhzmA{*ah-(yTV@_1Os');
define('NONCE_SALT',       '`<K`5:m(H0+[&rf+m$ioiW,DJ-0<d#@ ZX9@}=@%fx^,jtW98OGJv#+ekG;_-,eI');
/**#@-*/

/**
 * WordPress Database Table prefix.
*/
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', true );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
