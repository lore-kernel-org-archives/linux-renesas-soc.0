Return-Path: <SRS0=L5iE=S4=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 454B2C43219
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 26 Apr 2019 09:15:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1E1A420675
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 26 Apr 2019 09:15:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725954AbfDZJPu (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 26 Apr 2019 05:15:50 -0400
Received: from sauhun.de ([88.99.104.3]:51024 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725877AbfDZJPu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Apr 2019 05:15:50 -0400
Received: from localhost (p5486CFAE.dip0.t-ipconnect.de [84.134.207.174])
        by pokefinder.org (Postfix) with ESMTPSA id 246352C0114;
        Fri, 26 Apr 2019 11:15:48 +0200 (CEST)
Date:   Fri, 26 Apr 2019 11:15:47 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     ulf.hansson@linaro.org, wsa+renesas@sang-engineering.com,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/3] mmc: tmio: add init_card ops
Message-ID: <20190426091547.GA1031@kunai>
References: <1556255930-18188-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1556255930-18188-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="IS0zKkzwUGydFO0o"
Content-Disposition: inline
In-Reply-To: <1556255930-18188-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--IS0zKkzwUGydFO0o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 26, 2019 at 02:18:48PM +0900, Yoshihiro Shimoda wrote:
> Since renesas_sdhi_internal_dmac driver would like to use
> the init_card() ops in the future, this patch adds init_card ops
> into the struct tmio_mmc_host and struct tmio_mmc_dma_ops.
>=20
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Yamada-san refactored the code, so we don't need such hooks in the TMIO
part anymore. Check 2aaa3c5193db ("mmc: tmio, renesas_sdhi: set
mmc_host_ops hooks directly") for an example. I will comment further in
patch 3.


--IS0zKkzwUGydFO0o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlzCzD4ACgkQFA3kzBSg
KbblRA//c1mntunbPU6T+72Ofq7NL71mBrE5aS/Vrp+XNw2hbfATiUvJQNy2VguB
eOlAeg5JNF845Gfu8bJdkZsxmiPHI4ToepzBDMdZl/qZ98Lf0/ozkucr4l79h0Rp
9ibJt1gKubbudAsZkwhRqXkYxDcO/IoEsS//WM/VCCnEk8V7LehdCypVXD0HZ6wZ
v1IX9NQXB4hfNZN+nqoGXlXYbn2MMH2CXxKLm16VQqvEVBeu5v9fYD5qB7Geh82C
KEfYvQm7JEkwqRHRxxCWQkOYLU2K1IP06s7ZEVn/kTp9lpKAqKpTBgnYJsRGHZeF
quCCSeS55lbpSXGzxS/VbR6wRKv5pmgOJoFDT9XzO65F6aVY5SWzrPP8PAzgv/lb
LGU7h6goDQgi6WZJZg/JEWOOUwIDZhFs+6fdXxlgV9q0rn8fhqucOaX3qF8OYVGB
N0fopAgPFcQUnf5hWk7GuH/dk1EIXdAhZOsDOidqzhNWxoP0qvjT3YgxRs8br9hr
yEbosXF+NCU+JQGendAl5Vtvm5dJr70hWlqw+auOcnKSvWp8wm261yKoYiS3h8KV
rI91D25xKepslCVZHwD6pAg6BZzZlO+mhXY2suGVSNchnsq3ALzijApZRn88Iafc
oeiQIk18i5reaHx6e6tZL5Rn4PwOtfKDVryK+VgBg7IKpsxHZlw=
=ykQA
-----END PGP SIGNATURE-----

--IS0zKkzwUGydFO0o--
