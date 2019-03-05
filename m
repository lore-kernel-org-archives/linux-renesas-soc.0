Return-Path: <SRS0=F/Q8=RI=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_NEOMUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAE23C43381
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  5 Mar 2019 18:00:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BE2542082C
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  5 Mar 2019 18:00:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726534AbfCESAk (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 5 Mar 2019 13:00:40 -0500
Received: from sauhun.de ([88.99.104.3]:36348 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726052AbfCESAk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Mar 2019 13:00:40 -0500
Received: from localhost (p54B3334F.dip0.t-ipconnect.de [84.179.51.79])
        by pokefinder.org (Postfix) with ESMTPSA id B937C2E3551;
        Tue,  5 Mar 2019 19:00:38 +0100 (CET)
Date:   Tue, 5 Mar 2019 19:00:38 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: Upporting "i2c: rcar: Fix I2C DMA transmission by setting sequence"
Message-ID: <20190305180038.la4x75q4jx36h6km@ninjato>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="kmvhgvtxnxf6fkj5"
Content-Disposition: inline
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--kmvhgvtxnxf6fkj5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Shimoda-san,

I now upported this patch 55d2d2fb8b04 ("i2c: rcar: Fix I2C DMA
transmission by setting sequence") with this series:

https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=87931

The issue of the BSP patch was understandable, but I think my refactored
version needs less computation and is hopefully easy to understand, too.

I did all the tests I can think of and had no regressions. But maybe the
BSP team also wants to have a look at this series to check if it matches
their needs?

Thank you and happy hacking!

   Wolfram


--kmvhgvtxnxf6fkj5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlx+uUIACgkQFA3kzBSg
KbalyQ/+L1wlJi+Hlga8RZTfIS6LzYnCq7k4D1pc9UKQi4lR8FqkdIsTwV7RaydV
FVSnww2TQPPQvja8kn19Tq9jAdivKobire99ILMd7lns/1SNuu29CYQeaBgjSjGN
1hrsNkndjgl0VEJQEfEZx7KriwZH3Jag4ac22F4YL4QNul46OsBMbdAFMN/4wMTz
WtPhCopPuj+zkt3v/fAdJORN2Z3QuypHfiRf/PMrhBlPyZl+6k9Uac0HBBqxKdz0
d8dP62fmVQbaMbLflpt7iQw1kohm1tVMgiLwcQXhSnV01ZNJA6GiYK0JjFbOfYsd
TJXg97BpbfB6HCEdhFE2y/JrbneX1NT5pJxKX8covVQYtLGizDh2UQlfbeFB/Oxz
Z/k5yH7kW77ZJDdqudKYxNEKPz489mpV1eWievV5sleSIk0ZkNge1jM2NGDuRMm+
ae8jmFTHyy26wiLeXwwGKtv80UPI++J/i1+wak5DMN4WZRR3KKygGLACImqcVfzr
iog4eQijuTfkuU+Ktqcb38JhcFiRU3Hh/fOW2nb5bZAmo1NQyvKoNTsn6uJ6Tno2
y5X0Ysda1A+ZY2U4k6DRFyc4guRCvWA2bWKkszcdP1KjhbRErSFYcJXB8isLkXHb
wygdLt7T5Yp2QT8gSJo02OFlX3+6JWKm4ErkTaAylZyq82mxQ3I=
=pDgR
-----END PGP SIGNATURE-----

--kmvhgvtxnxf6fkj5--
