# Copyright (C) 2008-2009 Sun Microsystems, Inc. All rights reserved.
# Use is subject to license terms.
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; version 2 of the License.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
# General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301
# USA

query:
	select | insert | update | delete | transaction ;

select:
	SELECT select_item FROM join where order_by limit;

select_item:
	* | X . _field | COUNT( X . _field ) | COUNT( * ) ;

join:
	_table AS X | 
	_table AS X LEFT JOIN _table AS Y ON ( X . _field = Y . _field ) ;

_table:
	A | B | C | D ;	# Avoid using overly large tables, such as table E

where:
	|
	WHERE X . _field < value |
	WHERE X . _field > value |
	WHERE X . _field = value ;

where_delete:
	|
	WHERE _field < value |
	WHERE _field > value |
	WHERE _field = value ;

order_by:
	| ORDER BY X . _field ;

limit:
	| LIMIT digit ;
	
insert:
	INSERT INTO _table ( _field , _field ) VALUES ( value , value ) ;

update:
	UPDATE _table AS X SET _field = value where order_by limit ;

delete:
	DELETE FROM _table where_delete LIMIT digit ;

transaction:
	START TRANSACTION | COMMIT | ROLLBACK ;

value:
	' letter ' | digit | _date | _datetime | _time ;
