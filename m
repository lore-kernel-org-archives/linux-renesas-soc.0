Return-Path: <SRS0=FLKL=Q2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82CC8C43381
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 19 Feb 2019 15:18:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 490E920700
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 19 Feb 2019 15:18:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bLJAEKHP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728966AbfBSPSQ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 19 Feb 2019 10:18:16 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:33666 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727233AbfBSPSQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Feb 2019 10:18:16 -0500
Received: by mail-wr1-f67.google.com with SMTP id i12so22475094wrw.0;
        Tue, 19 Feb 2019 07:18:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=0teC1skUxR60/k7tWfG9/k4dcy52SYy/6hf/oSnO45M=;
        b=bLJAEKHPKlAIesfx1nMR2WzsXyV1bx3tEcfyeyAmMPo6xu3NZnOFU96M6fY0Lmvqw5
         W5/yKFk6FKR8t/lDjsi4RH+EbFcXTa7T8w3PvNC02YGE53r4zL2zdPtubT5hp04sImmg
         QstjbeRoVSzE1oNJkDIqn5d24h9dHYcYxG/AM7XBH1MCdw412PnsmPeiS/CSoK5d8Fki
         OkOgveqOPpHn0RuODQyn/R3lXd440XubczI+5zVYk81JTg9w54h4v7ScYYR5wta07YB6
         fyS8l9kQZ1kThaxHYYOqTg4fYOKjGgfUcr/vpdxgEzpMdOZTGgCvVVAoHVUP/rW86Onh
         skEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=0teC1skUxR60/k7tWfG9/k4dcy52SYy/6hf/oSnO45M=;
        b=ZYc5fI5otEumt3fj8sC6HE4omBIawtkZZBo+9WzLie4GuICEu/sr4OdbooEWBiBF7X
         P9ZIY2+CPPIztNOdphsHPaFDNh1RfMT5uCDAsE/E1iweCelB4cUeEiQhW5YoZoERB6ce
         CE3TZgrCBgPiPXKVdN9c76iDcH9dHzxdhKdjmCGc6mo6ZvhXUcnnBtfHrxw5YXvtHSpz
         /ATSq6xJ/zbRBY4dvGYmMLe0gc/ojkyLkLy0HzgOk6Q7FwGPcFlpOO0W1P68D+hEzRBG
         7BGD5l+Xxh1x2IkWyhUf1owQg7ENsFjxJP/n9yOo63P68VJjfQwxngeVucipYwXB+feW
         HEbA==
X-Gm-Message-State: AHQUAuYiasf/JZrkmTlzg6GpStF6WOYf37Vd1sz1xliF8g6Sohax/zb3
        +YVEBPVwIpx7MorYv2c7ETc=
X-Google-Smtp-Source: AHgI3IbrfLLN47g6uZllbR7VLxceOE8r3x8ILYHsBGyKnPuVBXj6uUlrZLQOVNbggN7Nk/WPlRFbZg==
X-Received: by 2002:adf:face:: with SMTP id a14mr14342294wrs.320.1550589493669;
        Tue, 19 Feb 2019 07:18:13 -0800 (PST)
Received: from localhost (pD9E51D2D.dip0.t-ipconnect.de. [217.229.29.45])
        by smtp.gmail.com with ESMTPSA id d16sm10959339wrx.29.2019.02.19.07.18.12
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Feb 2019 07:18:12 -0800 (PST)
Date:   Tue, 19 Feb 2019 16:18:11 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     marek.vasut@gmail.com
Cc:     linux-gpio@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Jan Kotas <jank@cadence.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] gpio: of: Apply regulator-gpio quirk only to enable-gpios
Message-ID: <20190219151811.GA13354@ulmo>
References: <20190216134627.1601-1-marek.vasut@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="IJpNTDwzlM2Ie8A6"
Content-Disposition: inline
In-Reply-To: <20190216134627.1601-1-marek.vasut@gmail.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--IJpNTDwzlM2Ie8A6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 16, 2019 at 02:46:27PM +0100, marek.vasut@gmail.com wrote:
> From: Marek Vasut <marek.vasut+renesas@gmail.com>
>=20
> Since commit d6cd33ad7102 ("regulator: gpio: Convert to use descriptors")
> the GPIO regulator had inverted the polarity of the control GPIO. This
> problem manifested itself on systems with DT containing the following
> description (snippet from salvator-common.dtsi):
>=20
> 	gpios =3D <&gpio5 1 GPIO_ACTIVE_HIGH>;
> 	gpios-states =3D <1>;
> 	states =3D <3300000 1
> 		  1800000 0>;
>=20
> Prior to the aforementioned commit, the gpio-regulator code used
> gpio_request_array() to claim the GPIO(s) specified in the "gpios"
> DT node, while the commit changed that to devm_gpiod_get_index().
>=20
> The legacy gpio_request_array() calls gpio_request_one() and then
> gpiod_request(), which parses the DT flags of the "gpios" node and
> populates the GPIO descriptor flags field accordingly.
>=20
> The new devm_gpiod_get_index() calls gpiod_get_index(), then
> of_find_gpio(), of_get_named_gpiod_flags() with flags !=3D NULL,
> and then of_gpio_flags_quirks(). Since commit a603a2b8d86e
> ("gpio: of: Add special quirk to parse regulator flags"),
> of_gpio_flags_quirks() contains a quirk for regulator-gpio
> which was never triggered by the legacy gpio_request_array()
> code path, but is triggered by devm_gpiod_get_index() code
> path.
>=20
> This quirk checks whether a GPIO is associated with a fixed
> or gpio-regulator and if so, checks two additional conditions.
> First, whether such GPIO is active-low, and if so, ignores the
> active-low flag. Second, whether the regulator DT node does
> have an "enable-active-high" property and if the property is
> NOT present, sets the GPIO flags as active-low.
>=20
> The second check triggers a problem, since it is applied to all
> GPIOs associated with a gpio-regulator, rather than only on the
> "enable" GPIOs, as the old code did. This changes the way the
> gpio-regulator interprets the DT description of the control
> GPIOs.
>=20
> The old code using gpio_request_array() explicitly parsed the
> "enable-active-high" DT property and only applied it to the
> GPIOs described in the "enable-gpios" DT node, and only if
> those were present.
>=20
> This patch fixes the quirk code by only applying the quirk
> to "enable-gpios", thus restoring the old behavior.
>=20
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Jan Kotas <jank@cadence.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Cc: linux-renesas-soc@vger.kernel.org
> To: linux-gpio@vger.kernel.org
> ---
>  drivers/gpio/gpiolib-of.c | 1 +
>  1 file changed, 1 insertion(+)

This causes a runtime regression on Jetson TX1. The symptoms are that
HDMI monitors are no longer reliably detected as plugged in. The reason
is because the GPIO polarity for the HDMI +5V regulator is now reversed
and therefore the HPD signal, which is usually fed by the +5V signal,
does not reflect the correct value.

Now it's somewhat confusing to me why this wasn't broken before. We have
this in device tree:

		vdd_hdmi: regulator@10 {
			compatible =3D "regulator-fixed";
			reg =3D <10>;
			regulator-name =3D "VDD_HDMI_5V0";
			regulator-min-microvolt =3D <5000000>;
			regulator-max-microvolt =3D <5000000>;
			gpio =3D <&exp1 12 GPIO_ACTIVE_LOW>;
			enable-active-high;
			vin-supply =3D <&vdd_5v0_sys>;
		};

This is from arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi. The above
is obviously wrong because it specifies GPIO_ACTIVE_LOW and I do see the
warning from the GPIO library about how this is being ignored. However,
the above works fine on today's linux-next with this commit reverted
because the quirks will cause the GPIO_ACTIVE_LOW flag to be ignored.

However, with this commit applied, the quirk will be skipped for the
regulator and cause the GPIO_ACTIVE_LOW flag to be used to invert the
GPIO during enable and disable operations.

Now, this is clearly a bug in the DT and I'm going to send out a patch
to fix that up, but I think we need to revert this patch for now because
there may be other cases out there that are broken. The whole point of
these quirks is also to make sure that existing device trees continue to
work.

Also, checking for only the enable-gpio property is wrong in this case.
enable-gpio is only specified for regulator-gpio. The standard GPIO for
regulator-fixed is "gpio", so the quirks must be applied to that
property in order to ensure backwards-compatibility.

> diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
> index 03ec3ddaba60..1b4c741e0635 100644
> --- a/drivers/gpio/gpiolib-of.c
> +++ b/drivers/gpio/gpiolib-of.c
> @@ -84,6 +84,7 @@ static void of_gpio_flags_quirks(struct device_node *np,
>  	 * Note that active low is the default.
>  	 */
>  	if (IS_ENABLED(CONFIG_REGULATOR) &&
> +	    !strcmp(propname, "enable-gpio") &&
>  	    (of_device_is_compatible(np, "regulator-fixed") ||
>  	     of_device_is_compatible(np, "reg-fixed-voltage") ||
>  	     of_device_is_compatible(np, "regulator-gpio"))) {

I think this would need to be something like the below to reflect what
you were trying to achieve, while keeping backwards compatibility:

--- >8 ---
diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 1b4c741e0635..bddfc6102a50 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -84,10 +84,10 @@ static void of_gpio_flags_quirks(struct device_node *np,
 	 * Note that active low is the default.
 	 */
 	if (IS_ENABLED(CONFIG_REGULATOR) &&
-	    !strcmp(propname, "enable-gpio") &&
 	    (of_device_is_compatible(np, "regulator-fixed") ||
 	     of_device_is_compatible(np, "reg-fixed-voltage") ||
-	     of_device_is_compatible(np, "regulator-gpio"))) {
+	     (of_device_is_compatible(np, "regulator-gpio") &&
+	      strcmp(propname, "enable-gpio") =3D=3D 0))) {
 		/*
 		 * The regulator GPIO handles are specified such that the
 		 * presence or absence of "enable-active-high" solely controls
--- >8 ---

That applied on top of today's linux-next fixes the regression for me
without a need to modify the device tree. Feel free to integrate that
into your patch.

Thierry

--IJpNTDwzlM2Ie8A6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlxsHjAACgkQ3SOs138+
s6HNLRAAsn7y7a/t0yEffDR1CAt+lfAr8GiMWC+JMiUkbFyI3O5vg2IyKLLMWW11
qOBwiFE6mQXmXYpG52q5W9C+l+JNBio2NHzHjpEUjvG4cTCRYPzAyCK9rpSuoJbt
FizIgQ7afxtoyPnOK42Rz/FvTXOB1W1ZCCS3RD8lXwXCYgxozI6x+XcQvhjafKSi
N0dOuVIjRhcGbq8F/cncT7sbfPJdB1+2azZeSzPu6uhXgItke0Eu8VQK/OeldRZL
eKFk9IeNNk/fr7wistskXfXUoUwSB1sl4O/lkfAUiN5rLLZeT5XTVnCwG9pTAlfJ
yGYWr0eFVIVzmT5RJMZqAM1SqCqD0ecLiELiWnuK2KSp4yTc2NVRiEolgoOo42xM
H8LmK9wriLtnB7RDBrpP+KL+MOpYg+MlR1NXM/7YLFf6pZKf4+JS3kBBZQy/kUL6
S2IEVShZ7KGpWtO/CLiWLT5etYutBATIKborE5A/clPxs7A+4y2Unf0Yy0q3i2U2
/HLBlOw/7zZ9IgoqNWd+9W/A0qOLeO6jdG2Z4wE1LXwCyW5X0dGHQtw+g81ceoOw
cRdMrINt5bjQF4JFGyCBnk5kQdlBPdTOIU9FKQTvOdCQLfhmTAeeoBc7bkBGriym
rAVfy61D8POI9RAtxGsTGm0GVp834aQqJM/2SjWWr2YxWKLYalQ=
=HB4P
-----END PGP SIGNATURE-----

--IJpNTDwzlM2Ie8A6--
