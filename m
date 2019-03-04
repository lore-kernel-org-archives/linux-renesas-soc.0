Return-Path: <SRS0=YxuQ=RH=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_NEOMUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C9C7C43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  4 Mar 2019 22:27:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E555020823
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  4 Mar 2019 22:27:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726088AbfCDW1z (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 4 Mar 2019 17:27:55 -0500
Received: from sauhun.de ([88.99.104.3]:57408 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726076AbfCDW1z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Mar 2019 17:27:55 -0500
Received: from localhost (p54B337B5.dip0.t-ipconnect.de [84.179.55.181])
        by pokefinder.org (Postfix) with ESMTPSA id 657F22C3637;
        Mon,  4 Mar 2019 23:27:52 +0100 (CET)
Date:   Mon, 4 Mar 2019 23:27:49 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
Subject: Re: [PATCH 1/2] i2c: rcar: fix concurrency issue related to ICDMAER
Message-ID: <20190304222749.srrttj3hnsyf2cot@ninjato>
References: <20190303150314.6528-1-wsa+renesas@sang-engineering.com>
 <20190303150314.6528-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="pa7a6djvo2nbhuao"
Content-Disposition: inline
In-Reply-To: <20190303150314.6528-2-wsa+renesas@sang-engineering.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--pa7a6djvo2nbhuao
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> Reproduction test:
> 1. Add udelay(1) after disabling ICDMAER. (It is expected to
> generate an interrupt of rcar_i2c_irq())
>=20
>     void rcar_i2c_dma_unmap(struct rcar_i2c_priv *priv)
>     {
>         ...
>         rcar_i2c_write(priv, ICDMAER, 0);
>         udelay(1);                        <-- Add this line

For the record (and self-documentation): I needed to increase the delay
and was using usleep_range(500, 800) in the end.

>         ...
>         priv->dma_direction =3D DMA_NONE;
>     }
>=20
> 2. Execute DMA transfer.
> Performs DMA transfer of read or write. In the sample, write was used.
>=20
>  $ i2cset -y -f 4 0x6a 0x01 0x01 0x02 0x03 0x04 0x05 0x06 0x07 0x08 i

And I used this command instead to make sure another message is waiting:

$ i2ctransfer -y 4 w9@0x6a 1 1+ r16

Yet, in general, I could reproduce that this patch fixes the issue, so
all is fine, I think.


--pa7a6djvo2nbhuao
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlx9pmEACgkQFA3kzBSg
KbYx9g/+MUuzM+g3j3R2fl/xtUprB8BJy1FcMnD2inGwZhPsybZRlote0Qehm6Oo
RKwPjPRE4kL+uvlXAxdJoeC0jNkLZeoDa5sUFc/T3kP9kK0jr9iRKcIjrxNWDGSa
MXUPefxcrkeEl/PkRByHuFT+XSTqOWGe2C4iS2FVw3Qo2qj2RuSsgEtKqWGd3XmU
FatWV3TmOrbn3RO8i2SQpPmo618QZMMx4/RZruwTODeMsYcBAPLO5oIIUFZNOYQ1
1+jLf3AW31kt761f37FvLynOLefWk7fb++gllBs8M84bHXfLOymFFf6JC8/ZB0ny
rllilfW5l9d2qitO29c+rPjgCkZzpStRyiVxTl48EvLpeJALK6XE9AXxrep8RhbG
vAJ5VcMhv/IDfE6hXVuY5DFKgVIX9uIYhA1FsaudZrfjqLyhT1ew+uBpvjFIodJb
nLyeH3PQxR/7VQ/iUuEhhsiQQs343TQ2QAUHeHlTJhQo3qc3/iQYLhEUbf8EZSvH
GnhIX3h59Lx33b/rfKYBlR4QOkAOrveqn9JOVPCgp2tsTT/AL3ZI6XHgzivRN7Io
fBvcTDnUPEjOV12b48DVlCfgv1vs3cI2h+BCj1B7pUw4ILvvRGgKFvx6oW8UDL17
hggp8I7QRowMqeKFP6PduLeGh2gqmCqdqOmo6hVO7qWek9BuxIk=
=oUdc
-----END PGP SIGNATURE-----

--pa7a6djvo2nbhuao--
