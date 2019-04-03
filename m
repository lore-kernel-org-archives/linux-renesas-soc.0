Return-Path: <SRS0=jJK9=SF=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 294A0C4360F
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  3 Apr 2019 06:54:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E5A24206BA
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  3 Apr 2019 06:54:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726004AbfDCGyI (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 3 Apr 2019 02:54:08 -0400
Received: from sauhun.de ([88.99.104.3]:46080 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725936AbfDCGyI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 3 Apr 2019 02:54:08 -0400
Received: from localhost (p54B3311F.dip0.t-ipconnect.de [84.179.49.31])
        by pokefinder.org (Postfix) with ESMTPSA id CCDC52C282F;
        Wed,  3 Apr 2019 08:54:06 +0200 (CEST)
Date:   Wed, 3 Apr 2019 08:54:06 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Mark Brown <broonie@kernel.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>,
        linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: Applied "spi: sh-msiof: Use readl_poll_timeout_atomic() instead
 of open-coding" to the spi tree
Message-ID: <20190403065406.GA1438@kunai>
References: <20190402144023.27422-3-geert+renesas@glider.be>
 <20190403044219.41630440082@finisterre.ee.mobilebroadband>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="gKMricLos+KVdGMg"
Content-Disposition: inline
In-Reply-To: <20190403044219.41630440082@finisterre.ee.mobilebroadband>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--gKMricLos+KVdGMg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Mark,

> Suggested-by: Wolfram Sang <wsa@the-dreams.de>

Any chance this email address can be changed to the one I used for my
Rev-by two lines below? Nothing major, but would be nice.

> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks,

   Wolfram


--gKMricLos+KVdGMg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlykWIoACgkQFA3kzBSg
KbYt3g/8CWJ+x3Oovg5NbsPDBGXFfZg6PjFpf+sdHcbkFANgeOqK5YBfZNzUAoFO
u/oJ0abYSyQ304NSVf8WtI/EKUCiK6NM6c24Z1WcPCTR77QLdDPQTVUIgAP/6FCU
8V08F76n45k1WpBFTlKSIDBjlhsms4vkAPlRkgoVgZfNzn1O0ZuhY8pl6V/WXk0Z
i1K2Z4uPdr3FsumUCJ7xlHSpi+z3OtR2A1zPRhdybulmKCM2Kd4s6ShySlpg/TjB
na+57WAEgLI6FuQSsbkbguMJ97X+Iba9kkfiHKuQbQUI9iLCZnkMgRYaaRtB+GKb
Ks54GXq7IAPOTk+HH35IEjMFAfEl5zMHlVZaA1b6W3tLSouvbZ+MFQ9YK/prlC24
1Hl+OQuyurGwJpdYHVGA2G4P1cH7OMyZL9uqz2xeDcUt8pOrlevJzLGRpWgqb2d3
R2ue3qWVs/MP1yDN7i9Nz7FPOQESXzuSiZDbl3cfbgEVmV7tsrERwtdt8bhSdwos
Zwxy8V/Kk0vVpj8XKvf0RH1mVtE9tbC2jOi9BcXeGGKhpGyam8gMd2lw6X/CpdeM
Kf6iw6fVpwE2EspRvUteDz8Izka4Lgwwx/lGXg46EljYebWNehUPDos+aZEC144T
mNa3JLGXD5OM7CJHJiXI3L4CePbfLO9YaFaeskYkQ8yHjZX3hSc=
=39BZ
-----END PGP SIGNATURE-----

--gKMricLos+KVdGMg--
