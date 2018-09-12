Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:52345 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727673AbeILQM3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Sep 2018 12:12:29 -0400
Date: Wed, 12 Sep 2018 13:08:21 +0200
From: jacopo mondi <jacopo@jmondi.org>
To: Simon Horman <horms@verge.net.au>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>, geert@linux-m68k.org,
        kieran.bingham+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, damm+renesas@opensource.se,
        ulrich.hecht+renesas@gmail.com, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 8/8] arm64: dts: renesas: ebisu: Add HDMI and CVBS
 input
Message-ID: <20180912110821.GX28160@w540>
References: <1536161385-25562-1-git-send-email-jacopo+renesas@jmondi.org>
 <1536161385-25562-9-git-send-email-jacopo+renesas@jmondi.org>
 <2026479.hHFyJyWhrN@avalon>
 <20180912092950.us5wtr7x7vci6xr5@verge.net.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="mF+UrcnZFczIwKjY"
Content-Disposition: inline
In-Reply-To: <20180912092950.us5wtr7x7vci6xr5@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--mF+UrcnZFczIwKjY
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Simon,

On Wed, Sep 12, 2018 at 11:29:51AM +0200, Simon Horman wrote:
> On Mon, Sep 10, 2018 at 05:21:08PM +0300, Laurent Pinchart wrote:
> > Hi Jacopo,
> >
> > Thank you for the patch.
> >
> > On Wednesday, 5 September 2018 18:29:45 EEST Jacopo Mondi wrote:
> > > Add HDMI and CVBS inputs device nodes to R-Car E3 Ebisu board.
> > >
> > > Both HDMI and CVBS inputs are connected to an ADV7482 video decoder hooked
> > > to the SoC CSI-2 receiver port.
> > >
> > > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> >
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> Jacopo,
>
> I assume that this patch depends on 7/8.
> Please repost this patch when you repost that one,
> addressing Laurent's feedback.

Sorry, I'm now confused :)
I don't see any pending comment on [7/8] nor on this one ([8/8]).
[7/8] has been applied to your "arm64-dt-for-v4.20" branch already
(just checked).

I have a small comment on [6/8] and one open question on [5/8]. All
the other patches have been reviewed/acked already.

To sum up: do you want me to repost [7/8] when re-sending this series?

Thanks
   j

--mF+UrcnZFczIwKjY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJbmPOlAAoJEHI0Bo8WoVY8SBMP/jhAs1minK9VP/Fw/Fl5pzOz
+Hk0UkqTL0atn+T4dAVIEaqaBVqUedYbK2tkuPVyzicRyMgefPQYTig2XJbmTcwa
5f89Mt3k7O8rsKbo17YSNQTvMVHXALk11OvrQzFVJy+ABNI8z4I7f/dz1HCIpE/b
tvRenk2ZARrRiAEzzTqaWBCLBcYSUcyxLErSFVwWS3C7Nfjzrcw10V5nLyx0TJaL
P23rGr0IqVA2YJj3Xsg3eCgth58h5VIWVQ3Vq7fvUOubYAP6TOCo0bYbNNM8t4f6
k5ZBzcrXt86cayXpEyN4qmPUo8bHlF7wUv77UJg52LcPFWABAipNT9kM6rVbYu4D
xooVIvk4AxPJ+QUDW9g27F/JTdUKG6AmXFZ/xxJ4Jegv+Kt45KOZWvCeQmLSgnhF
hJTLuzdpOOh3MWIwxIW6OHNsEr0Z4fAS//npnrYncLAsPGeRkcrMuL6tOJlCd0jd
GNUW8n9gm2HYLzqCaXv8jWgD7cp7D5k2Eu0RPY9Y0pHoIUI6138Ls3ZDg04SJI1T
CxkKCn/7grkGeKgxinw4JhUrnvfzNmAY5mBbuG7K4QuCPGwGbS2Q7xQ0JGzA6wu4
2/lOTga654qljiHOq8e5du8D+3wphueuVxIBodT3rw4iDcuaipjNTJqNLnsFf7jx
PRvpxYocoFDDYOX9lB1w
=TkLd
-----END PGP SIGNATURE-----

--mF+UrcnZFczIwKjY--
