Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from www.zeus03.de ([194.117.254.33]:54078 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751262AbdHCHnG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Aug 2017 03:43:06 -0400
Date: Thu, 3 Aug 2017 09:43:04 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Biju Das <biju.das@bp.renesas.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "linux-mmc-owner@vger.kernel.org" <linux-mmc-owner@vger.kernel.org>
Subject: Re: [PATCH 4/4] mmc: sdhi: use maximum width for the sdbuf register
Message-ID: <20170803074304.GB1500@katana>
References: <20170630105649.16137-1-wsa+renesas@sang-engineering.com>
 <20170630105649.16137-5-wsa+renesas@sang-engineering.com>
 <TY1PR06MB07023DF77FC5A4453B09D82AB7B00@TY1PR06MB0702.apcprd06.prod.outlook.com>
 <KL1PR06MB1702B525F5A03DD74B960928B8B00@KL1PR06MB1702.apcprd06.prod.outlook.com>
 <20170802190427.GA1474@katana>
 <KL1PR06MB1702544BC4FD755C76314608B8B10@KL1PR06MB1702.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="FkmkrVfFsRoUs1wW"
Content-Disposition: inline
In-Reply-To: <KL1PR06MB1702544BC4FD755C76314608B8B10@KL1PR06MB1702.apcprd06.prod.outlook.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--FkmkrVfFsRoUs1wW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> [    1.162808] sh_mobile_sdhi ee140000.sd: Got CD GPIO
> [    1.167721] sh_mobile_sdhi ee140000.sd: Got WP GPIO
> [    1.225803] bus_width: 0

This should be '1'.

Which tree is this based on? I can't find SDHI nodes for r8a7743 in its
dtsi file in linux-next? I'd think the node is not correct.


--FkmkrVfFsRoUs1wW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlmC1AcACgkQFA3kzBSg
KbZfIA//V+uN09AWGL3FF7hQPNsp2VJCcZG+AsWp4W4e+wqORHKnc4FmbQM1BTCW
uhstycgO2qBSCTdXawNFcfFa3o7yC+zKpBuLmcmANCxdy3Vd1mMvBfNWvUconHah
JEQT25vXSjiDTvlwN710+EcniNyHdSHRxLKXHe4GiNA2aOXqRaWqGnLudy0yAsc5
9a/x7K1U2QezzwbkxdEmETOzXVv8IvJ/9ynW/bGMgSp/sGjiYHba8AD89TEDJ3DC
2Y3Eh9b2w5eebeDTo22dhziTzh9N0IS73H7j+FN59JfhLmZgfGO3fyjkpo9cUOuX
FEXCKpCek9vuT7zFYneiSrONLrbe3YHhNst9xKM8chafrH1k4rk/ewk8M6qg7TF5
3cueJV6VZwFTgpsR/rwqpyif6zsWgpXpAy1PU6dxaSpMjXSmxq+n/+cyVjLodqlw
FJSwCwtyaWRiIdkFU7AMF4bgY+NQF2x8Bk4DjCZhd70dPlfSINrpHaTjjVyY8EPh
rRkamq/yq6RGakBEjFlV05WG3Cy73HwvbO6d0w8N/MaqKpznQuWpP+UHMGFj09Ha
ZJhqpWOCkUjkf75gwQ+Y8lVHVuMj2rMFjJW+2e3nYcwWRG7yJrmGRu+XR4MUZhfM
C7HozeMgITuhAJTvB1E6Tshq3WUZVg3U9OWfMW2gSSc7wrsTHMU=
=auHy
-----END PGP SIGNATURE-----

--FkmkrVfFsRoUs1wW--
