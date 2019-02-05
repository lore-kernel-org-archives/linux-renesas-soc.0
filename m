Return-Path: <SRS0=SaFT=QM=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE19EC282CB
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  5 Feb 2019 13:33:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8BC4920844
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  5 Feb 2019 13:33:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728139AbfBENd6 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 5 Feb 2019 08:33:58 -0500
Received: from sauhun.de ([88.99.104.3]:57652 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726558AbfBENd6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Feb 2019 08:33:58 -0500
Received: from localhost (unknown [46.183.103.8])
        by pokefinder.org (Postfix) with ESMTPSA id BE93A2C0509;
        Tue,  5 Feb 2019 14:33:42 +0100 (CET)
Date:   Tue, 5 Feb 2019 14:33:31 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] i2c: rcar: comment maintenance
Message-ID: <20190205133328.GI12401@kunai>
References: <20190121170800.21144-1-wsa+renesas@sang-engineering.com>
 <20190121170800.21144-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="X+nYw8KZ/oNxZ8JS"
Content-Disposition: inline
In-Reply-To: <20190121170800.21144-2-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--X+nYw8KZ/oNxZ8JS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 21, 2019 at 06:07:59PM +0100, Wolfram Sang wrote:
> Update copyright years and remove a comment which grew incorrect and
> useless over time.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-next, thanks!


--X+nYw8KZ/oNxZ8JS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlxZkKgACgkQFA3kzBSg
KbaiHg//RwVvgORYjmL8VR4DaPpEiyIkd3//ImSA6QjLdFuUKIDaQ4OcSm3r/Wxg
vul/rQjjsc9s7tWnsHn/x1MujWGofddAgkgnZA7cfSC5cnQQk1L4SVfb0jvyH9ml
H07PuQq5gItEXaxRb9++G64yArYDe9W51xsokFgcj2wIut0rHmcDl4T2aGF438oM
+df1HQhos2CMXupLdaygEp3IAEWqAeq3s3OASLOUDXUqeXm3w5UlnRtbXtJuFtdS
W20wziRpSWe4YHUe1roIxkkuh6i7Ymz6sHJ6HGDxNY8PsZfyAiLFTmVE4DWzBvI0
T6lIqNN6vqqMter5r+ByGHk1LDDUoJSeG8sC6A9V5EHt4v4fsMj0WhnCb1OQjh+r
rTZuXNKy7pRCr1AtGxQacsSKJiTETk/Lj6cS4yj9AkZ0Nhczd1Akf4ob/Ox6BLTo
3gkIyQDVY6QJj5KHhSjC8MPU4l8l95iTWBHyBsKcKW0EaMhWuCbrMIBf7577AfRW
Ia94XVGqDKTAmEtOw9bYcNI8ZKJshZZAsh3RuIOBb9+fLb+hJlHgj1g86g0AylXF
UGyz2RzDr1cJzf8O3ps/BzKc51psMBQwj4Cfr4bnZ2lWyKygtX2dvy5xkcPSdkLF
1TfnrJ7ok+SQg49+iYx3KP3B5tglJaBRC2A+3NdoSafnmXJsgEI=
=tDon
-----END PGP SIGNATURE-----

--X+nYw8KZ/oNxZ8JS--
