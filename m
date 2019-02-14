Return-Path: <SRS0=Vdsz=QV=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_NEOMUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F29CC43381
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 14 Feb 2019 15:53:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6FB38222DA
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 14 Feb 2019 15:53:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502355AbfBNPxK (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 14 Feb 2019 10:53:10 -0500
Received: from sauhun.de ([88.99.104.3]:53768 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2502350AbfBNPxJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Feb 2019 10:53:09 -0500
Received: from localhost (unknown [83.221.228.209])
        by pokefinder.org (Postfix) with ESMTPSA id 71B0A2C2817;
        Thu, 14 Feb 2019 16:53:06 +0100 (CET)
Date:   Thu, 14 Feb 2019 16:53:05 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Simon Horman <horms@verge.net.au>
Cc:     Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Marek Vasut <marek.vasut@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Takeshi Saito <takeshi.saito.xv@renesas.com>
Subject: Re: [PATCH] mmc: renesas_sdhi: Change HW adjustment register
 according to speed mode
Message-ID: <20190214155305.4qydlgruvkbba2xa@ninjato>
References: <20190208193002.16915-1-wsa+renesas@sang-engineering.com>
 <20190210133926.GD31044@bigcity.dyn.berto.se>
 <d6d064f2-fa58-d31e-83b8-1cc3ffbc7dee@gmail.com>
 <20190213092210.GG31044@bigcity.dyn.berto.se>
 <20190214124648.qkr7p5qss4kdzigh@verge.net.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="covu4m5yejwfbahi"
Content-Disposition: inline
In-Reply-To: <20190214124648.qkr7p5qss4kdzigh@verge.net.au>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--covu4m5yejwfbahi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > > Can you test this on E3 Ebisu (do you have a board) ?
> >=20
> > I do not have a E3 so I'm afraid I can not provide a tested by tag for=
=20
> > that board.
>=20
> I am happy to test. Is anything specific required?

Nope, we don't have a testcase. Just check if everything still works.


--covu4m5yejwfbahi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlxljt0ACgkQFA3kzBSg
KbYu+g//UopGJY2wMZci9oTH0fZMb9h/IDcmNAzli1whyDQra1YiUmaY/CKQ9AKp
Z6QzqzElgYS06qPqzIKURDzHR2SQbaq3JmRlQeXG3KjnHyG2QpqGnNY1J4jCzzMJ
Hazfx09W5rxFeru6QmPReXXshQxA7mz/lWMLB0v1xJiYyj0bJBIZglJgJp6MLRE2
XVAP8xBnunUr5uz39Stdai0V6OFtIXZiIsEHXbyS+xT6G/NpELwVOib27U6I7C2B
gEKDz4DB/dbDL+iloO3VoHFTPyZGBHFRXOP0ZUPKBgx/wvWAPy2XeBgaOQdgX6G0
+WIaXHaicdio4mF3mQoThFKozYEW9uJ7LP5X9iwRfgarpSAVHlNuwfqddZRDmMS8
icZdFnttLowsfi2qh6F6McqjPAVQOs14jDipUHEsXp+URKEOPrXoLYCNPjmkmSZz
n+mjlHxhjTHhIuR3BnHbUct/uTgqgHUAxuQBEQ4UDE/bs6b0b07PG90hRMjG/OmO
UOnM8DXdy4rBgxI6vm/4Ehhlb3Xd2FxIaZ/wo76uF0B/MioRP6O+MAWTxv05iSNv
WoEou+11w2KDcXvZC8uQbe9p5tcgYjOcbjv0TE2UflH2vSRV/NyLBPHwHXNrs551
pqaoxCfUYQz0kc4jir+nfIU8KRjSqafdlCcX3APjpiy5uff3Ie4=
=74uY
-----END PGP SIGNATURE-----

--covu4m5yejwfbahi--
