Return-Path: <SRS0=mNNB=RL=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E8EBC43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  8 Mar 2019 14:53:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D887B20643
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  8 Mar 2019 14:53:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726648AbfCHOxz (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 8 Mar 2019 09:53:55 -0500
Received: from sauhun.de ([88.99.104.3]:33870 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726631AbfCHOxz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Mar 2019 09:53:55 -0500
Received: from localhost (p54B3343A.dip0.t-ipconnect.de [84.179.52.58])
        by pokefinder.org (Postfix) with ESMTPSA id 64AEC2C3F83;
        Fri,  8 Mar 2019 15:53:53 +0100 (CET)
Date:   Fri, 8 Mar 2019 15:53:53 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Marek Vasut <marek.vasut@gmail.com>
Cc:     Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH] ARM: dts: alt: Add DA9063 PMIC node
Message-ID: <20190308145352.GB4743@kunai>
References: <20190303190059.31155-1-marek.vasut@gmail.com>
 <CAMuHMdWStD+on70-e1p0SXbe2igNJxDM1RzeYsdXW+80SA9+sw@mail.gmail.com>
 <20190304105705.GA1000@kunai>
 <e5be6861-70d1-e60e-4838-a89b219bee05@gmail.com>
 <20190304111349.GB1000@kunai>
 <20190308134043.alpxgnujj6ppmczc@verge.net.au>
 <5a7b34bf-8ae7-a8a0-c1fc-911a9941dae9@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="cvVnyQ+4j833TQvp"
Content-Disposition: inline
In-Reply-To: <5a7b34bf-8ae7-a8a0-c1fc-911a9941dae9@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--cvVnyQ+4j833TQvp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Do we really want to speed up the PMIC I2C bus ? What are the pros
> (none?) and cons (might be unstable) ?

Then let's go down to 10kHz instead? Even more stable.


--cvVnyQ+4j833TQvp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlyCggAACgkQFA3kzBSg
KbYS2Q//SzXGbdJkVss0cdCxRURIXagcE96fzB8hkWWsUQugj4hNjYBqCYXFIXql
d/NS0Di3nr1MbaiYhpfaeSWdlf1zv4E0AuS0TB2SLzjdaet1/cTyRHMGYJ/JAKDj
0okqSCrO1UOONiGSzxfQ/rM0+SPncQl06J3GakBPEcL2pW6CxMfpBgVSiY5uofte
AC1k69JihLsq9gqSEisnFXj+mflNrFYEt2nM67ezDYzz/MKXth0ECzYG3M7MBQuV
Oy3FS0EPT093gFC6e+LZd7YxmdpT1pTm+uggPT0g3pnJFtgJVO11Q4lMo2/+DS//
wuWWs+PpoAFurv4pH9WsAJtqtmZbs4GWE9n4COXy4YAqgFFSkuaxXW+zwWel2O79
v9jmQoBAUO93ctz6kO/H/Qdev4F+WboqvRCIsjuDKN+6+xTC7VNXZgLDEhbBrPS0
Nx3bl7QcY+aK/lcVrLn+vtBxxRuUWNqdn5Rbf1QTiW7MVCepVgvSBw9XQkONiBpi
ao8ViZt577zEyrbKevfjpI451OkWZyvKgF9qdsVK+YBwmRPQJr23Jv4pZnVWHIXi
MqsmQTv5Y7WeGQFVwBy3zGLV0dtPRPuE9ki91W1YT9fg2+9WAIp7YaP6VmpOmCvl
Cvc8JL0rxVevZKwYbHBuBt2GBUt/F1uCLFnSTWonHLYUVjMV/fg=
=r2cm
-----END PGP SIGNATURE-----

--cvVnyQ+4j833TQvp--
