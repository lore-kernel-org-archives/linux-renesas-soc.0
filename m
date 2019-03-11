Return-Path: <SRS0=xQI0=RO=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07B62C43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 11 Mar 2019 10:40:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CC4D8206BA
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 11 Mar 2019 10:40:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726074AbfCKKkB (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 11 Mar 2019 06:40:01 -0400
Received: from sauhun.de ([88.99.104.3]:56764 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725839AbfCKKkB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Mar 2019 06:40:01 -0400
Received: from localhost (p54B3359D.dip0.t-ipconnect.de [84.179.53.157])
        by pokefinder.org (Postfix) with ESMTPSA id 412C02C08C3;
        Mon, 11 Mar 2019 11:39:58 +0100 (CET)
Date:   Mon, 11 Mar 2019 11:39:57 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH 0/3] i2c: rcar: make DMA more robust
Message-ID: <20190311103957.GB961@kunai>
References: <20190305175434.13107-1-wsa+renesas@sang-engineering.com>
 <CAMuHMdXx2zKaV1mEBh+br5=BPbCSi3HVa_dpjpz1ippSS_oN9A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="+g7M9IMkV8truYOl"
Content-Disposition: inline
In-Reply-To: <CAMuHMdXx2zKaV1mEBh+br5=BPbCSi3HVa_dpjpz1ippSS_oN9A@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--+g7M9IMkV8truYOl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Tested on a Renesas Salvator XS (R-Car M3N) and now regressions found w=
hen
>=20
> no regressions? ;-)

:DDD


--+g7M9IMkV8truYOl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlyGOvkACgkQFA3kzBSg
KbZ9NA/+J+WBXq98wULp7tryZ06LqnDUCjJXom43bPgECSBKQUaCAMNlwhQ8U8GB
TEJPu+IZ8rf9ISEIse+Otcay+xLSFbMEQcB74Pjn0ZgV1KNTyf/lbU4gB84rTBRV
knJo/X6Gxtxti5kwGotnnMAo39MTWCWC7IUvF6DmOSr59yZxGwLYlPNcae4eqVn7
n0/Acq2k+pVSf/fsgnvWGODd8qm41hwo7FXH2VQ3slU3xLFkR6zN/itUx4XY0BDS
wKjjeTiYwBP0tFy+Zn3cd7e01qrQDmXnJxoTmIQRd4mNdv44MwZbAo3Tv1ARVCJ0
LdIXPH6xZWXAzYxh7GPEVatBHQxvRd4yflNF4Aphd5RiqDQZj7fUIK/RT6mamhTB
mD/qZnFvj+WKKrPXliAELEKN2MQV4S9/QmYuHklntPN3h4Nv5YE7yigzD5Tlpe4T
zFS4fJAq2X3iVCEfcFWQsFfUNHgp3e0aZ9vhUfffna0L8lZ8PFETA18pAzmrAxcP
YHYINnZ0hMP7bHmY4b7z/oslz5eDRCs/MNOZt0ZOsRYrnXFIziXAG5e6XQlN9ucI
tnJ99iv1smZZU172oSsOqjQZZwsayg356zVp1D0xsfc9opGiOBvKrVald/gcNOB9
olhuTYn2bv2KnQEceSPtgMXPQ8OZkQdHA4ydFqYVFKVKGm+Rz84=
=Yohd
-----END PGP SIGNATURE-----

--+g7M9IMkV8truYOl--
