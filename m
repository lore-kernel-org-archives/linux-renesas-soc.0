Return-Path: <SRS0=zxXW=RW=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23B75C43381
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 19 Mar 2019 11:29:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E81442085A
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 19 Mar 2019 11:29:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726464AbfCSL3I (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 19 Mar 2019 07:29:08 -0400
Received: from sauhun.de ([88.99.104.3]:44088 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726244AbfCSL3I (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Mar 2019 07:29:08 -0400
Received: from localhost (p5486CE21.dip0.t-ipconnect.de [84.134.206.33])
        by pokefinder.org (Postfix) with ESMTPSA id 45E872C3F83;
        Tue, 19 Mar 2019 12:29:06 +0100 (CET)
Date:   Tue, 19 Mar 2019 12:29:05 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Marek Vasut <marek.vasut@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH] mmc: renesas_sdhi: set CBSY flag before probing TMIO host
Message-ID: <20190319112905.GA3016@kunai>
References: <20190319103417.28407-1-wsa+renesas@sang-engineering.com>
 <CAMuHMdXSScr8q-pU-vtuZ81A9ZaObaLWX4awimsEgLVnxq=c_A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="FCuugMFkClbJLl1L"
Content-Disposition: inline
In-Reply-To: <CAMuHMdXSScr8q-pU-vtuZ81A9ZaObaLWX4awimsEgLVnxq=c_A@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--FCuugMFkClbJLl1L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 19, 2019 at 11:57:00AM +0100, Geert Uytterhoeven wrote:
> On Tue, Mar 19, 2019 at 11:34 AM Wolfram Sang
> <wsa+renesas@sang-engineering.com> wrote:
> > The CBSY flag should be proper before calling tmio_mmc_host_probe()
>=20
> set?

No. The state should be proper. As you see in the code, it gets cleared
for a certain type of SDHI.


--FCuugMFkClbJLl1L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlyQ0n0ACgkQFA3kzBSg
KbbN3Q/+OuvFCN0wALV1QKZTuGEtNDadw25+M274/W4td8sF1J1/CLs+45SJZqdx
YvQlvBvkKnY3vp15TjiCq7ZtHKAlCZ0pQzw7TsDNTnqDmnH66+lMGCohqzWU0sFy
ErXhYbo3V7R7EJNnDlqmmCQqC/8QV0k/OmTrSNLE8F1oC24AUnXw4TnFvO6XEI41
P936osogRLbV8DBiKT/bHV5ZILLJNKG23fK1c9c35Bx6BnTkHwsa8nJcQgfXJeh6
8+Br+ANmv8FheJgL0WtaKVnMylaE6gfbEMXRgy0pvcQOp4RAkBw9VQ+7GcT5v8B3
384CBr7EBLvniPBEnUdKIhFWmKQahDkmuxOgQ+NhZBpWnHlkAGy77z669ftbAos2
n11u+I2FjS2bARFsPMEW1YBe3p86AYwdtDHu61TtxzY+F1e+u0Lt6BqgdbgDBnno
MluGZOOogdy0hNf8lBNa7RCqW7gldGAL79D5Fz9kMjO2y1UJAXGqDtMk6jYl5rva
2lJ1ol3aE4IfFPlv49qgumr6MlpcJYHY9e9swT1dhGPKVcn/D9FM0Ax1VI93bVP+
pJTkCJSDrgpM6mFEsPcxd5ol/YdRKNg1JhJsCusvKOfyNnLsOFi92qLvNRNSWJMZ
ULC/l3WgDDNf1LYFNTe8j08kt0vEk7bwO4gO5rl0iYJVtC0nVJw=
=MifL
-----END PGP SIGNATURE-----

--FCuugMFkClbJLl1L--
