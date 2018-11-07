Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:38801 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726218AbeKGU3w (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 7 Nov 2018 15:29:52 -0500
Date: Wed, 7 Nov 2018 11:59:49 +0100
From: jacopo mondi <jacopo@jmondi.org>
To: Simon Horman <horms@verge.net.au>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, geert+renesas@glider.be,
        laurent.pinchart@ideasonboard.com, linus.walleij@linaro.org,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v4 2/4] pinctrl: sh-pfc: Fix VIN versioned groups name
Message-ID: <20181107105949.GC24024@w540>
References: <1541500533-21843-1-git-send-email-jacopo+renesas@jmondi.org>
 <1541500533-21843-3-git-send-email-jacopo+renesas@jmondi.org>
 <20181107104134.j2agucwh6kxhrknl@verge.net.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="pAwQNkOnpTn9IO2O"
Content-Disposition: inline
In-Reply-To: <20181107104134.j2agucwh6kxhrknl@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--pAwQNkOnpTn9IO2O
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Simon,

On Wed, Nov 07, 2018 at 11:41:34AM +0100, Simon Horman wrote:
> On Tue, Nov 06, 2018 at 11:35:31AM +0100, Jacopo Mondi wrote:
> > Versioned VIN groups can appear on different sets of pins. Using the
> > VIN_DATA_PIN_GROUP macro now supports proper naming of said groups through
> > an optional 'version' argument.
> >
> > Use the 'version' argument for said macro to fix naming of versioned
> > groups for R-Car SoCs that defines them.
> >
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
>
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
>

I'm going to split this patch for each SoC to ease backporting, as
Geert suggested. Provided the single patches content is the same as
here, can I retain your R-b tag?

--pAwQNkOnpTn9IO2O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJb4sWlAAoJEHI0Bo8WoVY8mZgP/1nZAEQqnpkAL6pLeVnyGCSp
WgFsnMvUNYpRaPs/ZvYc75afMZ53RzkPgdwZLPMxeSprO1CyQeTYVoN66PhvwU5C
BcwPh6zzRfUZCswCLNX00nHdFZQjhRnoeUPnHLRZQBOwlSR+zkfsrLjsgT7PHAVt
qc2xoF7QDoiKYfdTmxDorVXl1nHtD4ROuWi8lmaCU8PPpNhXVf5N0a1fFhwiObBp
jZOwTH8BUEup9glHkAV+4F2PAXA6vYDZK7Mg9VNySDTcmICnR5vtw1qwRiy5x1TN
v/lfMUFrGoQJ0lgVtlbIxZPFxbc3O9sDfhH/gScU0Cbau3QafJtABd2d+qKo4r2C
XZWOC7FtBEzCoGSbvy5B3nTlqePen8p8RGIpiiboOfEGcntXoZJeskHDRMV+oTJC
r5WGTRtqkmwzwgXnmMVmJwR/Q/oNnwxv7Gixc33Rn8LpV5t/hRv1/hGGzy4Gds+I
5Q8CzaoYbORuyxct6v6zZVhg1OS8RqkVlNSYv4kyVtYgACy6unzizXTxYh7LEjC4
IM7DJCYf3tmt3s2MIzvND6TWJ7GtdQk8pDODbf4zn5JJPQURUJeWgniwY1GtpjhW
DAMUwJn+lVb9cmF8rR5rgy6IzSQOUDt+gjqRbeFgTz270kIuLpZacVOLGBQhomoS
967UXSP2vzqojlO+QfFi
=24QW
-----END PGP SIGNATURE-----

--pAwQNkOnpTn9IO2O--
