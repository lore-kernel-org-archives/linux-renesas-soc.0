Return-Path: <SRS0=PMmv=P3=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C903BC61CE8
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 19 Jan 2019 22:22:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 89B962086A
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 19 Jan 2019 22:22:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729622AbfASWWY (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sat, 19 Jan 2019 17:22:24 -0500
Received: from sauhun.de ([88.99.104.3]:59584 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729618AbfASWWY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 19 Jan 2019 17:22:24 -0500
Received: from localhost (p54B33180.dip0.t-ipconnect.de [84.179.49.128])
        by pokefinder.org (Postfix) with ESMTPSA id EE0A02D1FE5;
        Sat, 19 Jan 2019 23:22:21 +0100 (CET)
Date:   Sat, 19 Jan 2019 23:22:20 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Simon Horman <horms+renesas@verge.net.au>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH v2] arm64: dts: renesas: r8a77990: ebisu: Enable HS400 of
 SDHI3
Message-ID: <20190119222220.GA7266@kunai>
References: <20190118122536.20000-1-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="bp/iNruPH9dso1Pn"
Content-Disposition: inline
In-Reply-To: <20190118122536.20000-1-horms+renesas@verge.net.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--bp/iNruPH9dso1Pn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 18, 2019 at 01:25:36PM +0100, Simon Horman wrote:
> Enable HS400 of SDHI3 using the corresponding DT property.
> No further changes are required.
>=20
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

We might need to find an explanation for the performance numbers,
nontheless this patch is correct.


--bp/iNruPH9dso1Pn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlxDoxgACgkQFA3kzBSg
KbbFWA//T0Puj8hckN5w+zqBJH5lX5Dx4jiNvPxEghTOPIVnV8KWgVujeippdr+e
SurEU8ZotvQjN1+JoK2UkVe8Wh8kR4sRaq6LOOf2uQjeardDkChaliW7KIMDnTJe
89oboU6sc4UZ3zIM1EZ4kJZxJI2bmuSle0qNPIE0RC6ccsmTD/QHtIhi/l2jWuK8
U3s0X1QZbCzy6p8HxJtyk0/VSxiSKW1hzvQbafLeIoSFovn1wXyXmIPg9x4+G+G0
L1nD2GKwpsd96Pt1r28o1hrIhIwGF4uIlkoifwLkyZlZdDMEkx/cxAhwj7OSxcoX
EFfdfHNiLAq/TJyzQP3svI1qNn/5IzF/HuuzRLfHIa4tNxF2L+VHQkQqfMpreRoI
NDFIpbAXR2FcCZ5rW7LG59cBEBOda99UjO3v15MPR5+FBJpIZ1DmJtLJi+C+iKZj
QvsNkTUdsHdo4V/G0E2HyTYKOVSpg4w5lmQHRRKRdHr4ffnfnNt7eDa2x5UuaAdH
mKsNG9EUvF5MsP5n9ZgPQQUhKVKSMQZU3X1jpfjY/DflgqVeTEuqd1AwkQSL6Wan
ohNF3DSM69XP9MxFZidPiQ71ftwQoTFDfnHKmYtUBp8yDeQ53cJO/BTh7HskB9yE
xf7GM6AJqHXHz/KJO84OrEKYmJ0H3rwDn7b2UgqiHaX41BkH9/k=
=nYFY
-----END PGP SIGNATURE-----

--bp/iNruPH9dso1Pn--
