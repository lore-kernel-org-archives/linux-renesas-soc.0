Return-Path: <SRS0=TeIC=SU=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8041EC10F0B
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 18 Apr 2019 06:45:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4D57E205C9
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 18 Apr 2019 06:45:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726013AbfDRGpa (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 18 Apr 2019 02:45:30 -0400
Received: from sauhun.de ([88.99.104.3]:37610 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725886AbfDRGpa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 Apr 2019 02:45:30 -0400
Received: from localhost (p54B33161.dip0.t-ipconnect.de [84.179.49.97])
        by pokefinder.org (Postfix) with ESMTPSA id B056F2CF608;
        Thu, 18 Apr 2019 08:45:27 +0200 (CEST)
Date:   Thu, 18 Apr 2019 08:45:27 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     ulf.hansson@linaro.org, linux-mmc@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] mmc: core: retry CMD1 in mmc_send_op_cond() even if
 the ocr = 0
Message-ID: <20190418064527.xwnlba6aep3rnch4@katana>
References: <1554807906-9704-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="gxn344uvhpcyempr"
Content-Disposition: inline
In-Reply-To: <1554807906-9704-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--gxn344uvhpcyempr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 09, 2019 at 08:05:06PM +0900, Yoshihiro Shimoda wrote:
> According to eMMC specification v5.1 section 6.4.3, we should issue
> CMD1 repeatedly in the idle state until the eMMC is ready even if
> the mmc_attach_mmc() calls this function with ocr =3D 0. Otherwise
> some eMMC devices seems to enter the inactive mode after
> mmc_init_card() issued CMD0 when the eMMC device is busy.
>=20
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  Changes from v1 (https://patchwork.kernel.org/patch/10874619/):
>  - Revise the comment on the source code.

I like the new comment, very clear, thank you!

I didn't test this change but I double checked the specs and the code
matches them to the best of my understanding:

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--gxn344uvhpcyempr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAly4HQEACgkQFA3kzBSg
KbaE4BAAlD6Mpk2TWwTl7XbDP9Z02sJHijzQ5AORTaBMkoKv9OpYy9P6L5YEaGrB
pqOt1Gg/DmVT/vHjXDEXdEeXSNb57z7Mz8JLvS0I02DPQ9c9TjbUGDjlI9uwPjnd
p5cL4pFwyhmLbKkRXkE2R19qh4cqsG6Z7wfdvsrbb6GBwnFP3Kb4pbkz37tYQ5QB
8gMPnoGzofR91d25T6+gmanxFa/R8dFYg3DMagui352VzoemUX9sVQNBb/LbxuGx
2tcXZtWd498BkzTRNAyQ4KZ8goYUfHG8cztX9fLaPWVmsqZKEbpwV4wxietxmHYd
SVmXV0yCUihOmHE9BWNZOSY0ATYpKL+mJPejGvSHPb2HKWlO8Ul+Uji8sbvyxXAa
fAtM4VeI5EZx54AM3ercdmmtNnZWjCXpITbdBvdOIhlKj4PgJJP5tPKUu76Q6EJG
klwPGKhPc14B7Xi4NOWxZiQdgd4OgwJ76wCn2utTH5w5UUBq575UWSiXsPmBXaIR
gHkh73WmGSvdP/hLLCCwNTZY58lCjuKK/xj+bZbfhXzLd1rRO+ggZiKum10qwjFD
dSjPXMknT0kqAUFMcZebkLvRasu33vTS5yhdj8lpREgIXiue6XkUjZ4Fypg4zhJp
I1PiBSEbEriJDG5RXUO3gdFUfi2RjQ0gfNglsQ0cwNviHN8SEWE=
=2RdM
-----END PGP SIGNATURE-----

--gxn344uvhpcyempr--
