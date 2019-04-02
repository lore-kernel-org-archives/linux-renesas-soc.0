Return-Path: <SRS0=Wh2G=SE=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FC76C4360F
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  2 Apr 2019 14:57:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 11939204EC
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  2 Apr 2019 14:57:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729232AbfDBO5b (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 2 Apr 2019 10:57:31 -0400
Received: from sauhun.de ([88.99.104.3]:40506 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726337AbfDBO5b (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 2 Apr 2019 10:57:31 -0400
Received: from localhost (p5486CD10.dip0.t-ipconnect.de [84.134.205.16])
        by pokefinder.org (Postfix) with ESMTPSA id 064D12CF606;
        Tue,  2 Apr 2019 16:57:29 +0200 (CEST)
Date:   Tue, 2 Apr 2019 16:57:29 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Mark Brown <broonie@kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
Subject: Re: [PATCH v2 3/3] spi: sh-msiof: Add reset of registers before
 starting transfer
Message-ID: <20190402145729.GF5389@kunai>
References: <20190402144023.27422-1-geert+renesas@glider.be>
 <20190402144023.27422-4-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="TeJTyD9hb8KJN2Jy"
Content-Disposition: inline
In-Reply-To: <20190402144023.27422-4-geert+renesas@glider.be>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--TeJTyD9hb8KJN2Jy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 02, 2019 at 04:40:23PM +0200, Geert Uytterhoeven wrote:
> In accordance with hardware specification Ver 1.0, reset register
> transmission / reception setting before transfer.
>=20
> Signed-off-by: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
> [geert: Use readl_poll_timeout_atomic()]
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Minor nit:

> +	/* reset registers */
> +	sh_msiof_spi_reset_regs(p);

I don't think this comment adds value.


--TeJTyD9hb8KJN2Jy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlyjeFkACgkQFA3kzBSg
Kba3vg/+PJelvTQaVhL3hl6iPMgVmfguq2o4RtVE863Iq3FsRRmmutV+zxilhzxB
x49Ehu47BxnLTX5pBG9vziT8hXl1DkGmxO1pclme1u7VZ5lchOho0yYBHNTH0q8U
Z65I7S505d4fNXqtHPldMPr754LNvD37OS5RcLjphADKhTfVyYJfIhWefBW1e00j
fb5MF44k14IvW/3VNE03mVBPooTOoUaNkmUtoar52tKm+WgoHXUn1d4e65zEHRsU
JsK8OrNjLeLmuk9l3dqm1UZtRbPMgtf4JbA9ct76Bv05SpEd+RiR7bc/CYkpfBwd
ijv5+CfPtGDgvp+Az5rPAfW5NVwaiiSIMvkmIjMxuzMKbINMJPlZqOK4K+UAozG8
P+ueLqfo0opeQET+ttKtfW87O4YgJjcxf1flruTIGZT3iG21S8/Xix6HX9DScBgR
WcbAVyGo2JYPvnhlKxT/rOp3NxfMbGsyTmVNJWz9lbtWMY17PoIOxackANcMJqOh
oTQbJEHKsqwwUrD8fbpnQIFq3k4DGuc5p3GXL/tws6cwjpQ1U9OPT1MaV2xSg7Jm
Wr067p6nLvmG6C0wX5WrMN/v8xhyPVpgemnfhZrvYAEUgVJwKiEM/Bd+JItHW/RP
XWWTNqMQiBbVp6y4noEsB8Dj48QbuD+bTE7GetbppT+FNFflPts=
=9xyk
-----END PGP SIGNATURE-----

--TeJTyD9hb8KJN2Jy--
