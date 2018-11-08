Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:51519 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726721AbeKHUlx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 8 Nov 2018 15:41:53 -0500
Date: Thu, 8 Nov 2018 12:06:51 +0100
From: jacopo mondi <jacopo@jmondi.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v4 2/4] pinctrl: sh-pfc: Fix VIN versioned groups name
Message-ID: <20181108110651.GG24024@w540>
References: <1541500533-21843-1-git-send-email-jacopo+renesas@jmondi.org>
 <1541500533-21843-3-git-send-email-jacopo+renesas@jmondi.org>
 <CAMuHMdWsUWSmE2tbHhXEbNGrac+tw0o3kYnOrN21c30cq-c9kA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="7uYPyRQQ5N0D02nI"
Content-Disposition: inline
In-Reply-To: <CAMuHMdWsUWSmE2tbHhXEbNGrac+tw0o3kYnOrN21c30cq-c9kA@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--7uYPyRQQ5N0D02nI
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Geert
On Thu, Nov 08, 2018 at 11:59:08AM +0100, Geert Uytterhoeven wrote:
> On Tue, Nov 6, 2018 at 11:35 AM Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
> > Versioned VIN groups can appear on different sets of pins. Using the
> > VIN_DATA_PIN_GROUP macro now supports proper naming of said groups through
> > an optional 'version' argument.
> >
> > Use the 'version' argument for said macro to fix naming of versioned
> > groups for R-Car SoCs that defines them.
> >
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
>
> Fixes: 7dd74bb1f058786e ("pinctrl: sh-pfc: r8a7792: Add VIN pin groups")
> Fixes: a5c2949ff7bd9e04 ("pinctrl: sh-pfc: r8a7796: Deduplicate VIN4 pin
> Fixes: 9942a5b52990b8d5 ("pinctrl: sh-pfc: r8a7795: Deduplicate VIN4 pin
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

I added the Fixes tag to the single patches I've broke out and will
send in v5.

Thanks
   j


>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

--7uYPyRQQ5N0D02nI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJb5BjLAAoJEHI0Bo8WoVY8Fn4QALnACshMjd4dOrK6RODQb1F9
+xvuYF/cCN/IPEz2lMyrGzfZBzr3dms0sVmEpgBkNIwGOh5Rfplw55FADNZWyDJn
Ib1zYue2zM/7CTuWBvosD/qAEG7Bh01oztRf5BzZJC1t9D9IlCiQnvk98oLIbV1/
bqIkoEH0csUL8LxIqNb+bbeC9Y+TY8DOZ0JfbTmg5/ZAJBIJgBn3UwyKGuGQ+kEI
N3bc0MYWMkAsF0PKkHZHtAHdeCB0j5T7ZjTKiUTEbph137B1xHpcnFMk6S3kjVjx
htvTc0hCfT/fsCuZ8wFRDJiPyRHOTbevTUbc4r7bF4OS34BzXdTqeaLU9G2GPC7Y
OWfwg5JezN3b6zipAbx2atjMSAN+n3lHer/K3dZNZw0cd92+4e/d1nTo4YxRJzaL
Vb+9cXwRBZ4MbjRZKMr23CFASA4FovsmZv1Zt2Vn57Z7ttBSN++TAvn9HYGPajsz
VkN93W+3zzoCSRyFnwYYdkUrXM2ecpmNW4vfnA2zG7eN0oyR1TcUJS+ezSxy3qgy
vgG5MdmeW3W1DMqly7jnyctSVJPxVyN1TPjf/OlP7JevKSXkkSuJU1HBsWxVfA+X
ClKBLm4q8ksP6vOPT9MV2uDzpM2Dco+73+Q7K7T/5RQohlt7Q4mmviSfJKSzJEhA
AuWHe1DUnrswRAvdZD1V
=zVD9
-----END PGP SIGNATURE-----

--7uYPyRQQ5N0D02nI--
