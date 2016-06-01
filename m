Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:18428 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932236AbcFAHD4 (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 1 Jun 2016 03:03:56 -0400
From: Felipe Balbi <felipe.balbi@linux.intel.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	mathias.nyman@intel.com, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH v2 0/2] usb: host: xhci: rcar: fix the quirks setting of XHCI_NO_64BIT_SUPPORT
In-Reply-To: <1464763483-6224-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1464763483-6224-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Date: Wed, 01 Jun 2016 10:01:25 +0300
Message-ID: <87bn3ll7ei.fsf@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com> writes:

> I'm afraid but I found a regression of xhci-rcar in v4.7-rc1.
> This regression is caused by the following commit:
>
> commit b1c127ae990bccf0187d741c1695a61e54de1943
> Author: Felipe Balbi <felipe.balbi@linux.intel.com>
> Date:   Fri Apr 22 13:17:16 2016 +0300
>
>     usb: host: xhci: plat: make use of new methods in xhci_plat_priv
>=20=20=20=20=20
>     Now that the code has been refactored enough,
>     switching over to using ->plat_start() and
>     ->init_quirk() becomes a very simple patch.
>=20=20=20=20=20
>     After this patch, there are no further uses for
>     xhci_plat_type_is() which will be removed in a
>     follow-up patch.
>=20=20=20=20=20
>     Acked-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>     Signed-off-by: Felipe Balbi <felipe.balbi@linux.intel.com>
>     Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
>     Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>
> < Overview >
> The regression is the quirks flag "XHCI_NO_64BIT_SUPPORT" will be overwri=
tten
> by xhci_gen_setup(). Then, the driver will not work correctly.
>
> < Detail >
> Since the previous code will do the following, the quirks flag can be set:
>
> xhci_plat_setup()
>  -> xhci_gen_setup(hcd, xhci_plat_quirks);
>   -> xhci->quirks =3D quirks;
>    -> get_quirks() [This is xhci_plat_quirks]
>     -> xhci->quirks |=3D XHCI_NO_64BIT_SUPPORT
>
> However, after we applied the patch above, the quirks will disappear:
>
> xhci_plat_setup()
>  -> xhci_priv_init_quirk();
>   -> xhci_rcar_init_quirk();
>    -> xhci->quirks |=3D XHCI_NO_64BIT_SUPPORT
>   -> xhci_gen_setup(hcd, xhci_plat_quirks);
>    -> xhci->quirks =3D quirks; <----------------- here
>     -> get_quirks() [This is xhci_plat_quirks]
>
> So, I submitted incremental patches to resolve this issue like the follow=
ings:
>
> xhci_plat_setup()
>  -> xhci_priv_init_quirk();
>   -> xhci_rcar_init_quirk();
>   -> xhci_gen_setup(hcd, xhci_plat_quirks);
>    -> xhci->quirks =3D quirks;
>     -> get_quirks() [This is xhci_plat_quirks]
>      -> xhci->quirks |=3D priv->quirks (XHCI_NO_64BIT_SUPPORT)

isn't the following enough?

@@ -4886,7 +4886,7 @@ int xhci_gen_setup(struct usb_hcd *hcd, xhci_get_quir=
ks_t get_quirks)
 		xhci->hcc_params2 =3D readl(&xhci->cap_regs->hcc_params2);
 	xhci_print_registers(xhci);
=20
=2D	xhci->quirks =3D quirks;
+	xhci->quirks |=3D quirks;
=20
 	get_quirks(dev, xhci);
=20
=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXTohFAAoJEIaOsuA1yqRExzkQAKYumCuQ6vWQx82fQJ3Qwqac
3Psqf3+FVvoD9hdX8YIYHSd7VZeKQ7vMGnNn5fLtGjRX3grMLW+cGAFqF2NexH0M
yygxId5AwLBesPp5qmXFjyYKwEe6JXYsQjiJm6J0yaGC+bZqK2tGcPMyF5d48Qb+
7VqohBTVQFGMeUToyvuY+cPoh+OEIk3V+w0wE96TN9prPrhgx+nPpB7q6ip0CwDs
/HUhQ72yLkKtJtwg5kwNrwiYxTNHDdte0u4myoT6JD/fI0mjeIt7KeisvAM9n/X+
c6GzV2N+2UlPfpfAMD1MKjsrrKzjI+pVAEJAgltvU7hzQ8cOxwMidYO1l0lrA7Fl
Zf3npRc2lVt8fGoEAx3QGedzXgjXwaKq4C/8fqvaMJDxXeFmVtVe00fVntkpX4Gd
L/dzThuPtfL1j+OZqLlKAXN8c8n8Z5jEwXG+bn/zaJeJRzcseI41JmYaPglLO5uu
XYv1RZkku33U8dBfAl7D42ZmODGCm8r8saG8bp9KgtOCQpDg18g8fqS1w6M8UrEB
tCXqQRx2g+cImxtA4l2/aPorVSP3+W/QviYig9YR4CLT8x0K5hG8Q6Zsdp7nX8Rx
uT1DtKJShL6GfqtTlEqIbCSTovOGrN3Ui0+IZocBVVYqmA3CsrXoUOVDKEIcpUcK
yedErnqQYWBP2jBykqGP
=/uX0
-----END PGP SIGNATURE-----
--=-=-=--
