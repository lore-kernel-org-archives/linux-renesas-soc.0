Return-Path: <SRS0=uGqO=RM=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 858BCC43381
	for <linux-renesas-soc@archiver.kernel.org>; Sat,  9 Mar 2019 10:10:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4A6C420851
	for <linux-renesas-soc@archiver.kernel.org>; Sat,  9 Mar 2019 10:10:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726235AbfCIKKc (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sat, 9 Mar 2019 05:10:32 -0500
Received: from sauhun.de ([88.99.104.3]:40184 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726164AbfCIKKc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 9 Mar 2019 05:10:32 -0500
Received: from localhost (p5486CD1C.dip0.t-ipconnect.de [84.134.205.28])
        by pokefinder.org (Postfix) with ESMTPSA id 7F5372E3551;
        Sat,  9 Mar 2019 11:10:30 +0100 (CET)
Date:   Sat, 9 Mar 2019 11:10:30 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
Subject: Re: [PATCH 1/2] i2c: rcar: fix concurrency issue related to ICDMAER
Message-ID: <20190309101030.GF1340@kunai>
References: <20190303150314.6528-1-wsa+renesas@sang-engineering.com>
 <20190303150314.6528-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="b8GWCKCLzrXbuNet"
Content-Disposition: inline
In-Reply-To: <20190303150314.6528-2-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--b8GWCKCLzrXbuNet
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 03, 2019 at 04:03:13PM +0100, Wolfram Sang wrote:
> From: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
>=20
> This patch fixes the problem that an interrupt may set up a new I2C
> message and the DMA callback overwrites this setup.
>=20
> By disabling the DMA Enable Register(ICDMAER), rcar_i2c_dma_unmap()
> enables interrupts for register settings (such as Master Control
> Register(ICMCR)) and advances the I2C transfer sequence.
>=20
> If an interrupt occurs immediately after ICDMAER is disabled, the
> callback handler later continues and overwrites the previous settings
> from the interrupt. So, disable ICDMAER at the end of the callback to
> ensure other interrupts are masked until then.
>=20
> Note that this driver needs to work lock-free because there are IP cores
> with a HW race condition which prevent us from using a spinlock in the
> interrupt handler.
>=20
> Reproduction test:
> 1. Add udelay(1) after disabling ICDMAER. (It is expected to
> generate an interrupt of rcar_i2c_irq())
>=20
>     void rcar_i2c_dma_unmap(struct rcar_i2c_priv *priv)
>     {
>         ...
>         rcar_i2c_write(priv, ICDMAER, 0);
>         udelay(1);                        <-- Add this line
>         ...
>         priv->dma_direction =3D DMA_NONE;
>     }
>=20
> 2. Execute DMA transfer.
> Performs DMA transfer of read or write. In the sample, write was used.
>=20
>  $ i2cset -y -f 4 0x6a 0x01 0x01 0x02 0x03 0x04 0x05 0x06 0x07 0x08 i
>=20
> 3. A log message of BUG_ON() will be displayed.
>=20
> Signed-off-by: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Updated the test case, added a note about all this to the comment and
applied to for-current, thanks!


--b8GWCKCLzrXbuNet
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlyDkRUACgkQFA3kzBSg
KbZBaA/5AQWHKt37wKkCwcqPItwFOAf14P4PRANGLm/DvxqRdUhHHgjETVSht6bi
smvSPcmf3o75dn0uBw62+TQnVo2JqQnuGqA9M9bAKT7mQz7UlQdW4Htfdd0kc5Rf
FgsbbzUkrbj/9ecrKIrZnepR13NJSqTL/JzrIhzm0dR/K2NVELJXYoYRP9ktCNFs
Xr4tpSRmn8aZfcUg9fbCM7d76tv3IBrUQt/jCox9J+xReofogi9THUAlDN25qLIo
rG4OMp+D4kfCyR1n5brPi3vurnasbz7gg2P8nnDUPGDrY/MDSTVzBch9AqcIugjh
rfObiCInIWMSCygz3IlwFEJqXUCgy9Vasw9ZNehl6lyhtuu47zVAjrcUjBnewH8X
Ua2weHQlsku+s5tKalZdZ69hYghhZosDDL0l8Xqp/2S4Y7a4xFmtrenDebL2rCMg
d7kjw6QIW+QoYwQUPrJeLV6vD3vWxWE82RwyHTQzCYWaOyFs4E+JNVrnsztMfwaa
Ugap1enD9Q01ERhiW4OYqnefuCpdLDlezvEcpwCTkYbAO84ZGyPBC2A893Kl4M0z
h9ZXJ6P5OcHqduNRF17czBHT4O9KnHNVjrYHxRi3MEy4rCBIElLhyVjLw/oj8fQs
YFGwNnl3c0Gg7q0bvBIiGX/uzKa3/vDFwNOeeHceuNL9mW90EJs=
=9NDq
-----END PGP SIGNATURE-----

--b8GWCKCLzrXbuNet--
