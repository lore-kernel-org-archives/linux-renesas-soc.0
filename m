Return-Path: <SRS0=YxuQ=RH=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73C54C43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  4 Mar 2019 10:57:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4D40C206B8
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  4 Mar 2019 10:57:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726091AbfCDK5I (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 4 Mar 2019 05:57:08 -0500
Received: from sauhun.de ([88.99.104.3]:52868 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726079AbfCDK5I (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Mar 2019 05:57:08 -0500
Received: from localhost (p54B337B5.dip0.t-ipconnect.de [84.179.55.181])
        by pokefinder.org (Postfix) with ESMTPSA id 5B37C2C3637;
        Mon,  4 Mar 2019 11:57:06 +0100 (CET)
Date:   Mon, 4 Mar 2019 11:57:05 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Marek Vasut <marek.vasut@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH] ARM: dts: alt: Add DA9063 PMIC node
Message-ID: <20190304105705.GA1000@kunai>
References: <20190303190059.31155-1-marek.vasut@gmail.com>
 <CAMuHMdWStD+on70-e1p0SXbe2igNJxDM1RzeYsdXW+80SA9+sw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="9amGYk9869ThD9tj"
Content-Disposition: inline
In-Reply-To: <CAMuHMdWStD+on70-e1p0SXbe2igNJxDM1RzeYsdXW+80SA9+sw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--9amGYk9869ThD9tj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Add DA9063 PMIC node to the I2C bus.
> >
> > Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
>=20
> Thanks for your patch!
>=20
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks for CCing me, I didn't get and missed the original patch.

> > +++ b/arch/arm/boot/dts/r8a7794-alt.dts
> > @@ -377,6 +377,27 @@
> >         pinctrl-names =3D "i2c-exio4";
> >  };
> >
> > +&i2c7 {
> > +       status =3D "okay";
> > +       clock-frequency =3D <100000>;
>=20
> According to the DA9063 datasheet, the PMIC supports up to 400 kHz.
> It looks like there are no other devices on the bus.
>=20
> Wolfram, what's your stance on this?

Yes, please. I thought this was standard on Gen2 IIC_DVFS busses, but
seems not. Probably it slipped through the cracks.


--9amGYk9869ThD9tj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlx9BH0ACgkQFA3kzBSg
KbYn8Q//YuYDI0vlGc5vgJ4bujbT6Gj5niMNPpy0LGVPeciwnDYwzVE1d8Y5pVi8
Th3hraE66z80v39hnmE7CboGxg9SqaimaWnptZCDquRBkaOvoSHvmt5iH4vW2B0C
EBQgpMVcEfBLB1sKNLfCktJfN91U+HAU18z1vFIERBjhl5ASPey+O1T4TUzgzKJu
DphgC9h41dRMeRnexe7276+BEb/vTk0DTxQx4M0O77gNDYYoYu4CH5nr4yC8e0wh
RhkiLjfGUtQdU1viU99PmZnruz5j1xsaXBbzOIRDGn6PObzcYXKeYJ2XIA6xtlrI
3BNk9IV7QPrzFHt1AOyFsyN0VwBCpTsuEgdWSFQadXCfPQBDUWO+/ceMPj4BY7fx
2mjwySlgFKkMFqXtSU0p1rZg5O7Wf/M8OLfXlEKUURr4CmkIIHWVWrrah7x7+9ai
KXXHtt5XUff9347kpsvLvcnYnkkoGmRN0JLfXLgKPsu5QuQWpiZvKrv5LX55W9uv
cT0zPmozPfDNjOCxgOp+EnFO285vruPu/ZmMWEpOqgB4zsoN15fRdR87j2NfUpYA
oTO2AVAF2eubdfOfre6thPk11REymcpkBcfC/FZZytXyyqt6YYLqjwieGKqe1DE3
e9fjKbZ0XPnZSG8EBypBDQSDGcIBOn/UFBQk73W7OHqmINScXWQ=
=jHKR
-----END PGP SIGNATURE-----

--9amGYk9869ThD9tj--
