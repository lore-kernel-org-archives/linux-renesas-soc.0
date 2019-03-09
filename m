Return-Path: <SRS0=uGqO=RM=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84F85C43381
	for <linux-renesas-soc@archiver.kernel.org>; Sat,  9 Mar 2019 10:11:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5E5BF20851
	for <linux-renesas-soc@archiver.kernel.org>; Sat,  9 Mar 2019 10:11:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726235AbfCIKL1 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sat, 9 Mar 2019 05:11:27 -0500
Received: from sauhun.de ([88.99.104.3]:40200 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725791AbfCIKL1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 9 Mar 2019 05:11:27 -0500
Received: from localhost (p5486CD1C.dip0.t-ipconnect.de [84.134.205.28])
        by pokefinder.org (Postfix) with ESMTPSA id 23A632E3551;
        Sat,  9 Mar 2019 11:11:26 +0100 (CET)
Date:   Sat, 9 Mar 2019 11:11:25 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/2] i2c: rcar: explain the lockless design
Message-ID: <20190309101125.GG1340@kunai>
References: <20190303150314.6528-1-wsa+renesas@sang-engineering.com>
 <20190303150314.6528-3-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="bFsKbPszpzYNtEU6"
Content-Disposition: inline
In-Reply-To: <20190303150314.6528-3-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--bFsKbPszpzYNtEU6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 03, 2019 at 04:03:14PM +0100, Wolfram Sang wrote:
> To make sure people can understand the lockless design of this driver
> without the need to dive into git history, add a comment giving an
> overview of the situation.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-current, thanks!


--bFsKbPszpzYNtEU6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlyDkU0ACgkQFA3kzBSg
KbbbEg/+JnKXC0+eylbm2fxW5NHEYG7mhByIU1s9FwcWn2lDIeJExWx+6w5deCho
tp75gU3KSRCVnLotkEtKjE+HEsBM41rtxUtJ1CyEXvuaDIB7HAyRLnnx/DnFXiQI
AL6N/FYqoXZy6Yng6GqrygTXflP6fG4ioUdnunk1oRWXCmidBflfP05g2g8tehjF
BchBnuGPHPm8l8OwQpii6XLm2b5soYvsstFIir7tuateHwO5S+EKlrQPR7mqQyHy
QMLcw60EirdHbSpcLcIwUrK5TSubAAWKgi2CzNCiwdxQUyjogm/kZ6YkdzFDiZnE
X9OytSNMoDuP1rFOypU7qy60AG06iuaqXAaoF5r+M/e8bOXYNUEmLOuLuzRfcd/f
Od4fHXDsxdXQEQtyNllMYZm/DPhPcBRTiovdIf3+scRuk0bm+JM5gQElomEr3WaE
l9+VPCQ82xOBcH24GwfifHYc3xFCnLV2dr+ra/ykk8DJscK1dlXA5waeMloqnbdd
bk67rs5h1uKCWuoWiSKrjrt1kiSBC7gbEP/j7mjKglPU7EADCZiDKvhJMMZoFgow
qQPdoHl1P9sOmnkgs5txqo3Hu7YXR/MzA9xpVZFoXAqz1yUpLkISiDfceJNl8r7Q
pzyBCkebO16eveDvnkxwe4pmARzhtvgV1c/C2j2B6yEj1toG2Cs=
=FFb/
-----END PGP SIGNATURE-----

--bFsKbPszpzYNtEU6--
