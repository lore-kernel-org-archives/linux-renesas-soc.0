Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:47517 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725995AbeIDTPW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Sep 2018 15:15:22 -0400
Date: Tue, 4 Sep 2018 16:49:53 +0200
From: jacopo mondi <jacopo@jmondi.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Subject: Re: [PATCH 12/16] arm64: dts: renesas: r8a77990: Add I2C device nodes
Message-ID: <20180904144953.GE28160@w540>
References: <20180904121027.24031-1-laurent.pinchart+renesas@ideasonboard.com>
 <20180904121027.24031-13-laurent.pinchart+renesas@ideasonboard.com>
 <CAMuHMdUPQn4HgkXB1E-nkDef9-HTsb1jCMPNZGoD9oqxGkS2Tg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="lkTb+7nhmha7W+c3"
Content-Disposition: inline
In-Reply-To: <CAMuHMdUPQn4HgkXB1E-nkDef9-HTsb1jCMPNZGoD9oqxGkS2Tg@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--lkTb+7nhmha7W+c3
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Laurent, Geert,

On Tue, Sep 04, 2018 at 04:32:32PM +0200, Geert Uytterhoeven wrote:
> On Tue, Sep 4, 2018 at 2:10 PM Laurent Pinchart
> <laurent.pinchart+renesas@ideasonboard.com> wrote:
> > From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> >
> > Add device nodes for I2C ch{0,1,2,3,4,5,6,7} to R-Car E3 R8A77990 device
> > tree.
> >
> > Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
>
> My
>
>     Reviewed-by: Geert Uytterhoeven <geert+renesas@xxxxxxxxx>
>     Tested-by: Geert Uytterhoeven <geert+renesas@xxxxxxxxx>
>
> are still valid.

I was about to send a v2 with these and the slight change Geert
suggested on the ch[0-7] list.

Would you prefer me to drop it from my v2 series and re-base HDMI and
CVBS enablement for E3 on top of this series?

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

--lkTb+7nhmha7W+c3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJbjpuRAAoJEHI0Bo8WoVY8R98QAKmkeT3/6DNM84PF3EAr0z+i
lUNP/w9MS/OMwFHxUEwKDzf3vKYq/DJuQZHUkekgQrFy/fB3xUDzB3+KbKnZY5ne
temZSq7bo/U1TG2begJVUN/5If0s3qPzqA74Vohwhvn2n0/mcYmoC205Tmee3b4W
EF4l0qJokI0LFkQgB+fuWn61PUl3zicTCiUzvBoEidzXb6g4YJsjbR6Ps2CeGBsB
JsRjsnS2auJvnmfXkl/dmE9eNlvgpxTIAY6N0edkyqMNOJlC+uzwO1nEsUoWGHNd
YWB52UGxRsi8k2iUX1L5W58S3ZekyL2zz1oK/UYz42zZbCoOkxq+icT18/ATzs+i
CSRTVYRD9pm4NdB827Us0aTrQVDaJvQ20EsBIMB2zknpJQ7ubBNmQZT36N2gupAd
6sgFHZJiImghOCO/V7E2McECbljc5UkRo1VpNdWRepGEbNlxsRRC9Ty7B1Euzobe
emsR7kYjoyjag35VA9BXbg0xU6QK+Q+Lp2E1QNc/SwUyKrC3AFoIgtY/zMqFhvbg
/d/A0HgqdBveY42ico1CcpEai3fMsd2VmqJm5VotTrRJunmEHjndvTuljP5oh35I
rlVSDeGi7BlLl5OxjEGO33gXXniSkFzRdTctooOSU+dJfSSX1uWNOEhC9f6Yyy6B
cL/zLUr3jSTKsAQIBwG4
=jhbG
-----END PGP SIGNATURE-----

--lkTb+7nhmha7W+c3--
