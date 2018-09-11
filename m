Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:42847 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726476AbeIKNwu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Sep 2018 09:52:50 -0400
Date: Tue, 11 Sep 2018 10:54:24 +0200
From: jacopo mondi <jacopo@jmondi.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Simon Horman <horms@verge.net.au>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        Magnus Damm <damm+renesas@opensource.se>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v2 5/8] pinctrl: sh-pfc: r8a77990: Add VIN pins, groups
 and functions
Message-ID: <20180911085424.GR28160@w540>
References: <1536161385-25562-1-git-send-email-jacopo+renesas@jmondi.org>
 <1536161385-25562-6-git-send-email-jacopo+renesas@jmondi.org>
 <20180910130115.z6qwfzrimg3ceyup@verge.net.au>
 <20180911074448.GQ28160@w540>
 <CAMuHMdXbdm4=TzAkoc2KmS+m69ppOM6GXCgHTCoDS1-1MZ=RgQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="7gQyIpR7q4QSXYu+"
Content-Disposition: inline
In-Reply-To: <CAMuHMdXbdm4=TzAkoc2KmS+m69ppOM6GXCgHTCoDS1-1MZ=RgQ@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--7gQyIpR7q4QSXYu+
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Geert,

On Tue, Sep 11, 2018 at 10:15:23AM +0200, Geert Uytterhoeven wrote:
> Hi Jacopo,
>
> On Tue, Sep 11, 2018 at 9:44 AM jacopo mondi <jacopo@jmondi.org> wrote:
> > On Mon, Sep 10, 2018 at 03:01:15PM +0200, Simon Horman wrote:
> > > On Wed, Sep 05, 2018 at 05:29:42PM +0200, Jacopo Mondi wrote:
> > > > This patch adds VIN{4,5} pins, groups and functions to the R8A77990 SoC.
>
> > Currently there are two open questions on this PFC patch:
>
> > 2) VIN5 synchronism signals (V/HSYNC, CLKENB, FIELD) are marked as
> >    "_A" only, while VIN4 ones have not _A or _B extensions and are
> >    shared between _A and _B group. The VIN5_#_A extension is an
> >    indication that synchronism signals for group _B are not
> >    multiplexed but active be default according to Morimoto-san, that
> >    is about to confirm this with HW team. In that case, we need to
> >    decide if to provide an 'vin5_sync_b' group anyway to let user
> >    select it from DTS. Otherwise it won't be possible to select
> >    synchronism pins for VIN5_B group (which is maybe fine if they're
> >    not multiplexed at all).
>
> If the a "B" sync group exists, the pins are probably configurable as GPIOs,
> too, so we probably do need a group for them in the driver.
>

The chip manual does not report any _b group, and I don't have any E3
pin-related documentation like I have for M3-W/N
(r01uh0802ej0100-r-car-3rd-pin.pdf,
ASOM-C18-201_R-CarM3_pinfunction.xls etc etc)

How to find it out? Morimoto-san have you heard any news from HW team?

Thanks
   j

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

--7gQyIpR7q4QSXYu+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJbl4LAAAoJEHI0Bo8WoVY8b4gQAKr7tAE5D2Rt8lWdfW3Elbp4
Q5eZOumbDSdXJb/vTgxeQBEpGRB+vHniMty57k04sdhOAVfsaqsyXkgx6V3GphI2
WpyCd7Php1r94/JGNwt4V1ZNqkHiWJcEmZf7JQ3OPiUJQdM/mOvbze1LAyoNjd5R
JZraUcF41gPliVTfR9jxLmrxp0mbAxGF9XKcUDVmmnDH4ZotIR8+H8Nph79/UPzM
MPRqw1paRxGxdJuCOyOI6Ccd9smvriaktXCiRggYlXCBTwIcdSDQJkmup6VbDiVS
Zvwr2AptcxHSNa5f2V0+8oIav2H5/1B/E8zLcxrFU6ZlPCGhGloXaZ+oHsk3G5uC
qHo+dKsvC3+u3OaJRZdf0+XGsFlN8XHS7tZc/gWxd+iMJx9Gmn+ejDPqLZAgvVLI
3jF/azvSmbbLtCxfgAE354xXQKvP2+o2/nKnw8tE6wlX+jT7cz/qE7ZdFIETPSDO
tiO4JSs1th5yBNMV5K0npMEKpbkwFc38wCV6OCAfJ1DfNyLoVIfuHBe2gdQdf7XZ
ZzPusGmk/xh9Dx2ux4v/mWdX25C2hTRRIQlH5g44K3gWe4V7CbmuDWaUp6a4y595
bEkNaB4csfC+10T36YJxX3VO7e6O55aLd15wup3K6dxtZih9/C1CxqjMdrpAXSgo
knhoN0FDSRv+6w5ceRO2
=d/kv
-----END PGP SIGNATURE-----

--7gQyIpR7q4QSXYu+--
