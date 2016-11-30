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
Subject: Re: [PATCH 09/12] usb: phy: omap-otg: Replace the extcon API
In-Reply-To: <1480485460-2663-10-git-send-email-cw00.choi@samsung.com>
References: <1480485460-2663-1-git-send-email-cw00.choi@samsung.com> <1480485460-2663-10-git-send-email-cw00.choi@samsung.com>
Date: Wed, 30 Nov 2016 12:41:27 +0200
Message-ID: <87y401meqw.fsf@linux.intel.com>
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

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAlg+rNcACgkQzL64meEa
mQbkbxAAoo67GsGCO1SaplhXumYC84wIib+fHIr+Lfnkwk6hC7a6Cm6EqYm1l8DX
TcoHfLaho7Lq/jVkC8NLAmKnuQFT2C+GdcTNxzHNHG3j5ViWBqqk/WmLAmvGm8Lq
SVc7XmPbcBkP+AZF1k+N9UMR6pEmSs9W9ACyFKxSc8D0lBEbuTsrGlq2TFl/cuZe
ggSvSgFKNu2EW2eh2EdloeL0hBXCAC0Q1us91MGPGR1wx+DLQiyFoNHH9RrI7WJv
b5jwqt2d17IvkjmApSCcs2r/MwAP/Rax0MFbDBTrzOKqhNIQ3xUe2pSY/GSdZxmh
4o34GBeRnDuj8JtTFPnguYYy83gtTqBE2TJNtvI7URVK7rdWMmghEFXvB1frV3gW
pshyG30Y5Ip/hHtWNXyMVGFz9d2IjMm8/vkDjczokPOvvJBlZr53GqkjIPMpQHMO
sI20POnY2VAnEJ665aZCa/svx2ziFuzqj5tdmKmOkYnc/YQdZ+sFRCME/DHYZF6Y
Q3czc+vCXJ/9FjTtfUlanaZTIELLmiBKxZ+FTe1IHDIvw8TWLBOVhOe9PELxyamn
hUVtta5dGSJs6tiojWuDmFF9h43OQPHLqKkDDWMF5n+MrtqZjeZQvT7krZOoAbfJ
XH8+PClLuiASh22d32pDtLjzWm0PqLR/EPdln5PA8q+XzuBUBnQ=
=OehZ
-----END PGP SIGNATURE-----
--=-=-=--
