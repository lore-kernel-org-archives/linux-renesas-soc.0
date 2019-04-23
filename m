Return-Path: <SRS0=hHdZ=SZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7A86C10F03
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 23 Apr 2019 21:29:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 91096218D3
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 23 Apr 2019 21:29:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726342AbfDWV3y (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 23 Apr 2019 17:29:54 -0400
Received: from sauhun.de ([88.99.104.3]:56494 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726075AbfDWV3y (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 23 Apr 2019 17:29:54 -0400
Received: from localhost (p5486CDD9.dip0.t-ipconnect.de [84.134.205.217])
        by pokefinder.org (Postfix) with ESMTPSA id 8D62A2C7BF4;
        Tue, 23 Apr 2019 23:29:52 +0200 (CEST)
Date:   Tue, 23 Apr 2019 23:29:52 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Chris Brandt <chris.brandt@renesas.com>, linux-i2c@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] i2c: riic: Add Runtime PM support
Message-ID: <20190423212952.GE5659@kunai>
References: <20190320103003.20107-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Lb0e7rgc7IsuDeGj"
Content-Disposition: inline
In-Reply-To: <20190320103003.20107-1-geert+renesas@glider.be>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--Lb0e7rgc7IsuDeGj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 20, 2019 at 11:30:03AM +0100, Geert Uytterhoeven wrote:
>   - Replace explicit clock handling by Runtime PM calls,
>   - Streamline Runtime PM handling in error paths,
>   - Enable Runtime PM in .probe(),
>   - Disable Runtime PM in .remove(),
>   - Make sure the device is runtime-resumed when disabling interrupts in
>     .remove().
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied to for-next, thanks!


--Lb0e7rgc7IsuDeGj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAly/g9AACgkQFA3kzBSg
KbbKIw/8CHM9GzWsRrUIcjv6dvqblJiI+/Rg1hxxu/Bo7aQrE4XSUjwhxL5Frq3d
IOWuIVqSHbe8WdA0HgXnZ0WBaYFPCM9Y80WGadRF63BUueW7LLgYiqO95cDOLtxh
JhwbDGSJ6lt/BlFaUANA6TCKoimCeqGtlOVrkX5ONk+VduuSxzmER6IqC1KWxx9z
Je6XJ45LCOGa2Df2IQI/o2/+l6fr89r+8kCaTXIetbZYzv4j5KgOY6tb/uyVhj7V
+BQ3+KvsaPZuLbsiVKktN83THHHYoTgYupsocvUg56V9d7+F0NIWHMyZLvyq3PIE
+gTkt8qvFDm8YXcOgmI07ZO/SgJBA+RRY9sXcYZKFKpQIFRjuvCJmbKp/nal/ZXG
gHEzYT21gCl05zIn7/3IaP7ULyBX+eMNf7KbVgFFQO3N6LJhOjCxVAL5xhuiM1nt
T30ZDYcz/YyZu5pPStzcAaFYjv/gwBosZnSION66FbZjTz6NV795MFpl7dyisNjS
iJY76nfJ/ZDLmFPZXIgTLK8rajSsnYBUL9IFQnhHeLH83nc+jHvgIhzbFRZC52OC
MftJU7QLfnoykCfcEVqjOcQV97SlRyJKSQxGt0CFNR8bIISBPMm2Czi0Yx/djsL8
amF7V+Z1BPNISADsQWlk6TS+PWVRucprjjNEM3e90uVD/DIz6Fs=
=F0ML
-----END PGP SIGNATURE-----

--Lb0e7rgc7IsuDeGj--
