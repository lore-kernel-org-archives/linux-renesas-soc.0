Return-Path: <SRS0=FLKL=Q2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54E22C43381
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 19 Feb 2019 17:05:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0EF292183F
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 19 Feb 2019 17:05:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gjw8bLeS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729320AbfBSRFm (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 19 Feb 2019 12:05:42 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:34372 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726342AbfBSRFm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Feb 2019 12:05:42 -0500
Received: by mail-wm1-f67.google.com with SMTP id y185so2726586wmd.1;
        Tue, 19 Feb 2019 09:05:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=VTn05tMkV1LlBkt/+c18U0twz9ZcfcAnysOLip0yeKQ=;
        b=gjw8bLeSJ04V2AQFyoJkTP/Hw/YjSPdgX/d+ufglrdF4qOEW7z9kNE3nrFsjL8ZBb/
         sLR05WZMmviRkEUYGeVUJrK/jV6O/hgpDT8aIxgMgRP2A7Zt6xlVVn7PSyzSh9+Sa8s2
         hzdA6SMMCkvoNM0BIY8IJXKuWR5e+Yx6pWYSVz7Aqyy+Eg/jBUcfLBSv0RO6AgIL8y76
         GcN7+v2D4w2ntwAbDTPzrR7nzW4b9W1rBwkEZX1Zwl34Q2rqUdrIRhFDaqXba9YhR2Iy
         n6l6DKBAUYhJDdVU+9Kwi05HV5Q0C77OIG7+RVZYQtxWu1lR20FA38Odq1vxLMy+1fMo
         kOIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=VTn05tMkV1LlBkt/+c18U0twz9ZcfcAnysOLip0yeKQ=;
        b=s9OK0KV3VASI6p2TIjIdCdBxzcIVCG58l5QvSQWtIJlv5B5LPbIHF2zK2l3fonIyWS
         NG2tgFBO/cU56lWC7Djv8KoPJPerif3oH95M2k//edsx27r/DB7WtLhi5TY9buwusP9q
         uP2pSQz27z0Gov8eaBFgMOLAfJ4kFumHPi7vKczpK5i4zg34bQ8g09wIfEnpgOR3DBPp
         fwjCeBZNaAfS3+D1m+xWeV8xXd8UKxSSaO5K7IRXdtNjYWN7YapLMHwzW42PPz6JmfZ2
         4sg6NK8LFviewoOHW4Rqlk0/qpXJX17Ycm3wS3GrFOL0NgZ83bDUjgMDAAe18Ny03dUh
         JBbQ==
X-Gm-Message-State: AHQUAuaDM+b0ieH5r029RZ9ytNwhGT1Wzl0EG6nw+CKJokUifZpwpxqb
        ZnFBGPqGmwTE6A/V6q/o7YE=
X-Google-Smtp-Source: AHgI3IY7enO2/bt/kkkP91/Nnfqwp2UrjqXKrbKTcuGxSOTJJqXcMKXjtgBxnaVK1QTR1C9jrfQ8+w==
X-Received: by 2002:a1c:8086:: with SMTP id b128mr3742300wmd.117.1550595939722;
        Tue, 19 Feb 2019 09:05:39 -0800 (PST)
Received: from localhost (pD9E51D2D.dip0.t-ipconnect.de. [217.229.29.45])
        by smtp.gmail.com with ESMTPSA id o12sm57823691wre.0.2019.02.19.09.05.38
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Feb 2019 09:05:38 -0800 (PST)
Date:   Tue, 19 Feb 2019 18:05:37 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Marek Vasut <marek.vasut@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Jan Kotas <jank@cadence.com>, Mark Brown <broonie@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] gpio: of: Apply regulator-gpio quirk only to enable-gpios
Message-ID: <20190219170537.GA14351@ulmo>
References: <20190216134627.1601-1-marek.vasut@gmail.com>
 <20190219151811.GA13354@ulmo>
 <631beb2b-786e-e182-acea-561b0706b041@gmail.com>
 <20190219160800.GA30280@ulmo>
 <805f638e-2d55-803b-b09c-617d3a503408@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="huq684BweRXVnRxX"
Content-Disposition: inline
In-Reply-To: <805f638e-2d55-803b-b09c-617d3a503408@gmail.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--huq684BweRXVnRxX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 19, 2019 at 05:30:35PM +0100, Marek Vasut wrote:
> On 2/19/19 5:08 PM, Thierry Reding wrote:
> > On Tue, Feb 19, 2019 at 04:25:59PM +0100, Marek Vasut wrote:
> >> On 2/19/19 4:18 PM, Thierry Reding wrote:
> >>> On Sat, Feb 16, 2019 at 02:46:27PM +0100, marek.vasut@gmail.com wrote:
> >>>> From: Marek Vasut <marek.vasut+renesas@gmail.com>
> >>>>
> >>>> Since commit d6cd33ad7102 ("regulator: gpio: Convert to use descript=
ors")
> >>>> the GPIO regulator had inverted the polarity of the control GPIO. Th=
is
> >>>> problem manifested itself on systems with DT containing the following
> >>>> description (snippet from salvator-common.dtsi):
> >>>>
> >>>> 	gpios =3D <&gpio5 1 GPIO_ACTIVE_HIGH>;
> >>>> 	gpios-states =3D <1>;
> >>>> 	states =3D <3300000 1
> >>>> 		  1800000 0>;
> >>>>
> >>>> Prior to the aforementioned commit, the gpio-regulator code used
> >>>> gpio_request_array() to claim the GPIO(s) specified in the "gpios"
> >>>> DT node, while the commit changed that to devm_gpiod_get_index().
> >>>>
> >>>> The legacy gpio_request_array() calls gpio_request_one() and then
> >>>> gpiod_request(), which parses the DT flags of the "gpios" node and
> >>>> populates the GPIO descriptor flags field accordingly.
> >>>>
> >>>> The new devm_gpiod_get_index() calls gpiod_get_index(), then
> >>>> of_find_gpio(), of_get_named_gpiod_flags() with flags !=3D NULL,
> >>>> and then of_gpio_flags_quirks(). Since commit a603a2b8d86e
> >>>> ("gpio: of: Add special quirk to parse regulator flags"),
> >>>> of_gpio_flags_quirks() contains a quirk for regulator-gpio
> >>>> which was never triggered by the legacy gpio_request_array()
> >>>> code path, but is triggered by devm_gpiod_get_index() code
> >>>> path.
> >>>>
> >>>> This quirk checks whether a GPIO is associated with a fixed
> >>>> or gpio-regulator and if so, checks two additional conditions.
> >>>> First, whether such GPIO is active-low, and if so, ignores the
> >>>> active-low flag. Second, whether the regulator DT node does
> >>>> have an "enable-active-high" property and if the property is
> >>>> NOT present, sets the GPIO flags as active-low.
> >>>>
> >>>> The second check triggers a problem, since it is applied to all
> >>>> GPIOs associated with a gpio-regulator, rather than only on the
> >>>> "enable" GPIOs, as the old code did. This changes the way the
> >>>> gpio-regulator interprets the DT description of the control
> >>>> GPIOs.
> >>>>
> >>>> The old code using gpio_request_array() explicitly parsed the
> >>>> "enable-active-high" DT property and only applied it to the
> >>>> GPIOs described in the "enable-gpios" DT node, and only if
> >>>> those were present.
> >>>>
> >>>> This patch fixes the quirk code by only applying the quirk
> >>>> to "enable-gpios", thus restoring the old behavior.
> >>>>
> >>>> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> >>>> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> >>>> Cc: Jan Kotas <jank@cadence.com>
> >>>> Cc: Linus Walleij <linus.walleij@linaro.org>
> >>>> Cc: Mark Brown <broonie@kernel.org>
> >>>> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
> >>>> Cc: linux-renesas-soc@vger.kernel.org
> >>>> To: linux-gpio@vger.kernel.org
> >>>> ---
> >>>>  drivers/gpio/gpiolib-of.c | 1 +
> >>>>  1 file changed, 1 insertion(+)
> >>>
> >>> This causes a runtime regression on Jetson TX1. The symptoms are that
> >>> HDMI monitors are no longer reliably detected as plugged in. The reas=
on
> >>> is because the GPIO polarity for the HDMI +5V regulator is now revers=
ed
> >>> and therefore the HPD signal, which is usually fed by the +5V signal,
> >>> does not reflect the correct value.
> >>>
> >>> Now it's somewhat confusing to me why this wasn't broken before. We h=
ave
> >>> this in device tree:
> >>>
> >>> 		vdd_hdmi: regulator@10 {
> >>> 			compatible =3D "regulator-fixed";
> >>> 			reg =3D <10>;
> >>> 			regulator-name =3D "VDD_HDMI_5V0";
> >>> 			regulator-min-microvolt =3D <5000000>;
> >>> 			regulator-max-microvolt =3D <5000000>;
> >>> 			gpio =3D <&exp1 12 GPIO_ACTIVE_LOW>;
> >>> 			enable-active-high;
> >>> 			vin-supply =3D <&vdd_5v0_sys>;
> >>> 		};
> >>>
> >>> This is from arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi. The above
> >>> is obviously wrong because it specifies GPIO_ACTIVE_LOW and I do see =
the
> >>> warning from the GPIO library about how this is being ignored. Howeve=
r,
> >>> the above works fine on today's linux-next with this commit reverted
> >>> because the quirks will cause the GPIO_ACTIVE_LOW flag to be ignored.
> >>>
> >>> However, with this commit applied, the quirk will be skipped for the
> >>> regulator and cause the GPIO_ACTIVE_LOW flag to be used to invert the
> >>> GPIO during enable and disable operations.
> >>>
> >>> Now, this is clearly a bug in the DT and I'm going to send out a patch
> >>> to fix that up, but I think we need to revert this patch for now beca=
use
> >>> there may be other cases out there that are broken.
> >>
> >> This patch fixes a breakage on R-Car Gen3 platforms, so reverting this
> >> patch will break those platforms. However, those platforms do not have=
 a
> >> buggy DT, unlike the Jetson.
> >=20
> > Erm... that's not how we do things. You can't break one platform just to
> > make another work. By all means let's fix breakage on R-Car Gen3
> > platforms, but let's do it in a way that keeps everyone else happy as
> > well.
>=20
> Erm... that's not what I suggested. It's just that this regulator rework
> ( d6cd33ad7102 ) changed the behavior of the gpio-regulator because
> there are a lot of obscure, inobvious and undocumented edge-cases in the
> gpio-regulator code.

Sorry if I misinterpreted what you were saying.

> If we were to revert this patch, we'd have to revert the d6cd33ad7102
> too to fix the Gen3. But since d6cd33ad7102 is a nice cleanup and it
> makes sense, I'd rather if we fixed the situation, restored the DT
> handling to the way it was before and moved forward.

Okay, sounds like we have the same goal, and from what you said earlier
the proposed fixup on top of your patch should fix this for everyone.
Let's hope there aren't any more nasty corner cases.

> Handling broken DTs only adds to the complexity, but I think this cannot
> be helped, since those DTs can be stored in some ROM.

FWIW, the Jetson TX1 DT isn't technically broken because it used to work
fine. It's just that it relied on the quirks for correctness. So we are
in the lucky situation that the DT is not in a ROM and we can easily
update it, but I agree, others may be in a different situation, so let's
fix this so that things are back to normal for everyone. That doesn't
mean that we shouldn't fix DTs when we can, so I'll still send out that
DT patch for Jetson TX1.

> btw if you can, also look at
> [PATCH] regulator: gpio: Reword the binding document
> the binding document could use a once-over.

Okay, I'll take a look.

Thierry

--huq684BweRXVnRxX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlxsN18ACgkQ3SOs138+
s6Gy9A//S1AE9wMZBOoQy/lqG38KTZMhqyWCCfEgtWkqNWbcmD7T0qb9e4lUum/7
jIpcksO6cFFtu8b4QbohY7T4+FoQR8gByk7GgHlpIAL1oQDjcUosqUa0xNFD9400
J1DsIRAQ9Pzm38hc5sf2kbIOG7LynJ77WF+GF9pR2Eb0VbUqfVI551Odp/Dj9IHk
TXBV0xehn48XXZhn9DGZf4CiG/z0wZt82P9qIHagfw4OUmu/OlAQ0kRczmURZezl
MXTQKBJi7lxm+7+beGzeHSqTfz63JeFAkUMb4/kwsAvEBlMWFJ5rw9M1f7W53irY
i6U5lRqcYh3tkYeKaWjuG1NZQylPj4JTkXtbaitd6yHsvm3iWn6GWMVptVQXNa4x
RhgAmv0AAeIg1ZxjEgiaX9uTofm3bRWHH9R9VmWvDWlh7vhhxDDFVYhRLNZXq0UO
rOWI1KpW+cq4ptl+L/Eo8LevSMvk9fSbT2PJe4nGr7CTOeTR6Me+wBR0HL2xV3It
E0uBEYI196N/Ry/OEGnrZ9gTN+A6wiDqmCWTJJYWIn3chBoxMLRJVxyQcgNcy0Fa
k0yM440RJ9/LSjzQPFZJ24Vuz9+HVMdY60THUCCMLy4MA35jxlhGzP8EIiBzrWjB
veD74+HprPLd2znMlqE1BPN900imQvbUoHMFCpbJiVldH6W2mnA=
=UhUV
-----END PGP SIGNATURE-----

--huq684BweRXVnRxX--
