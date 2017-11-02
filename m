Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:14374 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751341AbdKBEKv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 2 Nov 2017 00:10:51 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Konrad Rzeszutek Wilk <konrad@kernel.org>
CC: Geert Uytterhoeven <geert@linux-m68k.org>,
        Konrad Rzeszutek Wilk <konrad@darnok.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>
Subject: RE: [PATCH 1/2] mmc: renesas_sdhi: fix swiotlb buffer is full
Date: Thu, 2 Nov 2017 04:10:46 +0000
Message-ID: <TY1PR06MB0992CBE1B122C62BD5E1C227D85C0@TY1PR06MB0992.apcprd06.prod.outlook.com>
References: <1508225421-25405-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1508225421-25405-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdXyY-gvQGn2UxhUDsdhdWUMmTA80z73PF14otvcKuTMaw@mail.gmail.com>
 <20171019002412.GA14493@localhost.localdomain>
 <CAMuHMdUs+dLq8LJTJoUQEUzJAKXCfD0JBtVnHPyN6XdppVy5qQ@mail.gmail.com>
 <TY1PR06MB09928E11C2AFFD55EF68961CD8420@TY1PR06MB0992.apcprd06.prod.outlook.com>
 <TY1PR06MB09929A4BF1E2A5DBD54845DED8430@TY1PR06MB0992.apcprd06.prod.outlook.com>
 <20171101132639.GA24821@x230.dumpdata.com>
In-Reply-To: <20171101132639.GA24821@x230.dumpdata.com>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi,

> From: Konrad Rzeszutek, Sent: Wednesday, November 1, 2017 10:27 PM
>=20
> On Fri, Oct 20, 2017 at 03:18:55AM +0000, Yoshihiro Shimoda wrote:
> > Hi again!
> >
> > > From: Yoshihiro Shimoda, Sent: Thursday, October 19, 2017 8:39 PM
> > >
> > > Hi Geert-san, Konrad-san,
> > >
> > > > From: Geert Uytterhoeven, Sent: Thursday, October 19, 2017 5:34 PM
> > > >
> > > > Hi Konrad,
> > > >
> > > > On Thu, Oct 19, 2017 at 2:24 AM, Konrad Rzeszutek Wilk
> > > > <konrad@darnok.org> wrote:
> > < snip >
> > > > >> > diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/d=
rivers/mmc/host/renesas_sdhi_internal_dmac.c
> > > > >> > index f905f23..6c9b4b2 100644
> > > > >> > --- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> > > > >> > +++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> > > > >> > @@ -80,8 +80,9 @@
> > > > >> >         .scc_offset     =3D 0x1000,
> > > > >> >         .taps           =3D rcar_gen3_scc_taps,
> > > > >> >         .taps_num       =3D ARRAY_SIZE(rcar_gen3_scc_taps),
> > > > >> > -       /* Gen3 SDHI DMAC can handle 0xffffffff blk count, but=
 seg =3D 1 */
> > > > >> > -       .max_blk_count  =3D 0xffffffff,
> > > > >> > +       /* The swiotlb can handle memory size up to 256 kbytes=
 for now. */
> > > > >> > +       .max_blk_count  =3D 512,
> > > > >>
> > > > >> Fixing this in the individual drivers feels like the wrong solut=
ion to me.
> > > > >>
> > > > >> iommu: Is there a better (generic) way to handle this?
> > > > >
> > > > > Yes. See 7453c549f5f6485c0d79cad7844870dcc7d1b34d, aka swiotlb_ma=
x_segment
> > > >
> > > > Thanks for the pointer!
> > > >
> > > > While I agree this can be used to avoid the swiotlb buffer full iss=
ue,
> > > > I believe it is a suboptimal solution if the device actually uses a=
n IOMMU.
> > > > It limits the mapping size if CONFIG_SWIOTLB=3Dy, which is always t=
he
> > > > case for arm/arm64 these days.
> > >
> > > I'm afraid but I misunderstood this API's spec when I read it at firs=
t.
> > > After I tried to use it, I found the API cannot be used for a workaro=
und because
> > > this API returns total size of swiotlb.
> > >
> > > For example:
> > >  - The swiotlb_max_segment() returns 64M bytes from the API when a de=
fault setting.
> > >   - In this case, the maximum size per a map is 256k bytes.
> > >  - The swiotlb_max_segment() returns 128M bytes from the API when I a=
dded swiotlb=3D65536
> > >    into the kernel parameter on arm64.
> > >   - In this case, the maximum size per a map is still 256k bytes beca=
use
> > >     the swiotlb has hardcoded the size by the following code:
> > >      https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.g=
it/tree/lib/swiotlb.c?h=3Dv4.14-rc5#n254
> > >
> > > So, how do we handle to resolve (or avoid) the issue?
> >
> > Anyway, I made v2 patches by using swiotlb related definitions. Would y=
ou check it?
>=20
> Did I miss that email? As in was I cc-ed?

This was my fault. When I submitted v2 patches, I didn't include your email=
 and iommu mailing list...

> > https://patchwork.kernel.org/patch/10018879/
>=20
> Why not use IO_TLB_SEGSIZE << IO_TLB_SHIFT or alternatively
> swiotlb_max_segment?  See 5584f1b1d73e9

I already made such a patch as v2 and it was merged into mmc.git / fixes br=
anch.

https://git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc.git/commit/?h=3Dfi=
xes&id=3De90e8da72ad694a16a4ffa6e5adae3610208f73b

Best regards,
Yoshihiro Shimoda
