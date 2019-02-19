Return-Path: <SRS0=FLKL=Q2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47BB7C43381
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 19 Feb 2019 16:08:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 04A7B217D9
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 19 Feb 2019 16:08:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pv3KhBlQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729253AbfBSQIG (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 19 Feb 2019 11:08:06 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:33548 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728984AbfBSQIF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Feb 2019 11:08:05 -0500
Received: by mail-wm1-f65.google.com with SMTP id h22so2609292wmb.0;
        Tue, 19 Feb 2019 08:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=IaylbCq0tc0TaCcz8qNxFFt0U07DE7PaV+GuDmN4hiU=;
        b=pv3KhBlQOxLiN2vwDTLtSq8Ip0sifk+Dp4HPxvj1qevy4+0GLTIOrssQ3hZhkpxRCJ
         rXLXXmzhnfsbBxhp0+fzWmJRWhO6nBnxStabXsT4NL2rd37Di6eumZcxLvKofNCCA7q+
         Y7hx1MpIwZbf8t9+dfAAzRY2IoJMc2j7noeNVUDj5OnhSwiKGO4NgR6X/jWrVaD8ZpqS
         trkEVbuKqrz2dCpkIGou19iQKBYFl1XRoeFGm8KAFGzR+pKPsETRKw0sOd/vmrsllif9
         EYAnGe62N+xBp2cIds2o6Dz/2vPwZ3sRjBR9/Lf4FXhYdFTl0EfYXPvunFgFvhuwGi1+
         mWRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=IaylbCq0tc0TaCcz8qNxFFt0U07DE7PaV+GuDmN4hiU=;
        b=l+XXl7E79MASym5o+Y/Xq0nzGoLE402pI6YpNO6APP4K15dRL0bVPReYlZTMLjI739
         nfuISrBuWqx8cxOnS4l/alKwr5nQ/3WWT8bXTVESLdnqVfAbh7pS9zGDjYn9C3vMuuon
         UACcflEjUq31IU8U4IhrYmpD+x3mptgWitZ2+kpGSXmQXRexnryjrwJf5um2YhNDLpGP
         TKot+vo1U/+0Lh4oBKCSm0kzOUX6Xn8/0LFIyYOXs0QE55kkDydIH7hHYu/WUjiXASiy
         1GWUNU2B+0PcTzzO1gBh0GjY+QQVGEYwDqQb6RLdsx0QP36Kh1pSIcslB99bsKDNym8x
         H/fg==
X-Gm-Message-State: AHQUAubmosLrV7Ci/6wUwurrpoR77NEuwU1rSEpZkrpbPeap3SkYApol
        MWL6gHM2s6D6JtJmowr98B0=
X-Google-Smtp-Source: AHgI3IZhTvzdl4yXhHI0ogO8LMK10KzmTyX+BQZhE8rBc+xvXB/oaGFAAeznJVfTMAf3F4sCqa2H1g==
X-Received: by 2002:a1c:7510:: with SMTP id o16mr3388698wmc.38.1550592482343;
        Tue, 19 Feb 2019 08:08:02 -0800 (PST)
Received: from localhost (pD9E51D2D.dip0.t-ipconnect.de. [217.229.29.45])
        by smtp.gmail.com with ESMTPSA id d16sm15885917wru.52.2019.02.19.08.08.01
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Feb 2019 08:08:01 -0800 (PST)
Date:   Tue, 19 Feb 2019 17:08:00 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Marek Vasut <marek.vasut@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Jan Kotas <jank@cadence.com>, Mark Brown <broonie@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] gpio: of: Apply regulator-gpio quirk only to enable-gpios
Message-ID: <20190219160800.GA30280@ulmo>
References: <20190216134627.1601-1-marek.vasut@gmail.com>
 <20190219151811.GA13354@ulmo>
 <631beb2b-786e-e182-acea-561b0706b041@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Kj7319i9nmIyA2yE"
Content-Disposition: inline
In-Reply-To: <631beb2b-786e-e182-acea-561b0706b041@gmail.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--Kj7319i9nmIyA2yE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 19, 2019 at 04:25:59PM +0100, Marek Vasut wrote:
> On 2/19/19 4:18 PM, Thierry Reding wrote:
> > On Sat, Feb 16, 2019 at 02:46:27PM +0100, marek.vasut@gmail.com wrote:
> >> From: Marek Vasut <marek.vasut+renesas@gmail.com>
> >>
> >> Since commit d6cd33ad7102 ("regulator: gpio: Convert to use descriptor=
s")
> >> the GPIO regulator had inverted the polarity of the control GPIO. This
> >> problem manifested itself on systems with DT containing the following
> >> description (snippet from salvator-common.dtsi):
> >>
> >> 	gpios =3D <&gpio5 1 GPIO_ACTIVE_HIGH>;
> >> 	gpios-states =3D <1>;
> >> 	states =3D <3300000 1
> >> 		  1800000 0>;
> >>
> >> Prior to the aforementioned commit, the gpio-regulator code used
> >> gpio_request_array() to claim the GPIO(s) specified in the "gpios"
> >> DT node, while the commit changed that to devm_gpiod_get_index().
> >>
> >> The legacy gpio_request_array() calls gpio_request_one() and then
> >> gpiod_request(), which parses the DT flags of the "gpios" node and
> >> populates the GPIO descriptor flags field accordingly.
> >>
> >> The new devm_gpiod_get_index() calls gpiod_get_index(), then
> >> of_find_gpio(), of_get_named_gpiod_flags() with flags !=3D NULL,
> >> and then of_gpio_flags_quirks(). Since commit a603a2b8d86e
> >> ("gpio: of: Add special quirk to parse regulator flags"),
> >> of_gpio_flags_quirks() contains a quirk for regulator-gpio
> >> which was never triggered by the legacy gpio_request_array()
> >> code path, but is triggered by devm_gpiod_get_index() code
> >> path.
> >>
> >> This quirk checks whether a GPIO is associated with a fixed
> >> or gpio-regulator and if so, checks two additional conditions.
> >> First, whether such GPIO is active-low, and if so, ignores the
> >> active-low flag. Second, whether the regulator DT node does
> >> have an "enable-active-high" property and if the property is
> >> NOT present, sets the GPIO flags as active-low.
> >>
> >> The second check triggers a problem, since it is applied to all
> >> GPIOs associated with a gpio-regulator, rather than only on the
> >> "enable" GPIOs, as the old code did. This changes the way the
> >> gpio-regulator interprets the DT description of the control
> >> GPIOs.
> >>
> >> The old code using gpio_request_array() explicitly parsed the
> >> "enable-active-high" DT property and only applied it to the
> >> GPIOs described in the "enable-gpios" DT node, and only if
> >> those were present.
> >>
> >> This patch fixes the quirk code by only applying the quirk
> >> to "enable-gpios", thus restoring the old behavior.
> >>
> >> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> >> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> >> Cc: Jan Kotas <jank@cadence.com>
> >> Cc: Linus Walleij <linus.walleij@linaro.org>
> >> Cc: Mark Brown <broonie@kernel.org>
> >> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
> >> Cc: linux-renesas-soc@vger.kernel.org
> >> To: linux-gpio@vger.kernel.org
> >> ---
> >>  drivers/gpio/gpiolib-of.c | 1 +
> >>  1 file changed, 1 insertion(+)
> >=20
> > This causes a runtime regression on Jetson TX1. The symptoms are that
> > HDMI monitors are no longer reliably detected as plugged in. The reason
> > is because the GPIO polarity for the HDMI +5V regulator is now reversed
> > and therefore the HPD signal, which is usually fed by the +5V signal,
> > does not reflect the correct value.
> >=20
> > Now it's somewhat confusing to me why this wasn't broken before. We have
> > this in device tree:
> >=20
> > 		vdd_hdmi: regulator@10 {
> > 			compatible =3D "regulator-fixed";
> > 			reg =3D <10>;
> > 			regulator-name =3D "VDD_HDMI_5V0";
> > 			regulator-min-microvolt =3D <5000000>;
> > 			regulator-max-microvolt =3D <5000000>;
> > 			gpio =3D <&exp1 12 GPIO_ACTIVE_LOW>;
> > 			enable-active-high;
> > 			vin-supply =3D <&vdd_5v0_sys>;
> > 		};
> >=20
> > This is from arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi. The above
> > is obviously wrong because it specifies GPIO_ACTIVE_LOW and I do see the
> > warning from the GPIO library about how this is being ignored. However,
> > the above works fine on today's linux-next with this commit reverted
> > because the quirks will cause the GPIO_ACTIVE_LOW flag to be ignored.
> >=20
> > However, with this commit applied, the quirk will be skipped for the
> > regulator and cause the GPIO_ACTIVE_LOW flag to be used to invert the
> > GPIO during enable and disable operations.
> >=20
> > Now, this is clearly a bug in the DT and I'm going to send out a patch
> > to fix that up, but I think we need to revert this patch for now because
> > there may be other cases out there that are broken.
>=20
> This patch fixes a breakage on R-Car Gen3 platforms, so reverting this
> patch will break those platforms. However, those platforms do not have a
> buggy DT, unlike the Jetson.

Erm... that's not how we do things. You can't break one platform just to
make another work. By all means let's fix breakage on R-Car Gen3
platforms, but let's do it in a way that keeps everyone else happy as
well.

> > The whole point of
> > these quirks is also to make sure that existing device trees continue to
> > work.
> >=20
> > Also, checking for only the enable-gpio property is wrong in this case.
> > enable-gpio is only specified for regulator-gpio. The standard GPIO for
> > regulator-fixed is "gpio", so the quirks must be applied to that
> > property in order to ensure backwards-compatibility.
> >=20
> >> diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
> >> index 03ec3ddaba60..1b4c741e0635 100644
> >> --- a/drivers/gpio/gpiolib-of.c
> >> +++ b/drivers/gpio/gpiolib-of.c
> >> @@ -84,6 +84,7 @@ static void of_gpio_flags_quirks(struct device_node =
*np,
> >>  	 * Note that active low is the default.
> >>  	 */
> >>  	if (IS_ENABLED(CONFIG_REGULATOR) &&
> >> +	    !strcmp(propname, "enable-gpio") &&
> >>  	    (of_device_is_compatible(np, "regulator-fixed") ||
> >>  	     of_device_is_compatible(np, "reg-fixed-voltage") ||
> >>  	     of_device_is_compatible(np, "regulator-gpio"))) {
> >=20
> > I think this would need to be something like the below to reflect what
> > you were trying to achieve, while keeping backwards compatibility:
> >=20
> > --- >8 ---
> > diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
> > index 1b4c741e0635..bddfc6102a50 100644
> > --- a/drivers/gpio/gpiolib-of.c
> > +++ b/drivers/gpio/gpiolib-of.c
> > @@ -84,10 +84,10 @@ static void of_gpio_flags_quirks(struct device_node=
 *np,
> >  	 * Note that active low is the default.
> >  	 */
> >  	if (IS_ENABLED(CONFIG_REGULATOR) &&
> > -	    !strcmp(propname, "enable-gpio") &&
> >  	    (of_device_is_compatible(np, "regulator-fixed") ||
> >  	     of_device_is_compatible(np, "reg-fixed-voltage") ||
> > -	     of_device_is_compatible(np, "regulator-gpio"))) {
> > +	     (of_device_is_compatible(np, "regulator-gpio") &&
> > +	      strcmp(propname, "enable-gpio") =3D=3D 0))) {
> >  		/*
> >  		 * The regulator GPIO handles are specified such that the
> >  		 * presence or absence of "enable-active-high" solely controls
> > --- >8 ---
> >=20
> > That applied on top of today's linux-next fixes the regression for me
> > without a need to modify the device tree. Feel free to integrate that
> > into your patch.
>=20
> This one works on R-Car Gen3 too, so if we can add that on top of this
> patch, fine by me . Can you send a formal patch ?

Linus,

can you squash this into Marek's original commit? I'd rather not make
that two patches because that would potentially cause bisectability
issues.

Thierry

--Kj7319i9nmIyA2yE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlxsKd0ACgkQ3SOs138+
s6EWwxAAmFmecq0PBVzzuCnvexM1u1GK8NysCX/UnVLnZmLhkmLBi9RPPsxmZs60
3PK02a7AJ9L6TFvEg+AImeR9zDkf3MVtrknJK8dREObTCGlJbBmd6GVYDvsZoxtF
q1VVzxbodLla5JvI+cao3tZ4dHm5Zx/QED04dFWTAR1E4wkd2C3nMYSm3+zc3iKf
a8AUvnGcQLvwbhl5YwCAC4pWHZfNOXtSq+oDw3Xyaq2vBzqxlDW1KG2KwMilZAIA
CpP3H4lL7Zkd6CCf6w+XK1p90w2EhZ9/GqOySSMWZKpm0G35B2KWRmeSrnGZQkZJ
pFpFO4mbcaKtQg2MkHeYKet11KcCKr3gJn+8AIqhLdPMDYuj7XoVI4+DAsw0avwR
5gobWE934QMwINOgbfq6qwBtsahnoNTFCtg5WmEj2rlXstF2ZiLh3TSkFDOBMqxp
lpX89VM3aGReci6AY2e/vjUwDcCrf5QHNZlPz6rxB4EDfDMZSkCRS3Iiln01VZeK
iW8vFabU8SCkbEMSWeTNWftHDbgoFHt83NAQj3c75qRfm2MACN8sIXAdc+QU9XkW
0jmS/FWjXwlfj/9pfWFmEVWTpY282Lo2IKeDUThpA1XchB/kWUUGqnWKHCh+0uwB
E9E6OGfFGfYDFKfZbWseYr6/OKjKUhwd56p9lYSHqMOvaCOUmVo=
=ONzj
-----END PGP SIGNATURE-----

--Kj7319i9nmIyA2yE--
