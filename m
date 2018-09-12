Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:50544 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726640AbeILU4Q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Sep 2018 16:56:16 -0400
Date: Wed, 12 Sep 2018 16:50:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh@kernel.org>,
        ALSA Development Mailing List <alsa-devel@alsa-project.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Vinod Koul <vinod.koul@intel.com>, dmaengine@vger.kernel.org,
        Joerg Roedel <joro@8bytes.org>,
        Linux IOMMU <iommu@lists.linux-foundation.org>,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: of_dma_request_slave_channel() failed ?
Message-ID: <20180912155057.GJ6062@sirena.org.uk>
References: <87efe9ls4n.wl-kuninori.morimoto.gx@renesas.com>
 <CAMuHMdVkQ8vio3O7VWyoWnVrY8Y8_YRWxQeXDwJ48iTxzujWdA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="LG0Ll82vYr46+VA1"
Content-Disposition: inline
In-Reply-To: <CAMuHMdVkQ8vio3O7VWyoWnVrY8Y8_YRWxQeXDwJ48iTxzujWdA@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--LG0Ll82vYr46+VA1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 11, 2018 at 11:43:47AM +0200, Geert Uytterhoeven wrote:

> So it seems the audio DMAC is deferred a second time, before the iommu driver
> probed.

Shouldn't there be at least one more round of deferred probe triggers
after the IOMMU probes?

--LG0Ll82vYr46+VA1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAluZNeEACgkQJNaLcl1U
h9D66Af+LuJmW1P5LeruN0ZnF7/HzgPVOb014v5ql4+hVRoFyKthWfr3TSh1Yt91
SCsxf4BlCg9R9k+2scbWFvjKNdsArH+CS84UfAOhvz8l0U2rygnrsYVuzXY2eaBU
KAQiHLv9vTcbYvN9w2zTZMHkybIV2VPeZqpL+8EWwDIs+qRAPPvJF99xUkVhIiH8
1soUjgmsQPGeK3MvLsKrF9EbFkpjIcfdR/eAbc3ngS799fYbgk59CU2TYOgA39bn
uSVLrJqL6pMTRVuz4yocyGoEWQ1rkcOFAOq2FXaBY7TnQ9TXRkVn1P+I2PmNdNQC
nS5aAC1Z2Jpw8rQn1YQFCAGmcRrl3Q==
=lC1m
-----END PGP SIGNATURE-----

--LG0Ll82vYr46+VA1--
