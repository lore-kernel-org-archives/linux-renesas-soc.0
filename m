Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:33650 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729046AbeGQJPC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Jul 2018 05:15:02 -0400
Date: Tue, 17 Jul 2018 10:43:29 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Eddie James <eajames@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 2/3] i2c: recovery: require either get_sda or set_sda
Message-ID: <20180717084329.ytoayby4ccfhr4wa@ninjato>
References: <20180710214217.1336-1-wsa+renesas@sang-engineering.com>
 <20180710214217.1336-3-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="jrzgqvqw2jogw5ww"
Content-Disposition: inline
In-Reply-To: <20180710214217.1336-3-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--jrzgqvqw2jogw5ww
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 10, 2018 at 11:42:16PM +0200, Wolfram Sang wrote:
> For bus recovery, we either need to bail out early if we can read SDA or
> we need to send STOP after every pulse. Otherwise recovery might be
> misinterpreted as an unwanted write. So, require one of those SDA
> handling functions to avoid this problem.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-next, thanks!


--jrzgqvqw2jogw5ww
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAltNrC0ACgkQFA3kzBSg
Kbaxyg/9ENuE10YfDzX/sIvSF9zfZGFcqddvL11xlZ//tRmm/2OUeqU01144d39O
44HegJPq0O/1CxsAlJ3mQAFW2Zw3yDDicJf9YVcCxw7MBz37wDRfPFwC9s5rLa8E
puMHKXrPQneF+ksiCflfUAZbWcty+t2Duz784pxQQd2mTBkqtaerVm6kWLuKnTee
UtjHosvjhkfEG21m+12ywkoPW16g7mLeI6avdhhUTZPPRMS7LxR810ITZmNv7qeC
z/ZhnjsbzuH6EF3/FJZhO3+ePYuL9amwQHXbcALiGfal3g2gj+EOjjgMSvr79U5k
PcowCGINrJq73hMbgDoi8e6qjoE6Ir7zMqbs9ySDlAdocGqsR7YooWfLK5C+gxzo
mch/vDC3fXUwxPYrRUa+lGjJGfQiKmc8wV7uwBmYVdUAf7fneSmV9l/S3Ch4L0BG
gg/Fv5SYYz662SN1NCltnTx5Mn6GVOxIB3IsdRhtK5CBtyrK2g2mwhMpFFOoWtMh
4w9Wy5TtYemkcGd5X+pQsxbnl1++4/FDEUmRNmRdMDnuyyCRZwmj1mq88VIojHvq
e9s74SZUe/CD87rGaiheOn9yX5D4ysOgO/bu1YqKkRmaKesmo+gIbNMKQWYwnHv6
euwDM0MFgvGtxk79CeFUjK56N63MnMGlbYccr/7i97z0XVlu05w=
=3Jbx
-----END PGP SIGNATURE-----

--jrzgqvqw2jogw5ww--
