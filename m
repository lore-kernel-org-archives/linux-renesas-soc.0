Return-Path: <SRS0=vwGd=RP=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_NEOMUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90BFFC43381
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 12 Mar 2019 12:50:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6AC91214AE
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 12 Mar 2019 12:50:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726556AbfCLMuk (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 12 Mar 2019 08:50:40 -0400
Received: from sauhun.de ([88.99.104.3]:38954 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725844AbfCLMuk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Mar 2019 08:50:40 -0400
Received: from localhost (p54B335FE.dip0.t-ipconnect.de [84.179.53.254])
        by pokefinder.org (Postfix) with ESMTPSA id 9D5192C282F;
        Tue, 12 Mar 2019 13:50:38 +0100 (CET)
Date:   Tue, 12 Mar 2019 13:50:38 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH 3/3] i2c: rcar: wait for data empty before starting DMA
Message-ID: <20190312125038.6f55rmfmkkvimawg@ninjato>
References: <20190305175434.13107-1-wsa+renesas@sang-engineering.com>
 <20190305175434.13107-4-wsa+renesas@sang-engineering.com>
 <CAMuHMdWtNiLcOB_0vTa2nNM+tkdiTfYWP=VAe3GsfjRbxkgYvg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="573hf4dtqiwgukbu"
Content-Disposition: inline
In-Reply-To: <CAMuHMdWtNiLcOB_0vTa2nNM+tkdiTfYWP=VAe3GsfjRbxkgYvg@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--573hf4dtqiwgukbu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> > +       /* Check if DMA can be enabled and take over */
> > +       if (priv->pos =3D=3D 1 && rcar_i2c_dma(priv))
>=20
> Shouldn't you check if MSR.MAT is set?

It was set before, when priv->pos =3D=3D 0.

>=20
> > +               return;
>=20
> Hence ICMCR.ESG is not cleared, violating 57.3.8 (Master Transmit
> Operation), Step 3?

Clearing ESG is the very first thing we do in the ISR. Otherwise, we run
into the race issue we have on this HW and generate an unwanted repeated
message.


--573hf4dtqiwgukbu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlyHqxoACgkQFA3kzBSg
KbYaTw//e09nwBEk+ifNggTYoSb5GEDg3iYaYuED79UC76DecKRBmWDk4UjmeeAN
mjoJg31u9fSk6RBBmXp70om33usPWFZ4INGxAtUaSVIXI9/WoayyeIJQYfmlkslW
yYqLs/I46b6UykCWFShDEnegDPQTPGs2ixGXiGr9fNtAsX0Yj11PORXU4gVoFPtu
N763SOTtwr6uAssZRU8I/z8rty1ZuhWqTpc+KYKZsnjZ9e/WCsJs4KlbZDZa/7ZC
Ro+f64hUGLGccZHaEYF3gsxzAryhlVmvk3WVbpQVFm6kvGY5d9qYIUgALKelk3pl
F2uaIn+ElDF34decOLemjjczNVUBTc94lzOMVaecSCk9mL79m9aOEbneTwDMpt7D
cWHZQEWoeWKqIkn6quHO01tuzBPmVsShXlVwcaKuK5pZQBccE13RNNKSQyFFx7L7
USeUTAmoMPhldnP5moAjCGmoK/i1/UMq7U7toJGHC2qE/HYLzje08oDCp6Q4vV+z
YGNC4XsUsGBb//gWGNyW5SOpK37rble6fJcvJY+8Rgnl8ofUrc0dGht4xfMjgla2
f0cMo7YhyVyZDFAiTvIqQash/QHXebnaFbOXzDxE97XzqYgQd3SLR7Q1z5iAxQ6d
lq220NLfZNuYSMqPQnvcThQG/dpvkOmmmg3KLjEMUt5tMdjWy54=
=ukFC
-----END PGP SIGNATURE-----

--573hf4dtqiwgukbu--
