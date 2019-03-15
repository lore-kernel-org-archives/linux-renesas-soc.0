Return-Path: <SRS0=0QnK=RS=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACCDAC43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 15 Mar 2019 09:39:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8305421872
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 15 Mar 2019 09:39:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728744AbfCOJjo (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 15 Mar 2019 05:39:44 -0400
Received: from sauhun.de ([88.99.104.3]:36282 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726886AbfCOJjn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Mar 2019 05:39:43 -0400
Received: from localhost (p54B336D9.dip0.t-ipconnect.de [84.179.54.217])
        by pokefinder.org (Postfix) with ESMTPSA id F1DC02C3637;
        Fri, 15 Mar 2019 10:39:41 +0100 (CET)
Date:   Fri, 15 Mar 2019 10:39:41 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Subject: Re: [RFC PATCH 2/2] mmc: renesas_sdhi: prevent overflow for
 max_req_size
Message-ID: <20190315093941.GC1176@kunai>
References: <20190314223130.31802-1-wsa+renesas@sang-engineering.com>
 <20190314223130.31802-3-wsa+renesas@sang-engineering.com>
 <CAMuHMdWvCUJ4S1U-jR2fG=JSXO3KMbbO2=hWPOxqQDXzGMXi0g@mail.gmail.com>
 <20190315082917.GA1176@kunai>
 <CAMuHMdUbzp4qMbJ-ci4k0fMOwOoYSY_JBZ_tWThZUjcJEd48eA@mail.gmail.com>
 <20190315092854.GB1176@kunai>
 <CAMuHMdVEdU9CLSMzJWiDn5brc8bXNBemma=Zk4XtF4wsXHeb7Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="lCAWRPmW1mITcIfM"
Content-Disposition: inline
In-Reply-To: <CAMuHMdVEdU9CLSMzJWiDn5brc8bXNBemma=Zk4XtF4wsXHeb7Q@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--lCAWRPmW1mITcIfM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > I am still confused. Which upper limit do you mean then? Because for
>=20
> TMIO_MAX_BLK_SIZE
>=20
> > blk_size and blk_count, they are both driver specific, or?
>=20
> Yes, they are driver-specific.  So you cannot use a common upper limit.

And this is why I think my patch has a valid approach. But I am still
not sure I am getting your point.


--lCAWRPmW1mITcIfM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlyLct0ACgkQFA3kzBSg
KbbV4g//fe6HncHN7Lx3TZuSOsiCiYN2wScZpX84dFolPHUMMlaiVMVRsJRiwpDJ
7qHmgr6e6hRTem9XBukiVG9eDB7JgqCL+8rtnIgtbE+j75sPvsI7IgFcHlt65rtp
mzdKts6Xh/GGIN3Jrct3gY5+kogUyZXs0GB+lqCR66tOBlsdfvYaO4yp1FiS/aRz
JBi6LcyFKxUnGgh6SbZWxkfL7lkewMr7B1m21K53BslvsElBkSHRqFmckMXFUz73
gOzOKJlAyig3etIfJ0RTnCbA7D8qnPKunngdczbJGaGWPp8nWu3fb0pcLs2DbmTZ
7vOrQ3MIzXqCsPlhcDi0I/BbQtgj8LLuFZ49/Cnq09oD6vOKPO0y3Kye97dT4iVX
R/KsQwaTtmM7rwGn6WjO/f2sAZgtdhzt8C01TvmYIRHbOQR62QGGTNDfbSQAe6gT
cIEjbzb9A0NFn5rtaAIXmwhB1vLDyfbk/Gnxv676jD2OsrDZ10yRBr9z/qxNFWvl
6QFedGMnEV3NkaB4kQXUKuQJOoIjNa2uHo+u2k5jdaGCpEGMUz4RnyAVrd4xrRWI
EEnBBJm4g8i2L7+BmLZI80e88vbv2sLkXrQbHlh6ZMSsaOowF5tSK6VrMoV8XKXc
9meZybt3dVT7rRC4g/9zQkL1RUBNgzxa6xsypIQTQGGIggX6P/I=
=B7IX
-----END PGP SIGNATURE-----

--lCAWRPmW1mITcIfM--
