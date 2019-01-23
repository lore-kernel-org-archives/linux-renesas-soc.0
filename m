Return-Path: <SRS0=9OK0=P7=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B921C282C0
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 23 Jan 2019 17:39:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6E45B21019
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 23 Jan 2019 17:39:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725996AbfAWRj3 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 23 Jan 2019 12:39:29 -0500
Received: from sauhun.de ([88.99.104.3]:35136 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726335AbfAWRj3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Jan 2019 12:39:29 -0500
Received: from localhost (p54B3320B.dip0.t-ipconnect.de [84.179.50.11])
        by pokefinder.org (Postfix) with ESMTPSA id 2D8BB2C54BC;
        Wed, 23 Jan 2019 18:39:27 +0100 (CET)
Date:   Wed, 23 Jan 2019 18:39:26 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Simon Horman <horms@verge.net.au>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/2] i2c: rcar: refactor TCYC handling
Message-ID: <20190123173926.GA956@kunai>
References: <20190121170800.21144-1-wsa+renesas@sang-engineering.com>
 <20190121170800.21144-3-wsa+renesas@sang-engineering.com>
 <20190123102506.hi6tvyby5f4wbaho@verge.net.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="jRHKVT23PllUwdXP"
Content-Disposition: inline
In-Reply-To: <20190123102506.hi6tvyby5f4wbaho@verge.net.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--jRHKVT23PllUwdXP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 23, 2019 at 11:25:06AM +0100, Simon Horman wrote:
> On Mon, Jan 21, 2019 at 06:08:00PM +0100, Wolfram Sang wrote:
> > The latest documentation made it clear that we need to initialize the
> > TCYC value independently of DMA. Simplify the code to do that.
>=20
> Hi Wolfram,
>=20
> I see TCYC bit 6 is no longer used after this patch.
> Does that warrant a mention in the changelog?

Do you think so? The old code used TCYC06 (wrongly) for non-DMA transfers.
The new code sets TCYC up "independently from DMA" <- commit message.


--jRHKVT23PllUwdXP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlxIpsoACgkQFA3kzBSg
KbaE2Q/+NG/ggy2l1IJGDofZLNJ89Ezck0XAuhk5CcNOqWqOL/OvzFOoilQxoAao
G9/Sp/8pPWUw2OnW2Th8n5wVXU4EhNuMJhMpBWuiqIW4d2L4ejHTtWfAteb+j7SK
3kkr915rIVBjEMwL9goV1d4dGQQomego66vEsvOtfJJhq3/eC6uI5kp/auxIoYiO
4PDLVj/PAd77iAsdNBK5M/o7yxeHhAGLomFn26YkPDP9dlTDLI80R3o0iQl7oKwl
0/VrwZTfE/DEaEAbE9c7pFYHPA6jAnNkVyqi7dSCwEwMUS+ABv+89WvVtV0BvAUK
GH2q0K8sT14QrcS8wwKL7+C8VXpkciX/zrpoVn4A6mL3ifwyO3bYg4FD1MxH2Pa6
8Zg1UIVPi8mlcfYZFSRsmvVKbVD8l/YrA+K0zhN1NMHfg8ElSAIjPd7XKiT1n4K9
gc+R6wrM54Gy1nov4YXvcKDJF3xR6Voq1a4FR9ctrIPWJTEQ9fPpJ8udI0f3Ij8l
7HdaBl7HE1y4K52LTNYgyFekiW2NyadEFiF8i90c034dQrYhmrGe4fOvwR+OmvmK
CAeLLd7Q/gmv4u+QAXhOC9orozQwX9Qt1tnjra/BIeIUkCLNF8H5dMy3DdTbiI/z
FuBG/wesG+rkETciG85RlNMBO6M3lEnW4qZI5IRs+Ofp2Y50wC8=
=xCXC
-----END PGP SIGNATURE-----

--jRHKVT23PllUwdXP--
