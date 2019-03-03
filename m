Return-Path: <SRS0=QYV/=RG=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AB58C43381
	for <linux-renesas-soc@archiver.kernel.org>; Sun,  3 Mar 2019 23:08:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DC43820818
	for <linux-renesas-soc@archiver.kernel.org>; Sun,  3 Mar 2019 23:08:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725974AbfCCXIp (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sun, 3 Mar 2019 18:08:45 -0500
Received: from sauhun.de ([88.99.104.3]:48714 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725933AbfCCXIp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 3 Mar 2019 18:08:45 -0500
Received: from localhost (p54B334AE.dip0.t-ipconnect.de [84.179.52.174])
        by pokefinder.org (Postfix) with ESMTPSA id 40F0C2C0963;
        Mon,  4 Mar 2019 00:08:43 +0100 (CET)
Date:   Mon, 4 Mar 2019 00:08:42 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     marek.vasut@gmail.com
Cc:     linux-arm-kernel@lists.infradead.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] ARM: shmobile: porter: enable R-Car Gen2 regulator quirk
Message-ID: <20190303230842.GA3949@kunai>
References: <20190303194140.11757-1-marek.vasut@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ZGiS0Q5IWpPtfppv"
Content-Disposition: inline
In-Reply-To: <20190303194140.11757-1-marek.vasut@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--ZGiS0Q5IWpPtfppv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 03, 2019 at 08:41:40PM +0100, marek.vasut@gmail.com wrote:
> From: Marek Vasut <marek.vasut+renesas@gmail.com>
>=20
> Porter needs the regulator quirk, just like the other boards.
> But unlike the other boards, the Porter uses DA9063L, which
> is at 0x5a. Otherwise, DA9063L and DA9210 IRQ line is still
> connected to CPU IRQ2 .
>=20
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>

Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--ZGiS0Q5IWpPtfppv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlx8XnYACgkQFA3kzBSg
KbYVWxAAjrg5A316eoivhWYigHDEAreHZnCEIIP1Tnzecg9txL4VFpW0DmJMNNOy
QPClKwIBQGUFgs9/IoXG8m+0M+ceOo6Jkfgxq5BOEIr4avZVqdruVxCxbHD7BtTt
2qzpnxN5oaFyvNfOvfUUBw/cEfye+9Rvwb+YzfH93At+oZ93ugSCXTloP8MUOGCy
9tsoJDLY3BUKscxVh79iqt+qTqNCz1naLbLunCvGy6f328KWtXRj/1b3wZoai7ci
mpbFX4qGGI+o9jf9oNzOc4TDCotstA4lAyWdrV6HZ+/cWAqX597LnWdLo4EC2wmu
ARsyDDXfz7Pj2lXYfnugzDA5TDiccGdO8dcaWJ9IwBXHC290A1zmJW1FJ84/P0rW
dH/ZpDRRt+qj9FDDX/ZjvSPdP/lqO9sTpcz6AWORlDnS3zVgB9ndl5Y8/yeIrBQo
SlvENB3GZLMmoWWz3SeEo0ScqEUn+kAjQW/XPmSNH+UqSsSZ2psTW8eRKCIDAYGT
eN/IKTIOa8PRfxni11RbVsk4xEdjZjznA9koFnjY41kAnBy8E1DniwHW8Nc/ZDe8
hBLXeayqzUOfd780m0lZEBNsKSBPxWSz4+j6B5iXzKH6hjFgqEgUQZT54ACnqRU6
CWjIYYcUo2qZTpQuMwvJIjF4NkvmCCLi37ysnxC2rYYSKLg9eEU=
=YTRh
-----END PGP SIGNATURE-----

--ZGiS0Q5IWpPtfppv--
