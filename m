Return-Path: <SRS0=0QnK=RS=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82839C43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 15 Mar 2019 08:29:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5A64F20693
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 15 Mar 2019 08:29:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726766AbfCOI3U (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 15 Mar 2019 04:29:20 -0400
Received: from sauhun.de ([88.99.104.3]:35830 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726582AbfCOI3T (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Mar 2019 04:29:19 -0400
Received: from localhost (p54B336D9.dip0.t-ipconnect.de [84.179.54.217])
        by pokefinder.org (Postfix) with ESMTPSA id A64E72C3637;
        Fri, 15 Mar 2019 09:29:17 +0100 (CET)
Date:   Fri, 15 Mar 2019 09:29:17 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Subject: Re: [RFC PATCH 2/2] mmc: renesas_sdhi: prevent overflow for
 max_req_size
Message-ID: <20190315082917.GA1176@kunai>
References: <20190314223130.31802-1-wsa+renesas@sang-engineering.com>
 <20190314223130.31802-3-wsa+renesas@sang-engineering.com>
 <CAMuHMdWvCUJ4S1U-jR2fG=JSXO3KMbbO2=hWPOxqQDXzGMXi0g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="YiEDa0DAkWCtVeE4"
Content-Disposition: inline
In-Reply-To: <CAMuHMdWvCUJ4S1U-jR2fG=JSXO3KMbbO2=hWPOxqQDXzGMXi0g@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--YiEDa0DAkWCtVeE4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Geert,

> > -       /* DMAC can handle 0xffffffff blk count but only 1 segment */
> > -       .max_blk_count  =3D 0xffffffff,
> > +       /* DMAC can handle 32bit blk count but only 1 segment */
> > +       .max_blk_count  =3D UINT_MAX / TMIO_MAX_BLK_SIZE,
>=20
> I have mixed feelings about this change:
>   1. You're lying about the actual maximum (yes, there's a comment that
>      mentions the real limit),

We can't utilize the actual maximum without converting the MMC core to
u64. Given that the above max_blk_count is still way beyond any
practical value, I am OK with the above.

>   2. This fixes the problem in this single (set of) drivers only, while a=
bout
>      every other driver (not the mmc core) calculates
>      "max_blk_size * max_blk_count", too.

I glimpsed, too, and found various patterns. We could maybe add a
warning to the MMC core, but other than that I fail to see a way to
handle it in a generic way. I'll think about it some more. Or do you
have an idea already?

>   3. Some drivers use different limits (e.g. 2048, 4095, or 4096), so
>      eventually having a common upper limit is not easy.

I don't understand this one. Which limit do you mean here? blk_size?

> BTW, drivers/mmc/host/usdhi6rol0.c does it the other way around:
>=20
>     mmc->max_blk_count =3D mmc->max_req_size / mmc->max_blk_size;

I think we can't do this because of older SDHI instances. max_req_size
is still 32 bit for them, but their blk_count register is only 16 bit.

Thanks,

   Wolfram

--YiEDa0DAkWCtVeE4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlyLYlkACgkQFA3kzBSg
KbbnnBAAghtnZmeSGcjXVJmnp2IgEQqLDf+yDeiU2ykqOc6r+ul1BLaf5IkUb5eV
ruAnwif+x8eeu+/witivr3eCh/9h1HdyU7xeXq1fAZms7bQhw6dBmhIvmGW3xvYu
1tTEJ8bjBHfZjjd4L8JFQa07SBBsPwa4TbRF+J6yU88/8jTv3bctxMFesuMwE1CW
wUXsP+saq5NgfG5cRwlaWF2BNpbTwuIUwc0pOMaPksjl1doT3dDjbanZ1d5zP0Mr
UKvIMG+PItPQ7Qnctj5gdfvBQS9sS6UA3vDBfr5dtNwna3PEF8dNZKrxBY4NcQB6
vn4JAPgMVpa72IBl0fewUngt/Wi7LJ9yg4GzHXm8/wiJ76YcH1zVvsr0Xhe/QusK
6CwRQcBF1leW4tRiaAiDSz9s3gz+WPwGvegv4a3AN5ymaSfZv5DoOSuPQ2JnYVth
FoktYgVVLI9yKwHFZtnZasgkDRRSUJxpPaEALwDX0Gye4tUxx8+PRy0yg8GAIEhv
YK1jyWFTdeLi2t4Iq1evNsdvKvVey/XJYR8KqaBtJkSlg14GFsG7YVJiyjk37VFm
58X5P7CPrtQE5pHhIxZWeP7vu7V19byR79nNRjwGIGsH1jf9BCymv1WvgVS1NupN
x5ilD88Qbx6hJ2Ktuip1Xf9daB0dT02XcJK+FNzWMwYdncnPVXc=
=6CTz
-----END PGP SIGNATURE-----

--YiEDa0DAkWCtVeE4--
