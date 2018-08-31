Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:59968 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727281AbeHaOmR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 31 Aug 2018 10:42:17 -0400
Date: Fri, 31 Aug 2018 12:35:24 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v2] mmc: renesas_sdhi_internal_dmac: set scatter/gather
 max segment size
Message-ID: <20180831103524.enm2v7zeysngqsdw@ninjato>
References: <20180830213843.14680-1-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdWTPNxUQ+Go-CPe3KZqr9eoLTaegbvE2OdmwHhBi6n+hg@mail.gmail.com>
 <20180831075703.GG28374@bigcity.dyn.berto.se>
 <CAMuHMdWa-c1QcYN_moyck4J1Dte3LyEHfRZ5Ai915UX82CxbPw@mail.gmail.com>
 <20180831094439.ldljak3bnmehh6vs@ninjato>
 <CAMuHMdX9p2sgQhpgbLmW4KGRyxEsbXD4=OEfm3QfM-cyLKK84A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="bpqyauzpkkqyazgm"
Content-Disposition: inline
In-Reply-To: <CAMuHMdX9p2sgQhpgbLmW4KGRyxEsbXD4=OEfm3QfM-cyLKK84A@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--bpqyauzpkkqyazgm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Promote drivers/gpu/drm/exynos/exynos_drm_iommu.c:configure_dma_max_seg_size()
> to a generic helper?

Yes!


--bpqyauzpkkqyazgm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAluJGegACgkQFA3kzBSg
KbY8QhAAijMDQfntcFBpMGmyhq7SctfVxbWmDWbBFYYdFi0t/8Ynq+SryLmKeI6y
m0iwyMDKFWLWJ7+JN+FIXEDyTjAebzS2J1j63T+suMnyopkFFTgS+t1CZQjPfkXk
gppWdGlWmgJpdF2ho8EHYyyJFf0Q5kE/WzrRCjf4ZYMXGRRijSkcOg8CDddixiRh
D2MUpmY0RwlkRKQgC+nc9PnsLrCwOD191a/vdeslZ2qD33crzy0fjtD0lg/rQblM
fg5NZVVTr9EpcOIm7KEGOM/cDfgorS1/cZ4+3qZpx4Bzp2YBneAFgaLQo42dPXdc
xm8qs6XKoiL0+0rZrv/YbExLIS7FOQTlG+mqZWw9YDIetW+S6My7ys0qafsXNr8i
X8BugM7B6UDigOXo+5uq7+3xSYQK1/3X5I0Y9D2gbt6ymV8ByZXLdzgUSCkCk62J
NfdXuPYSnqwEhJ6+qdq9yy9X/hJ74yMo4iEpwIQbEVkHoKI6WV1MhcmCJ8vB9ORZ
Wqh29VRCbd2FrmvuzxJORj93k98Uj+Sz0vOfiPSBiU6/ejCJD4rlYH5FQZqSJ8cB
39H7xFTOhQobi/U/7tSUd51VxwBEEIJ7wvMNvYFEZC1mNT6SjNfSKcQ5vZYSWUpz
ebVndNqI52OinX69ERNNw6OhH8fVxKVgykPMVhgZc7aQmHAfrSU=
=EJ3Q
-----END PGP SIGNATURE-----

--bpqyauzpkkqyazgm--
