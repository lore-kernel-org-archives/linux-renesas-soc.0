Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Felipe Balbi <balbi@kernel.org>
To: Chanwoo Choi <cw00.choi@samsung.com>, gregkh@linuxfoundation.org,
        kishon@ti.com, sre@kernel.org
Cc: Peter.Chen@nxp.com, wens@csie.org,
        yoshihiro.shimoda.uh@renesas.com, maxime.ripard@free-electrons.com,
        b-liu@ti.com, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, cw00.choi@samsung.com,
        chanwoo@kernel.org
Subject: Re: [PATCH 08/12] usb: phy: msm: Replace the extcon API
In-Reply-To: <1480485460-2663-9-git-send-email-cw00.choi@samsung.com>
References: <1480485460-2663-1-git-send-email-cw00.choi@samsung.com> <1480485460-2663-9-git-send-email-cw00.choi@samsung.com>
Date: Wed, 30 Nov 2016 12:40:52 +0200
Message-ID: <871sxtntcb.fsf@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Chanwoo Choi <cw00.choi@samsung.com> writes:
> This patch uses the resource-managed extcon API for extcon_register_notif=
ier()
> and replaces the deprecated extcon API as following:
> - extcon_get_cable_state_() -> extcon_get_state()
>
> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>

Acked-by: Felipe Balbi <felipe.balbi@linux.intel.com>

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAlg+rLQACgkQzL64meEa
mQbmCg/9GmrJlt+AlHyt4v9JEz4aWS76lpaYF3SfKXC8HGK5QQa9bplll2GZWqYs
3RNUIfvtxSfb/wC6nHzgke306yuuuIjsVvN9xK6YpZmkrO4ozyMT+mciso1uJHeV
ZK9aUKq0zmULIwhYkndWf3vvrGS8A69Hutj5C6awWB6tpyqask51NhILPbWxTTJy
CXJ9Lm6BSWv70JXvxMNHefep8z20cKIHJd6qgWXM9lxRH4EpPq9dNM3r6T5usbn8
1Q9yaT1ixDuu3Ju6FSmWh4B8hMvoGSInZdkEAZyiznDUos3brD8wBBp5chPziRez
0XHv+fBK7NDEcm6eW1z3ox8jbJpBD8aktGNou53FFQdsg+POPRFTAiURlU62WA9H
uVrDV0ahqhe7adEYvdHCM7JorN7R1JTT5mYcVRWoBFm1zxurZj0C1y22QQRMFQfI
HrqKTKQGwVYsvsqnSJla2RZnX8KUamZ/QQTnP8fVF8N6JFgbyuYIWkm0nK5Oc0Kx
00pmzX9yIZ2bEfR1q0w7HfkPR5SzW5GVYTATKrbCpqKeaQA+HloELlS5fFLX74vT
jyy3iX2jauzmJGsniBWqxXAzSb9f9zvpzREzSTgO8pppQgCT5eS0mRUOWn1SWmzk
dGJTTA5G1DlT5wYiwFq5XZ69HK0UVvITFqBcyUWLXrKM6BBS2ns=
=4V4e
-----END PGP SIGNATURE-----
--=-=-=--
