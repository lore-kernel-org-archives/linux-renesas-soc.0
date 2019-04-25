Return-Path: <SRS0=Fsko=S3=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_NEOMUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95622C43218
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 25 Apr 2019 13:50:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 70400206C1
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 25 Apr 2019 13:50:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727588AbfDYNuJ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 25 Apr 2019 09:50:09 -0400
Received: from sauhun.de ([88.99.104.3]:45408 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726863AbfDYNuJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 25 Apr 2019 09:50:09 -0400
Received: from localhost (p5486CE26.dip0.t-ipconnect.de [84.134.206.38])
        by pokefinder.org (Postfix) with ESMTPSA id E446F2CF687;
        Thu, 25 Apr 2019 15:50:06 +0200 (CEST)
Date:   Thu, 25 Apr 2019 15:50:06 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Peter Rosin <peda@axentia.se>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] i2c: core: ratelimit 'transfer when suspended' errors
Message-ID: <20190425135006.3f6upe5tribls7wq@ninjato>
References: <20190425082310.17109-1-wsa+renesas@sang-engineering.com>
 <52b22d2a-d6b5-8443-a4d9-08c8c5381deb@axentia.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="e4ec264s4v4snwwx"
Content-Disposition: inline
In-Reply-To: <52b22d2a-d6b5-8443-a4d9-08c8c5381deb@axentia.se>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--e4ec264s4v4snwwx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Am I missing something, or do we need to add an -ESHUTDOWN test
> to i2c-core-smbus.c:__i2c_smbus_xfer()?

I think you are right, SMBus was simply missed. I will refactor the
check to an inline function and apply it to I2C and SMBus. Thanks for
the heads up!


--e4ec264s4v4snwwx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlzBuwoACgkQFA3kzBSg
KbY++hAAsh4NfBATRt06UlQy3fAPb02P2s/kUDGMBJPLt8mYT6/wMFx2hhyxDXJZ
kyYvPWruuoaKNbI3rB6BvIw27FdZ/sEO+jvwwhE13ctSjxpo1qJKY+IiHc7l3N+A
7WdKbaCwE1vqbodcgCA98EltxCxbsQNbqgYSe80/dS3X8LzQ5gFy+zvfQ8dwOXRn
2N0tLZi+XrmCAaqwnmMT+hEvwzeiSTCcqsd+e0YXBPC4bj2i3F1ySp/2rcQbgPMc
Zg9PIOOt1LKQkHWq/stjgU63aX7urkTn5OVjRw6w91DX/BhtFNTFHHVGO1HLPIvD
qGTLkjsT2mev+ON+S7ugXO8TShMyXMSYJNCLk07J3TdMDjUBMdB3pzDHLwm+/tAJ
c+K0+Qc2lyxQgdFOXyc94n4GlYwORNRw+htU1DsAgG3rG3v6EKnkIBgpDCgJoUzI
qUmclpOKsUlAbnpPieYDtcD3jQxEaXtKd1MkZ/R3yn/ZmA8vsjcuRzAPOAMHxXK3
JZao28h7aIiz4KExLOIneS1nU5iw5N7V51QP/l/Q18gmFULqeuap1w6EFSUBv87m
7W1Kh3f+xDGsElHOnrL20YPTQRT699KspjgNRw/lrjEIUtyEzAtVT1ueXFFZWExm
ZPBaV22DuFg3eC2bBdPhn7O0ygakMh2+odNmd80k9n+PQ78ZYlA=
=Ouuw
-----END PGP SIGNATURE-----

--e4ec264s4v4snwwx--
