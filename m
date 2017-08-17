Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from www.zeus03.de ([194.117.254.33]:47574 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750741AbdHQH3X (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Aug 2017 03:29:23 -0400
Date: Thu, 17 Aug 2017 09:29:21 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: Status of r8a7795 SDHI support?
Message-ID: <20170817072921.GB1423@katana>
References: <513dd4ea-7309-d2a3-7940-b14bc1836c31@de.bosch.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="St7VIuEGZ6dlpu13"
Content-Disposition: inline
In-Reply-To: <513dd4ea-7309-d2a3-7940-b14bc1836c31@de.bosch.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--St7VIuEGZ6dlpu13
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> What's the status of SDHI support in mainline and/or renesas-drivers
> (renesas-drivers-2017-08-16-v4.13-rc5)?

I use it daily here, even with SDR104 enabled.

> sdhci-pltfm: SDHCI platform and OF driver helper

Wrong driver? We have SDHI not SDHCI.


--St7VIuEGZ6dlpu13
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlmVRdEACgkQFA3kzBSg
KbYvog//RBg0S210YC2lAHW0L+lJjBtH0f47tah3Y73i+J35ChiO8FCsbrRZOPhP
+LTLO4HQtU+qWw5+AYPQIYJdgOEgxy6WmrVCzHxmGnw20J7PO2q+IGYjf9o7wFWo
Unn7cb2wdir4lH2nWpBISu3Nhiy69SOCvVJT5MKVe+VnGC/bWnDO+vaLspYGRWX/
oZdfYIMFLV2WZYvZLCRvg+kd8BX6qk1DElwBb5DvCf7CuPloTbhXf8j6UqlHmuWa
k645pYczHuMTENcgt+dTvTaHibUT35PmRaBXK0j2nYRdcWpMvBGvcuhW2jUVupKw
VO37uh9h3Xhc3NKCONT9RTGev7DCVeLfk3oMkf/DJGIt4NbhwhMhA6ZqoEEYCWx5
10HTXn8efoWrf0eGtPnT57UZ88Su3QuwAhcw8UNXz9p7jUK4aWHtUwc9e+rji081
KHSD7fNLimeoZbQDlUOn8gMvGYanxHdXqydRMKo5T9lW7ZNrAro20fPTSEvo8FBK
HsUyFyt7Tn6fev7TFicG09irars67rKZOqCpAwpoRFsgcgm/fCb9jvPTWECIPi0F
+i8Fdy7SedvT8VyoSEMFWgxCMudV3JBKhyxU6RPok608RHBJCVQp+8K6WRazt2vD
rb7RHVgZQH9cbCx93iHl0cVUYc+5j/b36xDzIX64SrDPdBe27bY=
=/VxX
-----END PGP SIGNATURE-----

--St7VIuEGZ6dlpu13--
