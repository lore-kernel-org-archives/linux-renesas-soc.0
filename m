Return-Path: <SRS0=RXSY=2V=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E368DC2D0C2
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 31 Dec 2019 16:27:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AE909206D9
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 31 Dec 2019 16:27:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727056AbfLaQ15 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 31 Dec 2019 11:27:57 -0500
Received: from sauhun.de ([88.99.104.3]:51772 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726060AbfLaQ15 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 31 Dec 2019 11:27:57 -0500
Received: from localhost (p5486C426.dip0.t-ipconnect.de [84.134.196.38])
        by pokefinder.org (Postfix) with ESMTPSA id DAAE52C04EC;
        Tue, 31 Dec 2019 17:27:54 +0100 (CET)
Date:   Tue, 31 Dec 2019 17:27:51 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Kieran Bingham <kieran@ksquared.org.uk>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Vladimir Zapolskiy <vz@mleia.com>
Subject: Re: [RFC PATCH 0/5] i2c: implement mechanism to retrieve an alias
 device
Message-ID: <20191231162751.65o3fv47xahw5hyk@katana>
References: <20191231161400.1688-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="fev4q57wgq2w35tj"
Content-Disposition: inline
In-Reply-To: <20191231161400.1688-1-wsa+renesas@sang-engineering.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--fev4q57wgq2w35tj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Anyhow, I hope this series is useful to you and will spawn fruitful
> discussion.

A branch is here (it depends on i2c/for-next):

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c_alias_device

and buildbot is happy, too.


--fev4q57wgq2w35tj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl4LdwAACgkQFA3kzBSg
KbZcmA//U8ySTg4ta5gcVIQK5vkyYCpuqdTzdZgqxUDcDVMycYryZgGl5L1ND69+
O3YI3+WMwWa1uXoasAv/+M1nzaoCViX78d1usoZ/OhmYdluRnEqvUqU5PVpFv3Ik
dIyN9lhWSKva+p1JMNDb6tEa6EeN3v6I0k4CPmhnsbh/eLAX48JgKL4QdX+JoXhE
NfBLLryAHSioAzbYjeUgKrvNWeOw9cl9jzK/WQvVeTXFFeZX24NaKus1Hk0c9iBx
1/qsIvS3mKFXsgc9sxWj3mEvNZqMPDhheFUBJPm1sFfle5VbmgULmyl37op4RbMm
rbIhyVN7L2uf8P1I3lTly3ebPQ4HihMbQCsjLHWBEs5OoHPmLRSAekpR5xe6w7rP
CKNOZzH6KgcQPhOfJwtfu4OfEd1QJub2aznZQTQwfkGPAQ71c03pqxaYo2nWTkkT
oZPaIBdaEGUyzHmKCgqgdbLFcZy3Jx/lg8SrgOke9/tTqe/CHibo6DnKRQTEyJL1
qbxOO5hX6QFu34ZblG6CuRnYXRXVa2Xxtgiqc6zqnbV5xvIlSqzTgyvQEoSL3SEy
a13CVO7Y+v24SWpGsBCvnao8bcUWVlhrfx+kYVpnLcaszoN09HGuWq0xgjjCjNiQ
OqAnRwHUHzozBby2dloVOosEnzOwdCo+ZCooQmqSPtGn3pVvNVE=
=0z1N
-----END PGP SIGNATURE-----

--fev4q57wgq2w35tj--
