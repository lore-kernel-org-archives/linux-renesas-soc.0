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
Subject: Re: [PATCH 11/12] usb: phy: tahvo: Replace the deprecated extcon API
In-Reply-To: <1480485460-2663-12-git-send-email-cw00.choi@samsung.com>
References: <1480485460-2663-1-git-send-email-cw00.choi@samsung.com> <1480485460-2663-12-git-send-email-cw00.choi@samsung.com>
Date: Wed, 30 Nov 2016 12:42:41 +0200
Message-ID: <87shq9meou.fsf@linux.intel.com>
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
> This patch replaces the deprecated extcon API as following:
> - extcon_set_cable_state_() -> extcon_set_state_sync()
>
> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>

Acked-by: Felipe Balbi <felipe.balbi@linux.intel.com>

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAlg+rSEACgkQzL64meEa
mQYu4w/+O+zzVwXdA9Dnr8vT8b4IqP9TCXF3bY+HfyrSQL4EQWpM7TQVjxmLm0U1
auWGuqYGH3uMo3NVOv6iVEV8//hipl1VF5aSnvJqqCuT2HCqJ9IWIDG4r/OsTB9l
tkNVOz2WFr+m+DujvYninh0nKroWhJjU3c4AO0dIjv/ItibEGCRCIGSQfEuWgxf0
NrCoOr7tRl8J1EjdToCv8VFAzvcccUpSgrTEFqGxw/H3JCycWUyl4HEYrSS24mYI
83oEu4fPAFO0ak8cIHJrcbzdIhI3a7LJvZACVkHueTU09FfQRlO8giDyUim+djKh
ibSJOnZY3yKMHEpZbD2xrp5C2PBHfy3cNWxHc8c+TwRdV4SiD/HTx4787sdI9T1B
RaoKIjLj8YKsxgry1xj/dh/u6ZHgBZbIzJDXv4q5XruB89UkENLAABCv1ApduOl9
q2kmwAjutMHJgfndLoAEaDPqyw5xBHBpe1JwFeWUuuJxr0KhDdehzjUIfAhcCd+8
s/B4yHOpzL+TL5qZCvwwwdziTfpCCAdVS3uMUqeOo+90N48AW/HguVzba3oLAeL5
9uWV7q+WJESB3gnAsZqJtW6pSyVwJucI+R7ZwbIdnvt3uL1Vfw29padVkf0rSSuM
mXw/bzVw+VpQ+ALq3t/1zoDCS1z1+84fCARmdxafPSfbfyaAL0Y=
=0Y/E
-----END PGP SIGNATURE-----
--=-=-=--
