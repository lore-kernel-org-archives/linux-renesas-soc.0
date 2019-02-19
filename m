Return-Path: <SRS0=FLKL=Q2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_NEOMUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10098C43381
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 19 Feb 2019 17:06:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D9A4F2147A
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 19 Feb 2019 17:06:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727149AbfBSRG6 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 19 Feb 2019 12:06:58 -0500
Received: from sauhun.de ([88.99.104.3]:47884 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726110AbfBSRG6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Feb 2019 12:06:58 -0500
Received: from localhost (p54B338D8.dip0.t-ipconnect.de [84.179.56.216])
        by pokefinder.org (Postfix) with ESMTPSA id 1F3282CF689;
        Tue, 19 Feb 2019 18:06:56 +0100 (CET)
Date:   Tue, 19 Feb 2019 18:06:55 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc:     linux-mmc@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3] mmc: tmio_mmc_core: don't claim spurious interrupts
Message-ID: <20190219170655.eqwyny3hdavm5hsm@ninjato>
References: <7e293159-0ae3-82fb-2723-04e91d652906@cogentembedded.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="3sdpcl37sjccbeyj"
Content-Disposition: inline
In-Reply-To: <7e293159-0ae3-82fb-2723-04e91d652906@cogentembedded.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--3sdpcl37sjccbeyj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 18, 2019 at 08:45:40PM +0300, Sergei Shtylyov wrote:
> I have encountered an interrupt storm during the eMMC chip probing (and
> the chip finally didn't get detected).  It turned out that U-Boot left
> the DMAC interrupts enabled while the Linux driver  didn't use those.
> The SDHI driver's interrupt handler somehow assumes that, even if an
> SDIO interrupt didn't happen, it should return IRQ_HANDLED.  I think
> that if none of the enabled interrupts happened and got handled, we
> should return IRQ_NONE -- that way the kernel IRQ code recoginizes
> a spurious interrupt and masks it off pretty quickly...
>=20
> Fixes: 7729c7a232a9 ("mmc: tmio: Provide separate interrupt handlers")
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Tested on a Lager board (R-Car H2, microSD card) -> no regressions
Also, Salvator-XS (R-Car M3N, SDR50 SDIO WIFI card)
  -> could still be detected

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--3sdpcl37sjccbeyj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlxsN6oACgkQFA3kzBSg
Kba+fw//f/XW+yNL7Brk5vr9Dpo0tbvKHWOqxZhKz4XWFe/vp/1uZAGGXiEmiL0e
HGFzK8twJejwFDXpVlstMtHgRvl6ZaULLlEb+2xvnrgR3QQuBuLJkhs+IQaL8Sdj
M1Ob1Jj0EAgwQJwT99QuMK0IfrHnJZ/nz6oeETznOdrfLV66xPZpYxySXXOkOia/
eCA0sUfcOP3jUo6YuiSLqqab6gPfM9cRIbA+YEWK1bj5MA5wknbxvdi3lNDZCDz7
Au3aX7JrAsvLTjhBJRN6cLP5EFRtaFUjugEH6fouQUWywnd0dBG4qIL/2tbP1mZ3
NRTTAoEjCk4vvldi6pZudKHA6QRh1OuS+W5MAcRdNe6JA4ArQqDQAFQaqvXhlV1c
irsPnbPI5lI32rAXwqowfJvKWKK/OsrYFnMg4orq5Jf6F/0eWFkLb0Ws1qSUUfdS
Xm7+gvGOv4uH7HcKHjogcLZpN5iRg0YOBbUAZMiG9IEQdImk1TLew2mK0eiLFccG
CLZzzXkEj6B/Jpgv7OA4IMpFCZeJhY1fSsvjaSVg6qY8e/OCCtEMovDeVOy2b2VD
1XKDEXNA0FhtWywfRWTAPRBiEp7Saq7QDDEHAFSu86BYxKUlY5/D6IrsZUkvbBJn
WlliTTYgpb0v2cP/oFBqk8jKKW8yjGVzS1cA8qyjfAl6S2EiB0c=
=KViB
-----END PGP SIGNATURE-----

--3sdpcl37sjccbeyj--
