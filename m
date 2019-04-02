Return-Path: <SRS0=Wh2G=SE=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 455BFC4360F
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  2 Apr 2019 14:47:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 15B8F20693
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  2 Apr 2019 14:47:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731829AbfDBOr4 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 2 Apr 2019 10:47:56 -0400
Received: from sauhun.de ([88.99.104.3]:40394 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731828AbfDBOr4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 2 Apr 2019 10:47:56 -0400
Received: from localhost (p5486CD10.dip0.t-ipconnect.de [84.134.205.16])
        by pokefinder.org (Postfix) with ESMTPSA id 774692CF606;
        Tue,  2 Apr 2019 16:47:54 +0200 (CEST)
Date:   Tue, 2 Apr 2019 16:47:54 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Mark Brown <broonie@kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 0/3] spi: sh-msiof: Add reset of registers before
 starting transfer
Message-ID: <20190402144753.GC5389@kunai>
References: <20190402144023.27422-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="hYooF8G/hrfVAmum"
Content-Disposition: inline
In-Reply-To: <20190402144023.27422-1-geert+renesas@glider.be>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--hYooF8G/hrfVAmum
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


>   - New patches 1 and 2, in response to review comments on v1
>     (although sh_msiof_modify_ctr_wait() didn't turn out to be suitable
>     for calling by sh_msiof_spi_reset_regs()),

Well, the overhead of readl_poll_timeout_atomic() is low enough to
ignore reusing sh_msiof_modify_ctr_wait IMO. Thanks for doing it!


--hYooF8G/hrfVAmum
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlyjdhkACgkQFA3kzBSg
KbbYNA//al8wnQVvgr/KiwBVuBpCnprb09YJoElb5J3gWcBvm8hjGh0Lwa80AYPz
LDY443FQxqDj/d7djmsfH7rJJvA0GciRadwXMs3qdYrsBk3RE7DLw4zx61Uldl0B
hYqvhVS9mmYtG5gn49x71/3VOde8ToqYp2eBtQWw8WcjysVSbeIc8BizKEl71AMu
qs35LnIUqTkYuC9xrjIhICJiszD8E/eqz7zG68ujKHnsW94pv/YtN94GoGsbBkun
CPRk2AM8zR4A+Q3XzQI0BzDLSzucYRnv7KLUDZhmIHzWa55/h0k2GJw88+pkXtcV
6F9h2cwanXXbnUCO6eiT8cn0WUlBFV9PmaSsnWTkG4H18p46OUn8Nind9a3oLWnt
Wj2uNv7EKqsHIzo5R0IKkZdu5BnaNKOJPf4ITcQQmW5gdpiFx31+fQeqvnEwHz+o
Gdn9xlR9pXNv9MBXGm8rJ+WJp3XzWEICTulBX1KMWtjgZNvuxUu3VlK//lDNZGmf
1EuWVJdjyBXP+kRqNrU3cKY1f2dwwuvuvUnUhug7BxDQUtl4EVGvXwdjCwtw9JxT
Z42HsZY6fBlazgHdIjrGEG6t+vCuxWEiJeLDVz2x5l3Q2gKhCkSEvfIrAy0IrN82
LtD6hkXUGR0OjvnUDq8/D7LtqlhPc9TtUv6aQu2DKgd5Uuijho0=
=Fzvb
-----END PGP SIGNATURE-----

--hYooF8G/hrfVAmum--
