Return-Path: <SRS0=L5iE=S4=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 111D9C43218
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 26 Apr 2019 09:17:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D520720679
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 26 Apr 2019 09:17:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725954AbfDZJRd (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 26 Apr 2019 05:17:33 -0400
Received: from sauhun.de ([88.99.104.3]:51062 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725800AbfDZJRd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Apr 2019 05:17:33 -0400
Received: from localhost (p5486CFAE.dip0.t-ipconnect.de [84.134.207.174])
        by pokefinder.org (Postfix) with ESMTPSA id 6C6EB2C0114;
        Fri, 26 Apr 2019 11:17:31 +0200 (CEST)
Date:   Fri, 26 Apr 2019 11:17:31 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        ulf.hansson@linaro.org, wsa+renesas@sang-engineering.com,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/3] mmc: tmio: No memory size limitation if runs on IOMMU
Message-ID: <20190426091731.GB1031@kunai>
References: <1556255930-18188-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1556255930-18188-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <39b57554-db27-6b8a-261d-b8097c239e38@cogentembedded.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="dTy3Mrz/UPE2dbVg"
Content-Disposition: inline
In-Reply-To: <39b57554-db27-6b8a-261d-b8097c239e38@cogentembedded.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--dTy3Mrz/UPE2dbVg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> > This patch adds a condition to avoid memory size limitaion of
>=20
>    Limitation.

"limitation" :) And maybe "a memory size limitation"?

> > +	 * the max_req_size if needed as a workaround. However, if the driver
> > +	 * runs on IOMMU, this workaround doesn't need.
>=20
>    Isn't needed, maybe?

Ack, "isn't needed".

Patch itself looks good to me.


--dTy3Mrz/UPE2dbVg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlzCzKoACgkQFA3kzBSg
Kbacxg/+IkSG2VCS62583M8enSEGk83hCUdXPFsyIK1tiR7jebBmu1gunoPhBrSh
FLjrH0NpD4aXMzUDu3PRxR4VrhN6YRy0abH0iKgW69LjY0aGIcgiHKu9rPaHuVM4
JdBP1VS/eThVblAhkorFEO9TA0aE/EnATk+GAygd6gDFMLGiAtJ80XvEafSeueCy
sGLoMnUtk2LT/mqaCG0YbapHl7tbtjT/kLbq2vHavOltiASsnXqzTmCNh/zbCc5u
r1YVtlKSjGxW1ZCzweKg4o7E0GY+RDIWHomjL8/zYauwvI1xYw6/k2uTt+Mi59Nz
yqq+8ABbMfH7cIJrUrMGixuFgixA+mtoP4OutXYVYQWGimqwSp4Ufu5eWc2haND9
LK18dRfPDgcqN0IbAEUX4QLxm5C4K27xkWJYQZF7VK5FeFwTq4QuDpraazqx2CDN
u32qsJCM1SN7UMxuuYDxY4LqDk7xJbenTZ6xD/Z1DRn9naCVdGDjA8wrgJWORm4m
ozo8ELMUMzWWP1x9Sgta8l5Aw16FwybBwhF8d63x66xPtrr12Mg8bTM5K/hVE5m5
99s2ABEVLLxIt9MNGIBNUEDjExb+0Hwz6w4cth8NaGdEPCZSqTzI3AJiGtST+dmR
Q+QpCqXH7uLlrlni4ZjvqJXGf7o4bPsQY1Voh/GmozzwgbkQ5Ro=
=SZxD
-----END PGP SIGNATURE-----

--dTy3Mrz/UPE2dbVg--
