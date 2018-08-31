Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:60192 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726990AbeHaPL7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 31 Aug 2018 11:11:59 -0400
Date: Fri, 31 Aug 2018 13:04:59 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v2] mmc: renesas_sdhi_internal_dmac: set scatter/gather
 max segment size
Message-ID: <20180831110459.gv77k7v3pl2k65kd@ninjato>
References: <20180830213843.14680-1-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdWTPNxUQ+Go-CPe3KZqr9eoLTaegbvE2OdmwHhBi6n+hg@mail.gmail.com>
 <20180831075703.GG28374@bigcity.dyn.berto.se>
 <CAMuHMdWa-c1QcYN_moyck4J1Dte3LyEHfRZ5Ai915UX82CxbPw@mail.gmail.com>
 <20180831094439.ldljak3bnmehh6vs@ninjato>
 <CAMuHMdX9p2sgQhpgbLmW4KGRyxEsbXD4=OEfm3QfM-cyLKK84A@mail.gmail.com>
 <20180831103524.enm2v7zeysngqsdw@ninjato>
 <20180831104907.GH28374@bigcity.dyn.berto.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="tzs3uoa3gt3bsfhp"
Content-Disposition: inline
In-Reply-To: <20180831104907.GH28374@bigcity.dyn.berto.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--tzs3uoa3gt3bsfhp
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 31, 2018 at 12:49:08PM +0200, Niklas S=C3=B6derlund wrote:
> On 2018-08-31 12:35:24 +0200, Wolfram Sang wrote:
> >=20
> > > Promote drivers/gpu/drm/exynos/exynos_drm_iommu.c:configure_dma_max_s=
eg_size()
> > > to a generic helper?
> >=20
> > Yes!
> >=20
> If that is promoted should not
> drivers/gpu/drm/exynos/exynos_drm_iommu.c:clear_dma_max_seg_size() also=
=20
> be promoted? And if so should this patch revert back to v1 with a custom=
=20
> remove function which clears and free the dma_parms ?

My preference would be easy to use helpers for drivers because this is
easy to get wrong. I think we need to discuss with the creators of that
API:

a) if the drm/exynos driver does the right thing(tm)
b) if these functions should be generic helpers
c) when to clear the pointer (a bit related to a))

Niklas, do you have an interest to do that? Or would you rather go with
SDHI hacking? :) I can do it, too.


--tzs3uoa3gt3bsfhp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAluJINsACgkQFA3kzBSg
KbYZJw//Zk4lTkgHVi2GcNFSQXm7BWdk26cbTPe3iRUarTLz5ijZpkmelFz8TjHd
KROlSWQ/lsRNk04HuaJywqyWAl5JyuDqnnxIF8nXYf4tu/TuJmw51UkYnn/GVg7a
F8Xl2ffvFmKvW1gGrSNesOMHbZu7O+9Dk0oa9qunYj0//p7zi/SFiz9lT/81op6O
VgMRubyEj/a8PveGki8fD3WOmFWC/ubj6WMDADDIstPlk63vqdOQA6He0NtIy1lg
4jGyiDKKElay0k4+zofEHaVal005v1NnSSZ7aaFrbwRJl7BDfc9Itp8bjiKedyg7
0vTdaKDrcCSk2RdmSSsOVapaT9qu3bnOfpCf/28N3yuzu1l0mQhTRS75yTXF9pXz
pEai6v/OEGME9pNUOho3efNiRApRMeh0Q215t7uj1Ylb6PhyZFxeQ5lUvue5rcgQ
P1mrE/V/FBaFdMBkLvc+lOwAg9JpSLbKZp71p1V6O+okSf2asIkSn6FJ7/jwJV28
YTQiSaF7NA4AdN7oAIzirLE7OvEHEQF7QEujaMJ4WtOQm7EYrb4zbKHd5mQbiFnR
ytg6dQQlsL5q5quMdyup7KtJPTSVJS4gzIGJzrQRNkh3VtYnZo9fOGcgsOEvJNgK
IMUBwVD+sYBx4fp8F2o4+nsadJM/Bp0bbddypfqhODyYJ2r9WdQ=
=+L6I
-----END PGP SIGNATURE-----

--tzs3uoa3gt3bsfhp--
