Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:55631 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727462AbeHJSsN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Aug 2018 14:48:13 -0400
Date: Fri, 10 Aug 2018 18:17:32 +0200
From: jacopo mondi <jacopo@jmondi.org>
To: Eugeniu Rosca <roscaeugeniu@gmail.com>
Cc: Simon Horman <horms+renesas@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>,
        Niklas Soderlund <niklas.soderlund+renesas@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Magnus Damm <damm+renesas@opensource.se>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Eugeniu Rosca <erosca@de.adit-jv.com>
Subject: Re: [PATCH 09/14] dt-bindings: arm: Document Renesas R-Car
 M3-N-based ULCB board
Message-ID: <20180810161732.GF7060@w540>
References: <20180804231114.21420-1-erosca@de.adit-jv.com>
 <20180804231114.21420-10-erosca@de.adit-jv.com>
 <20180805081543.GH4528@w540>
 <20180805224002.GA15682@x230>
 <20180810134844.GB27396@x230>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="uTRFFR9qmiCqR05s"
Content-Disposition: inline
In-Reply-To: <20180810134844.GB27396@x230>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--uTRFFR9qmiCqR05s
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello Engeniu,

On Fri, Aug 10, 2018 at 03:48:44PM +0200, Eugeniu Rosca wrote:
> Hi again Jacopo,
>
> On Mon, Aug 06, 2018 at 12:40:02AM +0200, Eugeniu Rosca wrote:
> > Hi Jacopo,
> >
> > Thanks for your comments. Please, find my replies below.
> >
> > On Sun, Aug 05, 2018 at 10:15:43AM +0200, jacopo mondi wrote:
> > > Helle Eugeniu,
> > >
> > > On Sun, Aug 05, 2018 at 01:11:09AM +0200, Eugeniu Rosca wrote:
> > > > In harmony with ATF and U-Boot outputs [1] and [2], the new board is
> > > > based on M3-N revision ES1.1 and the amount of memory present on SiP
> > > > is 2GiB, contiguously addressed.
> > >
> > > Not sure why the amount of installed system memory is relevant for
> > > this commit..
> >
> > To be honest, I don't know precisely what's encoded in the board string
> > (particularly the one documented in this commit RTP0RC77965SKBX010SA00).
> >
> > The only thing unmistakenly present there is the SoC model 77965 (i.e.
> > M3-N), but I am quite clueless about the rest.
> >
> > What I can say for sure is that the end-user experience of a R-Car Gen3
> > reference board clearly depends on below parameters:
> >  - [A] SoC (model, revision) including SRAM and on-chip peripherals
> >  - [B] DRAM (amount, linear/2ch/4ch split)
> >  - [C] Hyperflash (amount)
> >  - [D] board's PCB (revision)
> >  - [E] board's off-chip peripherals (model, revision)
> >
> > I don't know how many of these parameters are embedded in the board
> > string, but since you are suggesting that RAM amount is not (IOW
> > Renesas will potentially release several RTP0RC77965SKBX010SA00
> > boards with different amounts of memory), I will happily update
> > the commit description.
>
> Since I found two H3-ES2.0 Starter Kit samples with different amount of
> RAM (4 vs 8 GiB) each having a unique board id [1], I take this as
> evidence that Renesas encodes the amount of RAM in the board id.
> Therefore, I will not change the description of this patch in v2,
> unless you comment/NAK. Thank you.
>

Thanks for digging into this, feel free to ignore my comment.


> [1] https://patchwork.kernel.org/patch/10555957/#22169325
>
> Best regards,
> Eugeniu.

--uTRFFR9qmiCqR05s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJbbbqcAAoJEHI0Bo8WoVY80NcP/3yoLrhvLKtcp3rrSRyWuZBR
mrVODDH6gsXq3Ka/yw/BODGbIKmNjGpC3ydXztPxk2RjEmr1jIpReHlMwlxyyYLZ
ssfUNh7OpHmZa6M4uFieQITTQJiTLLsGXX4LdA5DHlz/vAouSruh4C9AZjEnF1wf
K2J5ELdc904FJpwJah/x2oAF6WSe2Fe7WnecxXsU1xg6gPXWx8EdXUCc25DgCqjq
cGQDCg6Wx7lQajTXH2YpxpQvPB5ZMJ4HyFKWNvAA+S2O/oCl+F2LE4wPYg1U8t+O
EvkKEQX6TRKG9drjuPqefbnI4Zl01ra0yHF8iRNTz8ezy2m1jwe3XyTGY1aW0FH3
09civHFjVmAh/7gE6rAa4EU5zc7ufVhntLLRaNEiXoTMsDxM4Z80njtjMNF8RVLz
9eFBvisRYFXk00lzTsGA4TOzCYZCFtZHhHkzp/BEjzIwnIXAZSyHDzxheog+iYLZ
oJuGdf08b8tV5PWVaFzTY9OMGrd4TfgoHdUo18VraNmQJ9Ic0Ji2e1AqYD2O0AW4
yitVYd6sPKlr7mrhG7SEx3Y2fbVKg8E2u3Op62Qdqb99BjZ9+EPObnX6K7BXGNy9
Aj5lCq2g1pdt9fCvu49bNXFITz5mbwg/iIIRYM7T6NyvHZpybHlaVzwlUTu7XGs1
haNkLMXaqCovSnFrp7sS
=eYtA
-----END PGP SIGNATURE-----

--uTRFFR9qmiCqR05s--
