Return-Path: <SRS0=pEya=RU=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3CB8C43381
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 17 Mar 2019 21:23:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 919632082F
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 17 Mar 2019 21:23:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726702AbfCQVXK (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sun, 17 Mar 2019 17:23:10 -0400
Received: from sauhun.de ([88.99.104.3]:58056 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726333AbfCQVXK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 17 Mar 2019 17:23:10 -0400
Received: from localhost (unknown [81.92.17.147])
        by pokefinder.org (Postfix) with ESMTPSA id C36C12C27DA;
        Sun, 17 Mar 2019 22:23:07 +0100 (CET)
Date:   Sun, 17 Mar 2019 22:23:07 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH i2c-tools 1/2] tools: i2ctransfer: consequently document
 -a
Message-ID: <20190317212307.GA1471@kunai>
References: <20190311223335.18586-1-wsa+renesas@sang-engineering.com>
 <20190311223335.18586-2-wsa+renesas@sang-engineering.com>
 <20190315134345.333416b2@endymion>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="qMm9M+Fa2AknHoGS"
Content-Disposition: inline
In-Reply-To: <20190315134345.333416b2@endymion>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--qMm9M+Fa2AknHoGS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > +  i2ctransfer: Mention '-a' everywhere in the manpage
>=20
> Not sure how "once" qualifies as "everywhere" ;-)

Yes, this patch changes it only once but after that it is everywhere :)
(It was mentioned in another place already)

> Looks good to me.
>=20
> Reviewed-by: Jean Delvare <jdelvare@suse.de>

Thanks!


--qMm9M+Fa2AknHoGS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlyOurYACgkQFA3kzBSg
Kba6IQ//RW5H4Uuw+Wfen0e9iazWFhgJlsQOTDlit1TBq6ZN8BoNNkNcmTweG0Xq
Muu4mDxYCHbCHSHvbpf1cQ3cZuDIXp2XBaoN0AfuZXJ/1apo5szs+T4Zuw0J0KjY
DO22dejjKccAFP6fgx319H5DRInqx/6KsRaUkwVwcgPon01uJ/wHn00iWXN1DN+o
2f1y/mvyXSRyBkaIA0UOQJY5zwB87a6GsPg/IhmJfzwXGLzrBIjEW7G+mL9K1Zwl
3ADyBLvLxmjH5Dby7ndeg5D+f8KWmHEWhGv1Owg0oEiNZVE4PEbC9Rx2OXlx1gHl
oUHkNqvdO7Wpu53jtEiRpDGXfCff/5qICaODtfu0dk2OqjWEtStNi6tAHcQVFh0J
M7KiAhi8Gk4wZ2Lmdh8SVUb8fYxVKhTPBNfXApTvHq4GK4SgfECm9kAkFwK92MDd
fWo214hact+plnTBtRgxgNsjMCtKj7tiM3DNHzRk9Ce6oxEFajdDZkcnYkUtKO31
SL9ljSDfU780ASdyV5uejyWz4G+9/oU58k/uEfWeq1kYCO4dpwhCIULGI+B3vsBT
80ZXxJuwl1t84+xXv254De0IuudLVsC9V/HnV0YI6KRLfz+eCbSMrCnktp1aqBpo
4sqCyZBxB+YanbId7Kszanxx11LWsIUNvU82BEwG4VuJdNcX6U4=
=1ePF
-----END PGP SIGNATURE-----

--qMm9M+Fa2AknHoGS--
