Return-Path: <SRS0=vwGd=RP=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_NEOMUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3629EC43381
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 12 Mar 2019 13:18:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 112C821734
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 12 Mar 2019 13:18:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726075AbfCLNSk (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 12 Mar 2019 09:18:40 -0400
Received: from sauhun.de ([88.99.104.3]:39204 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726848AbfCLNSj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Mar 2019 09:18:39 -0400
Received: from localhost (p54B335FE.dip0.t-ipconnect.de [84.179.53.254])
        by pokefinder.org (Postfix) with ESMTPSA id 06FA92C282F;
        Tue, 12 Mar 2019 14:18:37 +0100 (CET)
Date:   Tue, 12 Mar 2019 14:18:37 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH 3/3] i2c: rcar: wait for data empty before starting DMA
Message-ID: <20190312131837.4jaqxe6t3xz5ccff@ninjato>
References: <20190305175434.13107-1-wsa+renesas@sang-engineering.com>
 <20190305175434.13107-4-wsa+renesas@sang-engineering.com>
 <CAMuHMdWtNiLcOB_0vTa2nNM+tkdiTfYWP=VAe3GsfjRbxkgYvg@mail.gmail.com>
 <20190312125038.6f55rmfmkkvimawg@ninjato>
 <CAMuHMdVYHxL-N+zurrP2hReMaWSShXWzOh5D3pSYHMq70W7Hsg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="3tcvvxa55466gemn"
Content-Disposition: inline
In-Reply-To: <CAMuHMdVYHxL-N+zurrP2hReMaWSShXWzOh5D3pSYHMq70W7Hsg@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--3tcvvxa55466gemn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Obviously I should work on improving my i2c-rcar foo ... ;-)

There be dragons! ;)


--3tcvvxa55466gemn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlyHsa0ACgkQFA3kzBSg
KbakYQ//f3pV21ENBilVIoN0/eZ+chkGZm45UTCq0uUPhNPCfFPrH3Br9CakoKHD
vdozZwZ++lPd++xzVUpAEv/Te6zHXzB6N5RskPOElIQpISTC0svLsyEqVr5KtJfW
Azz1nTRWXlCfrH7LhPdICweXhXM640/L7974aQHNlso9IXk4xXJywqSNs+iz1/ut
cF5LCXwiEjB5nOIwpQjx+bjH8MKYIkxj990Jrt/4ljDio4iFUizZH+pDjrx3HTyg
TkpcMZTqjClFp+1cS1pAI8xz81GZyTC54CEnpRL9IWOTnmOtK6gnNvI7mrNLOQLi
1Qpu5Umk9uCbl1RA8FWoQo9POtVaG2KkVmUebC2cws0nctDi3XT/HW9tnXb0DYPJ
LxaIC5XjRFNKDOcM62iFfrunFUI2d6N9P3FZOOCYDURj6WxnIYemjEDJdopDD6Ir
5nAJvW1KakUy6laExr5o9SCuIauxy6VTaqMMDWMKnVDBS4fQO7flIBuJT1ZNTjbR
AyyxxFr7CjEB163SbghVWAoJgM//H1kNtFTGIhLsmTGH+8KYHugIeuC+VzAO5QEN
bmEzfkz8bqZc1Hlpj+Sh0T5FeIoRhDLZz/GhmSyRepiP7LrEJ/LDE8WoODsDH6z+
8chhqSSGcohYJvkkBSHVH2FfKKxzbFYxxIazwsLCVdnohGiGeOI=
=vGc0
-----END PGP SIGNATURE-----

--3tcvvxa55466gemn--
