Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:35375 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751184AbeERLww (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 May 2018 07:52:52 -0400
Date: Fri, 18 May 2018 13:52:43 +0200
From: jacopo mondi <jacopo@jmondi.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-sh@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 0/2] Remove calls to empty arch_setup_pdev_archdata()
Message-ID: <20180518115243.GA4432@w540>
References: <1526641611-2769-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="bg08WKrSYDhXBjb5"
Content-Disposition: inline
In-Reply-To: <1526641611-2769-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--bg08WKrSYDhXBjb5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Geert,

On Fri, May 18, 2018 at 01:06:49PM +0200, Geert Uytterhoeven wrote:
> 	Hi,
>
> Recently, a few calls to arch_setup_pdev_archdata() were added to the
> ecovec and migor board files (copied from platform_device_register())?

I suspect that was me

>
> However, SuperH doesn't implement arch_setup_pdev_archdata(), and falls
> back to the default (empty) implementation.  As this code is
> board-specific, the calls can just be removed.

Thanks for looking into that.

Acked-by: Jacopo Mondi <jacopo@jmondi.org>

Thanks
   j

>
> Thanks!
>
> Geert Uytterhoeven (2):
>   sh: ecovec: Remove calls to empty arch_setup_pdev_archdata()
>   sh: migor: Remove calls to empty arch_setup_pdev_archdata()
>
>  arch/sh/boards/mach-ecovec24/setup.c | 2 --
>  arch/sh/boards/mach-migor/setup.c    | 1 -
>  2 files changed, 3 deletions(-)
>
> --
> 2.7.4
>
> Gr{oetje,eeting}s,
>
> 						Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
> 							    -- Linus Torvalds

--bg08WKrSYDhXBjb5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJa/r6KAAoJEHI0Bo8WoVY82LwP/1cxACVID1it0L++O9Ey3Wme
c/ucOz/wdV5tTNvCFhIR8UdjEelPLfczCfa1g8p2nWQyHlA3Al8Ec82i6IrG4Itp
sc2LAcBafi3yjh2q5YetHu0+/tmH5KuUn0Gn1e3VsjrxhjYdYHBQa6SmGDteuyy6
XSX/mh9gOJE0ryIRQfSBBTGjwTyHboAjhHhJCh0ehUpSwxelu7EQA+gEx4fLqsYT
hcX8Gn0QyyZ5rpxJqd2nltQxd7HnEvzZH8B25fXSdiVu1eAo62yCynZMdQxLtUhr
vjnBNTxvCBZFZrusNYXkAB8vexT+w/K8CF+6XYK0qcW425/zBrov8pkF4dVsr+Zb
l/NtXqa9xYKiU7Ehw9SC6x+wWM8trhVWc/RFA3jdRzb0ycyC1HsTXoXGoVz9xjw+
KRDAca5Xspx2sXubl4Max0UTMKPH2Jbm02ZbZq3JNmVADkWKf6Wx6P/RPP3Cln6Q
bMdHwv0ijfKXls4XLe4i3mRqWYOcEIvj1FV74H7GI1oLGNhWPGqWdq0uyW0N8Fz2
l7sAPl1/jGN/SnAHhM6W/3L2QF0z79q/WfIPhFSogqZ58zTETVCT1p0kSlul5qdF
fSim18Agl5o1Ey9fLrFIwzkeATsGhrR2ycIy9Y/MkQeNBwBnsUWtytxx5PF56i5e
3/txBONEwzVvba4lZzsV
=JGip
-----END PGP SIGNATURE-----

--bg08WKrSYDhXBjb5--
