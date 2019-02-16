Return-Path: <SRS0=vwki=QX=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_NEOMUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B124EC43381
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 16 Feb 2019 14:04:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8829D222E0
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 16 Feb 2019 14:04:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727666AbfBPOEf (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sat, 16 Feb 2019 09:04:35 -0500
Received: from sauhun.de ([88.99.104.3]:43208 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725294AbfBPOEf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 16 Feb 2019 09:04:35 -0500
Received: from localhost (unknown [195.52.228.164])
        by pokefinder.org (Postfix) with ESMTPSA id D29242C0509;
        Sat, 16 Feb 2019 15:04:32 +0100 (CET)
Date:   Sat, 16 Feb 2019 15:04:32 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     marek.vasut@gmail.com
Cc:     linux-gpio@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Jan Kotas <jank@cadence.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] gpio: of: Apply regulator-gpio quirk only to enable-gpios
Message-ID: <20190216140432.u3gw33vvqe4njrgn@ninjato>
References: <20190216134627.1601-1-marek.vasut@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="gd5kuremsqua5u3w"
Content-Disposition: inline
In-Reply-To: <20190216134627.1601-1-marek.vasut@gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--gd5kuremsqua5u3w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +	    !strcmp(propname, "enable-gpio") &&

I haven't looked at the actual issue, but one minor nit I usually have:

I think 'strcmp() == 0' is easier to read since the above is too easy to
be mistaken as "if not equal". I have just been bitten again by this
after a long day, although I should know better... :/


--gd5kuremsqua5u3w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlxoGGwACgkQFA3kzBSg
KbarUw//SB6/8qN85aVggBProLze/wt/3oUme2MGj7GH7cTkyF4ODbXQy+7DBKd/
dYaI9jQ2ATjBKc9cbefJxQjNHgQmGdk5CGrJqrs9ZbxPqSPHXMIO3sluutb9yUSC
izDFahTA7IQKiesnHt+EtMQ+bPmZixpTf8W/sXoskbMtvzpv/mbVHQ6sbdfqY54w
QMfoObBTrWmRluC/1ueD0FzyQdIsOqcWq2SzIDgJIw0liGPr8ejA9lE68LUNYwO0
1ho9/VYqyA0ueugMk7aXssOJCNqYlkuHknnZ52L39vkwZ9rZKDjQoXeu2qEFNLN4
edPObydjcA3FhaxAATZ+OK6Bv7CHbdPZ0EpaRcZVK7U5JNp50/BUKjV1v7+kwEUY
NjeXf21Liaa8EeC+K8cZBEVCWXm0Hg5fwdlHRZd9Y81iQ2i68Akj6r7Zqr0wXN2H
SyRDxbMAUyKo98jgdMiY+K2pH0yupp8OVTqUyps9PgVwMuvoPbE/6HfAegyCAHfF
lkI8m/Yo/+TqPnNQKC/NGB9aiKqhTPdI2HC7sVeMlLeQUbKoRu91j3h54I8IAfCe
+xxSJsw1LDwbV1B2+gp/oTsoyOGeTnw7uA+6xGuINvWkV5XewBeLs1RPJBGFwriN
uHPtRYI0O1+hR82KnGZX4oie9uFfGfVwKmsqURThjvEs/nPtEFQ=
=AHq0
-----END PGP SIGNATURE-----

--gd5kuremsqua5u3w--
