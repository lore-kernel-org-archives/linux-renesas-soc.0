Return-Path: <SRS0=Daww=Q3=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 772E8C43381
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 20 Feb 2019 10:20:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 435192147C
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 20 Feb 2019 10:20:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HAyOvb2k"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726439AbfBTKUD (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 20 Feb 2019 05:20:03 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:38210 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726142AbfBTKUD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Feb 2019 05:20:03 -0500
Received: by mail-wm1-f67.google.com with SMTP id v26so5831361wmh.3;
        Wed, 20 Feb 2019 02:20:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=XBoigXLd8cLCAHf2jtcxSYECH++g6CmBSxWygoMLcXs=;
        b=HAyOvb2kBNPlzRWN+j8et/IVzNAAvAK4GQFzMQzcZdgulENYPZtDPlHem4Dy9CkPg6
         S24m89USmFqunqFk4dMeKgaTpEOIUES9z2kX+Hko9nph8z1n+iB1IHqyLxyncMjC/pUK
         tluMRkZGKCtsn1CH+lgCI+qLXTCJdapah3iexxmAuXqGThmbGvwrpwhwcViyo7SULvYP
         bL41PuLeDUDSVf++R2cYK5a2T5Q+gZ7sh8G4NucJM/l1TXMcGEBNpnW1NRdrpTBlPShO
         oZXxQItZh7MNKBvkGCGOqi8SBZe2m/MqEzkT3qAVEtTwDTz6/HwiOt35VMbbJ7HeMruF
         RufA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=XBoigXLd8cLCAHf2jtcxSYECH++g6CmBSxWygoMLcXs=;
        b=rlGc7cBUATip5tqsQXmkpkNWWw/jVHXjThAJFa/yjucmcfbh6Sa+U2i1sFnNNU3hm3
         YdNngjAcaP2ud1RlgTF/Zzy09eCbPqUaE91K0V83ceEz3TLSa+FKHJFUuYx0KswVB7tu
         rcI0gwGhJ0nr5Su+YB0Bj9UGswf/MsXsZsb1UFZAIzwB6ZHWpBr6qtauQy6PEb2ZZKEE
         bN3pC6ZXVsrAvAJOpfnxElAo23sYrJ4nArFS9jhcpNr3IHUTk3hLlBcFudk6TI645c6Q
         RrhjUHB58Y+0Jbpv5pBq5nybBnC5m9rh5PLdPRzeNcslTnb+o9ZyJAPUQZDboCpt5fOq
         8aqQ==
X-Gm-Message-State: AHQUAuZt1+Kp8W8gy/lUtq9SlbG5y2wPCcRNri1433mSCnHiMcjAtHjk
        E1fdfaNebi/b6go4McALf9A7e59F
X-Google-Smtp-Source: AHgI3IY47GM3/fdvRLNWMIaL8aCS0gMP8a2ehNn9TQdGDyKDRjqKNqHJ7S/VzWwxxGwFxAVm3z9cjw==
X-Received: by 2002:a1c:4406:: with SMTP id r6mr5980885wma.114.1550658000291;
        Wed, 20 Feb 2019 02:20:00 -0800 (PST)
Received: from localhost (pD9E51D2D.dip0.t-ipconnect.de. [217.229.29.45])
        by smtp.gmail.com with ESMTPSA id w12sm12273668wrr.67.2019.02.20.02.19.58
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Feb 2019 02:19:59 -0800 (PST)
Date:   Wed, 20 Feb 2019 11:19:58 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Marek Vasut <marek.vasut@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Jan Kotas <jank@cadence.com>, Mark Brown <broonie@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH] gpio: of: Apply regulator-gpio quirk only to enable-gpios
Message-ID: <20190220101958.GA7498@ulmo>
References: <20190216134627.1601-1-marek.vasut@gmail.com>
 <20190219151811.GA13354@ulmo>
 <631beb2b-786e-e182-acea-561b0706b041@gmail.com>
 <20190219160800.GA30280@ulmo>
 <805f638e-2d55-803b-b09c-617d3a503408@gmail.com>
 <CACRpkdb6g4fd2bXg81p1+iQ4Vgm0d+Z3nW38qy9D+romM0aj1g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="X1bOJ3K7DJ5YkBrT"
Content-Disposition: inline
In-Reply-To: <CACRpkdb6g4fd2bXg81p1+iQ4Vgm0d+Z3nW38qy9D+romM0aj1g@mail.gmail.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--X1bOJ3K7DJ5YkBrT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 20, 2019 at 10:01:50AM +0100, Linus Walleij wrote:
> On Tue, Feb 19, 2019 at 5:30 PM Marek Vasut <marek.vasut@gmail.com> wrote:
>=20
> > Handling broken DTs only adds to the complexity, but I think this cannot
> > be helped, since those DTs can be stored in some ROM.
>=20
> I agree, but if the broken DT needs to be supported going forward
> I would like it to be quite explicit, so that the code down in
> gpiolib-of.c does this:
>=20
> /*
>  * Comment about this machine
>  */
> if (of_machine_is_compatible("nvidia,problematic-board") {
>    /* Quirk for this specific DT for this machine*/
> }
>=20
> This makes the standard behavior clear and avoids the risk
> of applying hairy machine-specific quirks to any other machine,
> but even more importantly it makes it easy for people reading
> the code to see what is going on and why.

At the risk of repeating myself: the device tree bindings for regulator-
fixed are very clear: any flags in the specifier are ignored and the
polarity of the GPIO is determined exclusively by the enable-active-high
property.

This means that, contrary to what I said earlier, the Jetson TX1 device
tree is not actually buggy. Is it confusing and inconsistent? Yes it is.
But it was never wrong according to the bindings.

The commit that you merged broke the ABI set forth in the bindings by
not applying the quirks necessary to adhere to the bindings for these
fixed regulators. It was supposed to only avoid the quirks for GPIO
regulators, which are an entirely different thing.

Given the above, I don't think adding the quirk for a specific machine
is acceptable. There could be any number of device trees that rely on
the literal interpretation of the device tree bindings and they would
all remain broken if we added a quirk only for Jetson TX1.

Thierry

--X1bOJ3K7DJ5YkBrT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlxtKcsACgkQ3SOs138+
s6FASBAAkNJDRXkw9VmLm9WWKriTg6VMM6LEiZPQ5sRbmCRRTdzNjulHuyT8fICQ
NsDg9dpGwqftwXxlQdHFMNRZyaqEXAv+0HeCjtodBqdPs6ZxnNWQg4eeg2Xur2nH
Ek1DqzIvXrWhEBJa/xibEfIKHt5xbIt3g9uAT/ZypeifEpNKOPbtbeuTvIK0+rqP
YQOzqhG4rkzdsm3geaP+W+i5dYf2bARKvwMvdVk4Zfgcf6KH91ssGkGmKk6bYwjv
OxrHV8BnS9/p6/3pYM+/bGJEf1oS1TBVioERT6hxl+WnXLX8H+snDFHu3fZWzgyf
SBibttYw3iimGKE/0PScjyWJJSQoPqEe3zkT9Qm5PfeXZdHqeNmfDosFbpRoFpz9
c0of+F48Nq2BJuU3Mg3HI/5KmPwPzku9f5X8NSNMRbTf3JwNj4O/edvHdjStSn7O
kodsKPqPcDyVppwiju1dgaiTRtyhvZpS7jgn7vJ+A9tN2AuUzP2o7PPg3dG+uxwi
nJcp/UW8xAv1Yzv2J0d3BrGOYce3vcblT1NqbxbrVCms1G2nOSZ9pd/4eIyhpDn+
KRtsHfqVjBri0zyYnU4SjuckZrYoFa+V+g175ocGHlxzESTG06Jg/yPRj7HnUxI9
sthKFpgtLl7z0B8cpTEgNC161bGwBwcCgaFMq5U2vMuEA2DwB+4=
=r2E9
-----END PGP SIGNATURE-----

--X1bOJ3K7DJ5YkBrT--
