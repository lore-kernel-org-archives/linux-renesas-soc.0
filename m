Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:33552 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932674AbcKVLPA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Nov 2016 06:15:00 -0500
Received: by mail-wm0-f66.google.com with SMTP id u144so3005216wmu.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Nov 2016 03:14:59 -0800 (PST)
Date: Tue, 22 Nov 2016 12:14:57 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v2 06/13] drm: panels: Add LVDS panel driver
Message-ID: <20161122111457.GC22735@ulmo.ba.sec>
References: <1479526093-7014-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <1479526093-7014-7-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="qjNfmADvan18RZcF"
Content-Disposition: inline
In-Reply-To: <1479526093-7014-7-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--qjNfmADvan18RZcF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 19, 2016 at 05:28:06AM +0200, Laurent Pinchart wrote:
> This driver supports LVDS panels that don't require device-specific
> handling of power supplies or control signals. It implements automatic
> backlight handling if the panel is attached to a backlight controller.
>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.co=
m>
> ---
>  drivers/gpu/drm/panel/Kconfig      |  10 ++
>  drivers/gpu/drm/panel/Makefile     |   1 +
>  drivers/gpu/drm/panel/panel-lvds.c | 284 +++++++++++++++++++++++++++++++=
++++++
>  3 files changed, 295 insertions(+)
>  create mode 100644 drivers/gpu/drm/panel/panel-lvds.c

The bulk of this is a duplicate of panel-simple.c and it adds all the
things on top that I've been repeatedly rejecting in the past.

Thierry

--qjNfmADvan18RZcF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJYNCiwAAoJEN0jrNd/PrOhzhwP/jXSadaJjHDHF6XhHHrQInjU
wLd7KILhWmyxjA2QfEy5t9OGHA+EUJC/zfemRiMdFTUUxujXLf/yHPmRR+NF9+nF
rNhEisHVYVySV+FoTMemTbSSOa1HUA9MPORBPGxZnK4wOo4Vsw4kG6mSD9FwfWAH
fBQO6/wj3vGZlN1X1Dyob60JflAIf+WnS7RaQlePF8TUnv+hNVl5aFrWYXogOpfz
LnAfeZl187siTgJkPklsimmFkz0nUX5WLoQ6omN186TaKh5+YKuOFNJm1Bdo8yC7
vT9MOFRGDzl717cUYCtRAHWUqQOX6gjLiqMuWYpB9DIIlX4tT2oQpjUd/Q1EVI9u
raFt+LbBqnARhKzQ4pBoiJozpOle0QLKor0nnljf4GQz8JLJ072CoOjnaMFIRWZZ
RKMAwjDGF3DtESLopQyfthAEu/G6zEDfKJaYyLJpGDkrE6roFy53a8tRTqk4mp49
EOpOoh6TqSQY/50Gfix2wDw8LBDSTM3gw4DOGmJxILzBjm8MKEu3T8mnRZ1IKPz7
Z4PG+06x6FzD6Ma4/OYNRu8JdMT8DVEA7flAGd0VY89h8ptkcnW1VQSpdBR6Zcz5
6lxUKZAGVmbcWxmzjQxYKpJ/guavOR5P7nPWfJZWpOgEQiGmu7PNkcHPQy5Qbfng
398qLuTXfy8YS3aNaqnR
=fdhD
-----END PGP SIGNATURE-----

--qjNfmADvan18RZcF--
