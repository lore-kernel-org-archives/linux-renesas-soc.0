Return-Path: <SRS0=a0xC=QF=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9096CC282C7
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 29 Jan 2019 16:31:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6177820869
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 29 Jan 2019 16:31:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728347AbfA2Qbz (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 29 Jan 2019 11:31:55 -0500
Received: from sauhun.de ([88.99.104.3]:58054 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726374AbfA2Qbz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Jan 2019 11:31:55 -0500
Received: from localhost (unknown [87.140.57.181])
        by pokefinder.org (Postfix) with ESMTPSA id DAB2A3E422B;
        Tue, 29 Jan 2019 17:31:52 +0100 (CET)
Date:   Tue, 29 Jan 2019 17:31:51 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Marek Vasut <marek.vasut@gmail.com>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Takeshi Saito <takeshi.saito.xv@renesas.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] mmc: renesas_sdhi: Fix card initialization failure in
 high speed mode
Message-ID: <20190129163151.GA5372@kunai>
References: <20190129054039.15278-1-marek.vasut@gmail.com>
 <CAPDyKFpa=q+oSES115SBUnpFVq+nUGwH7sY5F=go4-rZp6EasQ@mail.gmail.com>
 <c0ae0fd2-3dbb-0e65-529e-99b78e0624f5@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="oyUTqETQ0mS9luUI"
Content-Disposition: inline
In-Reply-To: <c0ae0fd2-3dbb-0e65-529e-99b78e0624f5@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--oyUTqETQ0mS9luUI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Should it be tagged for stable?
>=20
> I am tempted to say yes.

I agree.


--oyUTqETQ0mS9luUI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlxQf/MACgkQFA3kzBSg
KbbmXQ/+KGsoe7kI89l7xZM6BgOzgY4sSWVY5fRuYO7cZgMyykWxMA5hVJt0UYLg
xFoGuYAdSAguSuI6mob63NlsR+6WGq+ySDbwUkq1g+uCFsex3SSRCc1qBi2qKuZ6
ZtxfRJkGagEcDAzueP+fHoFivwDvgkSm2nt4OXdma894Kf2URLx0v0FivOrBZZCF
o2KFi+H4fKPjLS6rDIfKP+2NSaE+MV5Bdza+PWOC6ymIKM+a3MBIgSTNEz2kYg8h
T/YCcoNGuhflCGKyCaAgWzpPWXCxeZ1/eHzxYubKdZmFQZYbtGJOyDZEp35qc7cA
0YOhO+t9mAIEsybz1LCrXV+6yDnP5Kc/+2Sh/p6NZEajHG03yr81281RgcKZBOTz
9IYPM0HPNjV/kNU7I5mKU4RUVPzKDraJ39zpSg8ltPDhA6ydsPYo5W1sosbl4jkG
1zTNLYuvzRgVF6IM0txSXAw9jhf6QCfYwaNfY41KyDBUFL+EJIf1a+VGc2qA9nHM
vLkr5+3Lix7Xh+JsMLMkfVyYcICwWiiLKrYKnEkI+WvWetmv/EysF+47gTHLYi2t
8h11Bi0/Mhh1O3pj8UJFJJxUXz+x1n4//Wnwx8mK1TbQnIw3G8U9z7LUmAVpPz9a
XBhmKA25k1qsUq6lDiHe9hO4fWvZmRxFmePQAh90dmvvG6kh0XA=
=C3el
-----END PGP SIGNATURE-----

--oyUTqETQ0mS9luUI--
