Return-Path: <SRS0=rsGL=QP=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66A91C169C4
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  8 Feb 2019 21:30:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 34DE1218DA
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  8 Feb 2019 21:30:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727166AbfBHVal (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 8 Feb 2019 16:30:41 -0500
Received: from sauhun.de ([88.99.104.3]:59860 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726949AbfBHVak (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Feb 2019 16:30:40 -0500
Received: from localhost (p54B331AB.dip0.t-ipconnect.de [84.179.49.171])
        by pokefinder.org (Postfix) with ESMTPSA id 3ADC72C282F;
        Fri,  8 Feb 2019 22:30:39 +0100 (CET)
Date:   Fri, 8 Feb 2019 22:30:38 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v2] i2c: rcar: refactor TCYC handling
Message-ID: <20190208213038.GG12451@kunai>
References: <20190205133725.27688-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="QWpDgw58+k1mSFBj"
Content-Disposition: inline
In-Reply-To: <20190205133725.27688-1-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--QWpDgw58+k1mSFBj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 05, 2019 at 02:37:25PM +0100, Wolfram Sang wrote:
> The latest documentation made it clear that we need to initialize the
> TCYC value independently of DMA. The old code used TCYC06 (wrongly) for
> non-DMA transfers. The new code sets TCYC up independently from DMA.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Wolfram Sang <wsa@the-dreams.de>

Applied to for-next, thanks!


--QWpDgw58+k1mSFBj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlxd9P4ACgkQFA3kzBSg
KbYmaxAAlbSJhXanvkOqAnnB9PGAZAgK9TIxSgE5OOQ7++SFwkEZIPlyh0fCdMPS
GH4jK3alysQfO368/Ss5iWAKm0pKYVz2tvrs1tNmPnGqAEYtiZs2Nu7Lr2pDvjHA
RBNSn/KVZfRnu2qxEwn61f+0oMp1/txukSCqa1gaesV69w3L50et+6ySROzkUikT
b0AJgfLvA2LAZ3dsfAw7XCe+A6sl9bZrgUCD6ga3GXkQv5eGdmbM53pbO0SGTQdj
dg9J0C5IFTyVnd1D/sdvfZc35D+gpGNaT3zeBh1AMhuLWYUCR5LHFwhrmWxLUa4b
LBsM/9y4xdyYJONgLM3M+do5neCzMQaosJpagQtLHTM7ii0tEU0I9pLBD9zaWTRi
y8DQ5cH9h4qUigw+RGOefFram9cahISnW2OiD3PrariJuZiJBV98g4r3x6OnXcmv
t9BjSkiviV1Gy+CgtZakwYfRqlf3XkEkgoM08SEw46c0vgfPNenU7g0iL9viIYmN
RUWhBmA3cx3PMatpJxTFcSoM8PWPXiMKgbYl4EBxMqDDHz6/F5E3B8KxLK2kqMlY
vUdyFI0Fxanzxt2IcBZaqVPWR6mSUG+7biqV/laZjaM5ou3UrKFjuYAQ5DjX25yy
EujqrwGxdemWq6xUR9ll9u9ZfKBbLI8qDutQ2sq+xUGJUNPyTDo=
=DPKj
-----END PGP SIGNATURE-----

--QWpDgw58+k1mSFBj--
