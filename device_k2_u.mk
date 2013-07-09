# Copyright (C) 2013 Simon Sickle <simon@simonsickle.com>
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.

PRODUCT_COPY_FILES += \
    device/htc/k2_u/recovery/sbin/choice_fn:recovery/root/sbin/choice_fn \
    device/htc/k2_u/recovery/sbin/detect_key:recovery/root/sbin/detect_key \
    device/htc/k2_u/recovery/sbin/offmode_charging:recovery/root/sbin/offmode_charging \
    device/htc/k2_u/recovery/sbin/power_test:recovery/root/sbin/power_test

PRODUCT_NAME := One SV
PRODUCT_DEVICE := k2_u
