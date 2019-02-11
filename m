Return-Path: <SRS0=nlYi=QS=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_NEOMUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77855C169C4
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 11 Feb 2019 21:00:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 46CF2217D9
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 11 Feb 2019 21:00:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727099AbfBKVAA (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 11 Feb 2019 16:00:00 -0500
Received: from sauhun.de ([88.99.104.3]:58252 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726080AbfBKVAA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Feb 2019 16:00:00 -0500
Received: from localhost (p54B333B4.dip0.t-ipconnect.de [84.179.51.180])
        by pokefinder.org (Postfix) with ESMTPSA id 360102E3542;
        Mon, 11 Feb 2019 21:59:58 +0100 (CET)
Date:   Mon, 11 Feb 2019 21:59:57 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [RFC PATCH] i2c: gpio: fault-injector: add 'lose_arbitration'
 injector
Message-ID: <20190211205957.vtu57sslnc2pn6cd@ninjato>
References: <20190121142839.19011-1-wsa+renesas@sang-engineering.com>
 <CAMuHMdX=HVBYwRT8otZVs0WaOnjLLWrH8RQZyXCH8_Ro11Muaw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="3jpta2zy2xlt3gpr"
Content-Disposition: inline
In-Reply-To: <CAMuHMdX=HVBYwRT8otZVs0WaOnjLLWrH8RQZyXCH8_Ro11Muaw@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--3jpta2zy2xlt3gpr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Mon, Feb 11, 2019 at 11:30:56AM +0100, Geert Uytterhoeven wrote:
> Hi Wolfram,
>=20
> On Mon, Jan 21, 2019 at 3:29 PM Wolfram Sang
> <wsa+renesas@sang-engineering.com> wrote:
> > Here is a fault injector simulating 'arbitration lost' from multi-master
> > setups. Read the docs for its usage.
> >
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>=20
> Thanks, looks like a valuable injector case!
>=20
> > This is the most reliable result I came up with so far for simulating l=
ost
> > arbitration (after playing a lot with falling SDA as trigger first, but=
 SCL
> > seems the way to go). Works fine with the i2c-sh_mobile driver on a Ren=
esas
>=20
> Using SCL as the trigger makes most sense to me, too.

Thanks for the review and glad you like the use case and implementation
approach.

> > +       struct i2c_gpio_private_data *priv =3D dev_id;
> > +
> > +       setsda(&priv->bit_data, 0);
> > +       udelay(200);
>=20
> Please add a #define for this value.

Sure thing, this was a typical RFC marker :) It is now calculated based
on bit_data.udelay and has a comment.


> > +       struct i2c_gpio_private_data *priv =3D data;
> > +       int irq =3D gpiod_to_irq(priv->scl);
>=20
> As request_irq() takes an unsigned int irq, please check for a negative e=
rror
> code here.


Will do.

> > +       int ret, i;
>=20
> u64 i;
>=20
> Yes, 64-bit values may be a bit excessive, but that's what the caller is
> passing, and truncating to int may cause unexpected behavior.

OK, but won't be needed after my refactoring to count this in the
interrupt.

> > +       ret =3D request_irq(irq, lose_arbitration_irq, IRQF_TRIGGER_FAL=
LING,
> > +                         "i2c-gpio-fi", priv);
>=20
> "i2c-gpio-fault-injection"?

OK. That was RFC style, too.

> > +       if (ret)
> > +               goto output;
> > +
> > +       for (i =3D 0; i < num_faults; i++) {
> > +               ret =3D wait_for_completion_interruptible(&priv->irq_ha=
ppened);
> > +               if (ret)
> > +                       break;
> > +               reinit_completion(&priv->irq_happened);
>=20
> The reinitialization may race with the interrupt handler. Probably you do=
n't
> care, though, as all of this is "best effort" anyway.
>=20
> Perhaps you can do the counting in the interrupt handler instead, and only
> trigger completion after the wanted number of lost arbitrations has been
> performed?

Yes, I like this approach! Will do.

>=20
>=20
> > +DEFINE_DEBUGFS_ATTRIBUTE(fops_lose_arbitration, NULL, fops_lose_arbitr=
ation_set, "%llu\n");
>=20
> I think you can drop the format if you don't provide a "get" method.
> Or just implement the "get" method, too ;-)

Any pointer for that information? I seem to recall that the format
string is also used to parse the user string to the set function. I
sadly can't find that documented, but all the helper macros in
fs/debugfs/file.c have a format string, too, even if WO.

I have the code ready but testing and pushing out needs to wait until
tomorrow.

Thanks again,

   Wolfram


--3jpta2zy2xlt3gpr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlxh4kkACgkQFA3kzBSg
KbZiVw/+PhsFLVoZ4utSsDlJtQ1EhXHMJq9d6nVTl5loJWWudH3bVNwd04wZDT0h
PGefWXTZ2j4r72t3KDKzzV42PahLzW2EksWDLtVX7n5y8gFOQYQDJLdCqSVVusan
91Nh/graFqZp93ZzHGSEq7Wq8BvuiSl+I3J3m9GgOMEs+fLv9Xm7L9D+i9Dfu2Fl
8LDTeWyqUXasIJxE/ukoE91CCIfwGq1pEnAnY4oYPE88P0MpZNgel5H5ZenpMC6V
0c5KAQwV/4ggnAmLYD+XW70MNVridf2Lvte7OGi7ycJ5KJWLmpR9xU1xWYGK5Ypz
MT7E2KhpJHBgFACfrFD68144d+2AjJ+C3r2BULqDuHEPSRGP4l4hElv70Wd9hFTI
0rXEcnLlHLc+09cBONQ52y3Ln+tQ2hmNz/qKDixMjd5SJZx96fVZWwGk5UkHbdYu
xGNFPPY0We1j5/OSid/LXrNpPeSLnseFypx/s201Wm9ocy5UHPisAOFbkGA3NxN8
UgPzJ1b1Jti3RGeocadT1k4Gi9RGB6nuovyeEZYtn+e1Svhe8hyp8H76ocX2/5Og
HYhBKKUhfM/lCHHcboW7bzuvrqIEgU+hRh3g/Z1bgdITC7YQpMxjqawvACog0yTs
NDq5O6iQL1tE9AbXk+CBY4Ss3Ly63zL1wm5YYFD6ll59ZcoI+UI=
=VCzw
-----END PGP SIGNATURE-----

--3jpta2zy2xlt3gpr--
