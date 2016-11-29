Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:47768 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756353AbcK2Jug (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Nov 2016 04:50:36 -0500
Date: Tue, 29 Nov 2016 10:50:34 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Archit Taneja <architt@codeaurora.org>
Subject: Re: [PATCH v3 07/13] drm: bridge: vga-dac: Add adi,adv7123
 compatible string
Message-ID: <20161129095034.slso5rellb4cj2za@lukather>
References: <1480410283-28698-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <1480410283-28698-8-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="nhyssak2oxgwond5"
Content-Disposition: inline
In-Reply-To: <1480410283-28698-8-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--nhyssak2oxgwond5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 29, 2016 at 11:04:37AM +0200, Laurent Pinchart wrote:
> The ADV7123 is a transparent VGA DAC. Unlike dumb VGA DACs it can be
> controlled through a power save pin, and requires a power supply.
> However, on most boards where the device is used neither the power save
> signal nor the power supply are controllable.
>=20
> To avoid developing a separate device-specific driver add an
> "adi,adv7123" compatible entry to the dumb-vga-dac driver. This will
> allow supporting most ADV7123-based boards easily, while allowing future
> development of an adv7123 driver when needed without breaking backward
> compatibility.
>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.co=
m>

Acked-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--nhyssak2oxgwond5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYPU9lAAoJEBx+YmzsjxAgnhUQAKevkWGXjIqGEEftvXYbQulH
qlh+zveOiq4AE4Y7GjaDWWwESmmOgs6LsEqncNF3DiYOz0rmtRZvYMmDmBzg7Uem
3eHMDPKOEFZ9t3UjfFRcQHbKzm1AIQ7HwV4RuMdPjaDyJep52T2RaFysOTRIQaqz
bmh22EfpJuhB4PKmBHfexzlZOyv/7mvh77/NdGZT6Ykf6GE/WizZc4V77Uzbzsqa
qNf+M405bjZV8lksjr6YiVYEFN1qyLpOSMGCerWPNoFFC6S930weeejcbTuqJ634
vzbBcdzxhYnE8fZaZIaw0ZSqVurclQpKkeavyCf7928GzQQbt6lyBaHNemW3VmAS
O2UYuhuyHmHLIONaL7cJKpTykoOUlw8bl3VubEoHceCZjRx4wwy0GNKh024OXkEz
p2J9CZKZW8XS5A/CTehnAZeeAjgClaezwdk33aprZ7PrmkIKOwBr8ZAirK+UAYJ6
G9veKECYGP/kLTzi8tXN0lAio7U5hRM4uVqxbwZTwX8kefzZ8/NtjrS+kDDit39W
aBsJiP/2MG3dMxbuepnqGVfpunEzE5LJJY+zT2ssSdZ177NuegOB8KhgQJvhVb46
iXQtYCJHyGOZLphOVQSkGzVXSXnhc8aPyyzGpjMNLTO5kDSQUTWpisdBsCKqhQWI
jO9OiEafFSMvVXbJFwI1
=WBld
-----END PGP SIGNATURE-----

--nhyssak2oxgwond5--
