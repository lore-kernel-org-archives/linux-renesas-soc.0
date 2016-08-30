Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:40739 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754573AbcH3P3Q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Aug 2016 11:29:16 -0400
Date: Tue, 30 Aug 2016 17:29:08 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Simon Horman <horms+renesas@verge.net.au>
Cc: linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v3 01/13] ARM: dts: lager: rename and reindex i2cexio
Message-ID: <20160830151819.GA1695@katana>
References: <1466567031-20381-1-git-send-email-horms+renesas@verge.net.au>
 <1466567031-20381-2-git-send-email-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="rS8CxjVDS/+yyDmU"
Content-Disposition: inline
In-Reply-To: <1466567031-20381-2-git-send-email-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--rS8CxjVDS/+yyDmU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Simon,

>  		serial0 = &scif0;
>  		serial1 = &scifa1;
> -		i2c8 = "i2cexio";
> +		i2c10 = "i2cexio0";

Those should be pointers, i.e. "&i2cexio0;", here and in the rest of
your series. Sorry for the broken template! Did you have a chance to
test my fix for the demuxer?

Regards,

   Wolfram


--rS8CxjVDS/+yyDmU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXxaZEAAoJEBQN5MwUoCm23R4P/1BwZs71H7SfAn/hwTEHaTW/
u1LgNq/sBVOCHXhOjg1I+xxQgfWt70nBBF6tjySaR0JfGZyydQAmgdjmfYo2cpu5
xSn6LHU+q1VLXfzPeFz79MECAD/2blcK/j8b1/o6dGCkj2iq3nBe1mhm1BurbcAq
vu/HyRU/+xM23yZZAEPvjeXX0teggAoZJOYdGVk0fL6jUaHAUtdYiUqfm/13unE8
mwmcbmnWTCY9RtIXTtgIUbZ5WsZPHVaerpg9MaG/rp+Llf5HKmhWCJUme/Di7ini
EP2rMe7cFEbinwRemKqiXSgGof6/cymPCa+hwiCVcVu5UC04um5nuV4WPq7LUlh5
hqf4RoszLE11Gaq5eIvr+zUaaQ7wtMlSI4xDFnuNhIAn5K/f4h4n0vpViEhFy4x5
6lCDPfS4g2FKYYSFiGvBNAirOgJNX3dyKxgtZQ4beuNEvvHKCE5CJnd9T+bcBzMN
NR6CVdgCAxgnVVlsCSr/YLvl2sMoCHR1ChblW90TWNdXyHH9Sh4p3j6/DUrFBJBS
Y+vuUozfub6WEsIEe6Eer97M7r18Evyo8twVnQfZPXinkFCr6YeUIMGV4+9hh7Rs
nRdeqcc1LLryJatkuoX2sjqCyASl0R2RR5EkYypGKWNHnz1uSmDb3zSrE30S0j+p
Tj3p0B3SP3hmJUaZBPd7
=v+Bk
-----END PGP SIGNATURE-----

--rS8CxjVDS/+yyDmU--
