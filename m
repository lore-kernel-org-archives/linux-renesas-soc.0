Return-Path: <SRS0=0QnK=RS=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C3A4C43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 15 Mar 2019 09:28:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4A19221872
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 15 Mar 2019 09:28:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727282AbfCOJ24 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 15 Mar 2019 05:28:56 -0400
Received: from sauhun.de ([88.99.104.3]:36184 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726886AbfCOJ24 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Mar 2019 05:28:56 -0400
Received: from localhost (p54B336D9.dip0.t-ipconnect.de [84.179.54.217])
        by pokefinder.org (Postfix) with ESMTPSA id 9A8CF2C3637;
        Fri, 15 Mar 2019 10:28:54 +0100 (CET)
Date:   Fri, 15 Mar 2019 10:28:54 +0100
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
Message-ID: <20190315092854.GB1176@kunai>
References: <20190314223130.31802-1-wsa+renesas@sang-engineering.com>
 <20190314223130.31802-3-wsa+renesas@sang-engineering.com>
 <CAMuHMdWvCUJ4S1U-jR2fG=JSXO3KMbbO2=hWPOxqQDXzGMXi0g@mail.gmail.com>
 <20190315082917.GA1176@kunai>
 <CAMuHMdUbzp4qMbJ-ci4k0fMOwOoYSY_JBZ_tWThZUjcJEd48eA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="tjCHc7DPkfUGtrlw"
Content-Disposition: inline
In-Reply-To: <CAMuHMdUbzp4qMbJ-ci4k0fMOwOoYSY_JBZ_tWThZUjcJEd48eA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--tjCHc7DPkfUGtrlw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > >   3. Some drivers use different limits (e.g. 2048, 4095, or 4096), so
> > >      eventually having a common upper limit is not easy.
> >
> > I don't understand this one. Which limit do you mean here? blk_size?
>=20
> Yes, blk_size.

I am still confused. Which upper limit do you mean then? Because for
blk_size and blk_count, they are both driver specific, or?


--tjCHc7DPkfUGtrlw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlyLcFIACgkQFA3kzBSg
KbYIog//Ulp19gEn3w4s8AZZQfQvpzpsIx+4V605NfLlxgfvL4u6iLG2BRqtv/8p
l7ZBuIgcAAcf8IIuzPJstvr8zNQq4RzS5hTRJsYc1ME29I3khUKoj5x6bo2DoHhb
a/2GRm59yCPMqKEOSSqLYHJxLti0gvvpxm4jfsEVhZ4rg1E7k/TQD+9vfnsjIovK
dMoyD/BwzHzH0HJWqYIiw2/9mMFJ79MMNQ+M0cnAEGrjvf9FSw71jlG9xuaX5l0b
zyAr3Re49MdI8mP8s0aqv19o1qANuJOzHvAnWPMaxV+tF/fZPFpFZfoxB+xW9Mn3
I1iFoJeDUMjun2sS7rcar77Pk+RO0M9iz9w17mn5LeEaIE+j1CQzva5SIp3WF063
kqxjBbp0+VpiArdsAXItaRSwXQbg5I91kzrgSsrAQXBMrZZhxuj+TCl9m5Q5EDgb
M+PtjjSQd2ehJd304of6MVUSm/icCZg+BhPchbDoFYlGrc6VJPR2uHJrctCN++oV
2wExiC+rpzKjvxeszuywV/JCcqgPj9Kx2GWn7M9Lhlh+K/ybomzUQdllmqIGaPBS
f6nmpp+IL7mZVKJ0P0jQtNUvp5TjZiXdMlezJGLmNAP3CjzVD9iDT+kTMiuaVuWJ
xJNYkY2TbnHGvqsLiPuQn5Ng9YqEUq5SOBGhGRzKn+9MnRIb4ao=
=VWMD
-----END PGP SIGNATURE-----

--tjCHc7DPkfUGtrlw--
