Return-Path: <SRS0=QNR1=P6=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_NEOMUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B956C282C3
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 22 Jan 2019 23:02:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CC5D621726
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 22 Jan 2019 23:02:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726735AbfAVXCt (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 22 Jan 2019 18:02:49 -0500
Received: from sauhun.de ([88.99.104.3]:56710 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726175AbfAVXCt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Jan 2019 18:02:49 -0500
Received: from localhost (p54B333AA.dip0.t-ipconnect.de [84.179.51.170])
        by pokefinder.org (Postfix) with ESMTPSA id 51A592C78FF;
        Wed, 23 Jan 2019 00:02:47 +0100 (CET)
Date:   Wed, 23 Jan 2019 00:02:46 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] i2c: rcar: Fix clients using i2c from suspend callback
Message-ID: <20190122230246.sg7i7wugcgpuijhw@ninjato>
References: <20190122100357.11712-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="prfv4qz7vozphtim"
Content-Disposition: inline
In-Reply-To: <20190122100357.11712-1-geert+renesas@glider.be>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--prfv4qz7vozphtim
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 22, 2019 at 11:03:57AM +0100, Geert Uytterhoeven wrote:

[...]

> On second resume, the sound driver fails with:
>=20
>     cs2000-cp 2-004f: pll lock failed
>     rcar_sound ec500000.sound: can't use clk 1
>=20
> As the CS2000 clock driver needs to send I2C messages during suspend,
> the I2C controller driver should be suspended later, and resumed
> earlier.  Fix this by using the noirq sleep ops instead of the normal
> sleep ops, which are called after the late sleep ops, as used by the
> CS2000 clock driver.
>=20
> Fixes: 18569fa89a4db9ed ("i2c: rcar: add suspend/resume support")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> The various I2C drivers seem to use a mix of normal, late, and noirq
> sleep ops.
>=20
> For this particular use case, both the late and noirq sleep ops work,
> but that may depend on link order.
>=20
> Given the comment about wake-up sources in commit 57186fe3db3ec462
> ("i2c: exynos5: Properly use the "noirq" variants of suspend/resume"),
> perhaps all of them should use SET_NOIRQ_SYSTEM_SLEEP_PM_OPS() instead?

Likely.

My plan is to first deal with the issues how to do I2C when irqs are
already disabled. Once this is in place as an exception for justified
cases, I think we can deal with the other devices; so every special user
gets the proper treatment and we are still able to WARN about devices
doing I2C transfers when they shouldn't do it.

All that being said:

Applied to for-next, thanks!


--prfv4qz7vozphtim
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlxHoRYACgkQFA3kzBSg
Kbahrg//a8xZgjlI8kcC1zGUxLomvxur7udLaXbH6eAE0Af4hQ9+1jWsOVr4lhOK
VKv0DIPi4qmiPsN6hn/TTE2Mjp8CN8xgOcnuIugOSY2m8ERDvwUHgt3fIJi4A/sV
HdBDxz7xwvukrUBs47V/JOJ3uK+kng1YU9+BApdHMxu8vtrDK8rIKZZnId4ahxDf
W8WQivCJKcyghw3AwGWOZVMqE1fFtOwDT24wwB3fV7G11O0rD3hCzOFUhERg8AEV
nxG+xofwmjHTTKtaimZV6z56se33H2SKI26ct43nTabKuLs2ydck1g1Qz3EeTVuS
743yCDw+NhwNLYXVdBKHJcOW3ocbSRK+7j/6VTjTzG2AzVP8WTB2GZrL+Hrd1Ws/
aFA2FLHbJbSkwTfE2/7bnD1P0AdQVARcI6V2Do4zppKMbKAlh73JjSXHRhfQzI+u
hYg8pNkABWgfE5zBNJ8DVSMj2NQg07xaK9TytEyp1CZpig/6R08Lht/HV2QE0+ig
BekkAvtFxUApq3uUyHcO11yLOgwORfQP6VqiFB/m+GJ5UmoCVdNVKCZCreVIMwMz
y6QjkaalFkCdIwaETIsQOoHEWaXyr51H9OCY/nGObk40hliI5mxqPuZfT7ctBBjm
6NAo55OCiiRbRDGQftqREm1be+zX6aeoCi5daU16UUGLdFIE/Fw=
=iiEl
-----END PGP SIGNATURE-----

--prfv4qz7vozphtim--
