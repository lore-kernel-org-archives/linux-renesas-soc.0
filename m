Return-Path: <SRS0=cYIn=Q6=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 242ACC43381
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 23 Feb 2019 09:37:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E8D5A20684
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 23 Feb 2019 09:37:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725886AbfBWJhA (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sat, 23 Feb 2019 04:37:00 -0500
Received: from sauhun.de ([88.99.104.3]:53618 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725820AbfBWJhA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 23 Feb 2019 04:37:00 -0500
Received: from localhost (p57BC9845.dip0.t-ipconnect.de [87.188.152.69])
        by pokefinder.org (Postfix) with ESMTPSA id 8B2AF2C3312;
        Sat, 23 Feb 2019 10:36:58 +0100 (CET)
Date:   Sat, 23 Feb 2019 10:36:58 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 1/2] i2c: gpio: fault-injector: add 'lose_arbitration'
 injector
Message-ID: <20190223093657.GD1018@kunai>
References: <20190219163946.13559-1-wsa+renesas@sang-engineering.com>
 <20190219163946.13559-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="GyRA7555PLgSTuth"
Content-Disposition: inline
In-Reply-To: <20190219163946.13559-2-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--GyRA7555PLgSTuth
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 19, 2019 at 05:39:45PM +0100, Wolfram Sang wrote:
> Add a fault injector simulating 'arbitration lost' from multi-master
> setups. Read the docs for its usage.
>=20
> A helper function for future fault injectors using SCL interrupts is
> created to achieve this.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-next, thanks!


--GyRA7555PLgSTuth
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlxxFDkACgkQFA3kzBSg
KbYClg/9FytijXZDbuJ5/RTMfdCjKxuorhBZrZ8Fo+xtVuyqNXhioUUMlrLfVy3G
70nR188NQqOsGXC0yOzl86Wx5kfEbyuRrFmIplncWbzMfWw/NT/QYm1Skk9gUkra
dq4vHCs8cYHiALf1y5m0dtgvzPOzKkSxLrjaih1KMzQEhQf1CKRMxWicv8EwjiLo
PpoCFeNlkJ0r44wnivwl8adbuZ+v7sVaEBotzErze9fM13/ZKi7b2FQO3jmi7i8x
M70USwVaRoVX8MHy9ftfUIhuqtoAAe+zzV60Q9nILlpiIbAQQh4mLhTwh9F44zoK
4qOH7/srFvl3iutMVTIZLH2M9CIU9lSlGb3ADq8uJh9sylE0F1BPkVJY2PvovJVB
gDSITxNxARgsIUUo7m4pC01qSSJxTpH47Ll4qO6gomwVb7+55Q07NY7Wcgv5X4ET
o8zmRYO40jx7+bXBG1rPxz86kJcv5OMiH2Oox+pmNs/bthkKwlSGeovbzzWqM74U
CeuoBtMTOtWqjpC8KKEN3PPi0lxEoBM3KmpcObtMsvcjMfed2Z+J+yfqgorKofk5
GIQbFL6tVeNJ8vRdMBkL6qdWDHT/y/bLLVHFdIF8E2j9Ykcgw+YSebxrLMVCH6E/
SjHJxrSVeKbCRKZIAMcWaPtxycBDwwO8f6WomU7xkBv7C02yWJk=
=HnNQ
-----END PGP SIGNATURE-----

--GyRA7555PLgSTuth--
