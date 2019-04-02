Return-Path: <SRS0=Wh2G=SE=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EBE3C4360F
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  2 Apr 2019 14:48:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1EA6320693
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  2 Apr 2019 14:48:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731835AbfDBOsq (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 2 Apr 2019 10:48:46 -0400
Received: from sauhun.de ([88.99.104.3]:40406 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731783AbfDBOsq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 2 Apr 2019 10:48:46 -0400
Received: from localhost (p5486CD10.dip0.t-ipconnect.de [84.134.205.16])
        by pokefinder.org (Postfix) with ESMTPSA id E52612CF606;
        Tue,  2 Apr 2019 16:48:44 +0200 (CEST)
Date:   Tue, 2 Apr 2019 16:48:44 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Mark Brown <broonie@kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/3] spi: sh-msiof: Use BIT() and GENMASK()
Message-ID: <20190402144844.GD5389@kunai>
References: <20190402144023.27422-1-geert+renesas@glider.be>
 <20190402144023.27422-2-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="g7w8+K/95kPelPD2"
Content-Disposition: inline
In-Reply-To: <20190402144023.27422-2-geert+renesas@glider.be>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--g7w8+K/95kPelPD2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 02, 2019 at 04:40:21PM +0200, Geert Uytterhoeven wrote:
> Improve maintainability by converting the register bit, bitmask, and
> bitfield definitions from hexadecimal constants to constructs using
> BIT(), GENMASK(), or "val << shift".
>=20
> Suggested-by: Simon Horman <horms+renesas@verge.net.au>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> All definitions keep their original value (checked by comparing
> assembler output).

I didn't review it, I trust you :) But I'm good with this change:

Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--g7w8+K/95kPelPD2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlyjdkwACgkQFA3kzBSg
KbbIoA//XEYd1Hm64A+q6YK8WQj2JLTm/l3KL+ilEAIOilECKwvMNMZMf0S5bzi3
JmSJRuaj4uNL0+5w2KYGxjAdOMRA9Y8EWagbbQvM/M0af/U3ecIoDV/cp8vzcvwo
vkEVPugUHedHe7MZ4UyAB65uDDLYmW0Y0s2HlG/nEfrOVFkrDOKeZc+JbSULhaBv
CtQFgbgKIlELfkBccMCGbHpO3c8KLAoD+imlc2gSFFvyGSlCAHVizoNYVX9g74ZA
L83hYhqlqIruOH4MvKYqkjGR7gIqGpzBjFfNLaYhOV1K/Z3jZXsnUv9VMYQUvXSK
I53WT6TB2M724LtD8GZCdxf+R2UcUEGZkYDgBdUmAzWFhYztviff5ZCCKSAHop8S
Oh64Q+ligRVvGpZN3ZgV1bXsWVmAIt62UqSmsENzcRCSHm/qwuW931gGsBI6+Fp5
vi9RhElEG7peKEWM0UQ8TfPB1IZWXq03vhdo9Exc1AOZSsC2ZPOXlQsqMPt01TEe
juZ0I6SPkAQj41ozrfnczGctFbBJJbDVqIi33EyuMl/s13JqpUEMd2jKRE/C1jdn
8yZM8curhmkjHFNU+EZMytIbsVwKPEIiWcYsyeTpBd9zBszZvcXVEcqF0nN7N1Ic
2tFBbnnV/LNgb4fsQNMvj7gJfFDVsBBXt7RTQC59XCIjTrjFZA4=
=wDs+
-----END PGP SIGNATURE-----

--g7w8+K/95kPelPD2--
