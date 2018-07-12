Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:60040 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1733154AbeGLVu1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Jul 2018 17:50:27 -0400
Date: Thu, 12 Jul 2018 23:38:59 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Eddie James <eajames@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 1/3] i2c: recovery: if possible send STOP with
 recovery pulses
Message-ID: <20180712213859.2btuqc7hfoeo3usk@ninjato>
References: <20180710214217.1336-1-wsa+renesas@sang-engineering.com>
 <20180710214217.1336-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="aqhppz2rqvalxnr3"
Content-Disposition: inline
In-Reply-To: <20180710214217.1336-2-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--aqhppz2rqvalxnr3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 10, 2018 at 11:42:15PM +0200, Wolfram Sang wrote:
> I2C clients may misunderstand recovery pulses if they can't read SDA to
> bail out early. In the worst case, as a write operation. To avoid that
> and if we can write SDA, try to send STOP to avoid the
> misinterpretation.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-current, thanks!


--aqhppz2rqvalxnr3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAltHynMACgkQFA3kzBSg
Kbbmzw/9EiZW+hFY0Bx4Nm7DQdAkR/T1zG+9gItVg/xPjm3Ln987b867qlCgGMdb
/iQ/tssy/Mbj7DftiLvSyu76xYMcd7cPsnO1JsGipbGEl9fcnmPsDVYZwi7ZhDM5
b9P+dX4qC8DtcWATlPY6WlNAxQ71SZG/IweuJAylEXW2/ty5mmt1DSuukADUqcoE
QWa6scIjTOWH8X0GNNSG11Wb+wycTab5q9EMl/f+InNVfRIYwheNISSJ4PBugzba
T6oYAv3mAQosNYvWV0gOKbdwF7TfUOoQ8PDYMcm6p1rmWGArUBdS3uZH4fIYXLy5
1HtIuguKYmywwm7w/o9anqUW/TnxBHX+DfNWSdcOtOFm3cXVFetKeFfnWMmJVHIg
0dOX/7pzzewDTqEaJjNH5PQQP/c4pmvFRa4T/S5ZtF+K29cIFBAVofGmnDbNTVio
dA54CQwOZKOqp/TwPsLUvY0XPeFnT85zuM1nZ9zAsNvWI3w8sgtArKPoVG1PXtxD
IEowKXdn9DVTiElXwxKmer0Tve0h1pkjkCAa3IFRSBt/wNKdrBOL4m/jOi+r8ps+
CnO6uz+aBvdJjmhB2cvVnzdQ3Weyl4T9ihaMZpce+0tO4zZhXDeYeeciEl72OtKJ
39EL6hnFTOgkU01HMR4xnprfyqwAbDJamEmIbBdbTNRlp8wh5j0=
=/wF2
-----END PGP SIGNATURE-----

--aqhppz2rqvalxnr3--
