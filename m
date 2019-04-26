Return-Path: <SRS0=L5iE=S4=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F6B1C43218
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 26 Apr 2019 09:46:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5BC072084F
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 26 Apr 2019 09:46:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725935AbfDZJqV (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 26 Apr 2019 05:46:21 -0400
Received: from sauhun.de ([88.99.104.3]:51224 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726413AbfDZJqO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Apr 2019 05:46:14 -0400
Received: from localhost (p5486CFAE.dip0.t-ipconnect.de [84.134.207.174])
        by pokefinder.org (Postfix) with ESMTPSA id 1DB222C0114;
        Fri, 26 Apr 2019 11:46:12 +0200 (CEST)
Date:   Fri, 26 Apr 2019 11:46:11 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     ulf.hansson@linaro.org, wsa+renesas@sang-engineering.com,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 0/3] mmc: renesas_sdhi_internal_dmac: improve performance
 by using IOMMU
Message-ID: <20190426094611.GD1031@kunai>
References: <1556255930-18188-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="11Y7aswkeuHtSBEs"
Content-Disposition: inline
In-Reply-To: <1556255930-18188-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--11Y7aswkeuHtSBEs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Shimoda-san,

thanks for working on this!

> Please refer to the end of this email about the performance.

Yes, nice improvements, great!

> (I beleive if the performance is improved, the CPU load is also increased.)

I do wonder about this a bit, though. IPMMU and DMA shouldn't be that
much expensive for the CPU, or? Am I overlooking something?

Kind regards,

   Wolfram


--11Y7aswkeuHtSBEs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlzC018ACgkQFA3kzBSg
Kba7FA//SgruITLzgUvYw5soiNosmBGO998qu3ayYk1D7qS+uaXfZg6toVTCcVVX
fMfYHITBCzZukdyJDoOJnvvm+O1zqxqpzxvGkGnrvf0hbitny0HN4NMadnAjecpb
jZGiE17LIY1NPkwCSlE14O8YxhXgiW3vsaOj9fXRg6LL/RRbe6ZuPgk9rKD500gH
dp/IVhGXPoSMMZNR6esK8yIKHyt6Tm2iwkjSZM8mQAPMUtfviMfSOjykBOBn7cFj
YAmA/xsCUMC2b0P/tijOVTik4hUV9/eJNoU815lQd9UecIfBPELGWnQqwPx2mhhB
M7SrQs4DTP9kuwet7fymmGRRBFn6xYr4+z+N7ifZXzkS7vBDKPOS+nJ2l6ns+M18
831gN0u712Dqw00QzUlwZOjmbJjBMq+a/H0A6zxcwPSjxF/H9fgN9mVEnNCehS4Y
UQZaQvyC8lXs7SMu85nl2mB6naelzyjNry7MfOiUKuBSahgq0J3cIOTfLEA7CKjl
iYOePMNOFeAYzMMYopMAVHJbvjJmzdbvMqJAyMMNKmaOzgTbfEcoOoe/P/QB9tQC
j1FrCpTyHROMhWNv5k9I1ccvHxsvNVrLajwJWWtkR33AImJE7YYL9dewjVgeXDqq
Pj1wW0kOyxmnfQyzkuRUxpC3QLtIXhc/AfEqxer7chpcrCcA3qE=
=RLPJ
-----END PGP SIGNATURE-----

--11Y7aswkeuHtSBEs--
