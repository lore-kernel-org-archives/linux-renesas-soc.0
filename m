Return-Path: <SRS0=FLKL=Q2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_NEOMUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE900C43381
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 19 Feb 2019 13:13:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A2CD52146E
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 19 Feb 2019 13:13:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728369AbfBSNNo (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 19 Feb 2019 08:13:44 -0500
Received: from sauhun.de ([88.99.104.3]:45936 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727246AbfBSNNn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Feb 2019 08:13:43 -0500
Received: from localhost (p54B338D8.dip0.t-ipconnect.de [84.179.56.216])
        by pokefinder.org (Postfix) with ESMTPSA id 7D0CC2CF689;
        Tue, 19 Feb 2019 14:13:41 +0100 (CET)
Date:   Tue, 19 Feb 2019 14:13:38 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Peter Rosin <peda@axentia.se>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 1/2] i2c: gpio: fault-injector: add 'lose_arbitration'
 injector
Message-ID: <20190219131338.buwlfcxdutckpqqc@ninjato>
References: <20190217124126.7257-1-wsa+renesas@sang-engineering.com>
 <20190217124126.7257-2-wsa+renesas@sang-engineering.com>
 <CAMuHMdVLEeJ4i0rZKv8w2bAO5Q7StxqQWEEV611PPMGeE60JHA@mail.gmail.com>
 <20190218204122.j35itmqth3avo3a6@ninjato>
 <a8b62504-49c3-33a7-e8ec-46b253af13b8@axentia.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="dt7r6r2alwa363kc"
Content-Disposition: inline
In-Reply-To: <a8b62504-49c3-33a7-e8ec-46b253af13b8@axentia.se>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--dt7r6r2alwa363kc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> >>> +       ret =3D gpiod_direction_output(priv->scl, 1);
> >>
> >> This may overwrite the error code returned by request_irq().
> >=20
> > Yeah. What do you think about this, is this too dense?
> >=20
> > 	ret =3D gpiod_direction_output(priv->scl, 1) ?: ret;
>=20
> That may also overwrite the error code, of course. Isn't it
> usually best to return the first error? I have no clue if that
> guideline does not apply here, though...

I am neither entirely sure here. My take was that the above was the more
severe error. Because if setting to output fails, the GPIO I2C bus will
be broken. If the former stuff fails, well, the injection didn't work or
was interrupted.

However, the GPIO was set to output before the injector. So, if setting
it back fails, then the system likely has more severe problems anyhow?

I am open to any better solution. However, let's not forget, this is
debug code aimed to be used by devs.


--dt7r6r2alwa363kc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlxsAP0ACgkQFA3kzBSg
KbZoiA/9EGaHZDHeJUNSMoHH3eZ7uA0drqPGJUtdZTrPUgNRvLTbsuI5fjQwL5b4
9XbTtPCMFjQ65qBdNwh2ZyQDGJYFVbgfveigYFFMJIP9tSvZy0ev7yrb0E2gac/N
mAYr0LIzs7NbMzMblyL1imUWs/NRKBwSBrFrn2i8K0mitF+JTn1AEjNbhILr8ncK
DvjhX3paMzAe8zRtaEA5agtTLc7qQ1ERGh4rMbMA6CzUsKgSBdXhDHeWmNej1Mni
70BWSBSZlSNyKz2RfhGcGxd/CdKwxGdnlxjLC38rtTQV9iHlfJzLDTk0skU6upsH
4wB+xVB1vKriMsW4G+iPjCI8zkLrSb0sVJPBoF9CUD4I02aJ3re3KAfp3LXko5lh
GQ+dahLW4bknkDCV90IOMMuhICmfpa+2L4G7BvgfW4ks4/+gFEktsvb+TCkKX5GR
Uc9h+u7x34NFBI0TF7ZpurjdHW0uV7562sjT5GPXPONr+3aPtPad7PN2lLsXWd0T
bFjHt9zAanBj1s3872vsrnaLy2WGLc0gFRamzGnSAnKS68TMtr9IKnKEFIoVVtOg
UAhjCIpC/HCXrozAdykKmgFeAfkeHNb4hzX/BiiLUOgBrD05GYKD/okWdRATBpvs
Sj87P9XaPS4YHDg0WHqPbfUG9HagP//jeHvz8tGZxe5OTa0LgWo=
=LYgq
-----END PGP SIGNATURE-----

--dt7r6r2alwa363kc--
