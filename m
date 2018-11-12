Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:45724 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728416AbeKLS6Z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Nov 2018 13:58:25 -0500
Date: Mon, 12 Nov 2018 10:06:04 +0100
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH/RFC] iommu/ipmmu-vmsa: R-Car M3-N/V3H/E3 AVB whitelist
 prototype
Message-ID: <20181112090604.rvi7gomvqxwvrrhn@verge.net.au>
References: <154014429795.2869.7870954544925695802.sendpatchset@octo>
 <CAMuHMdXv3LYcjpWxRxnVbcei5e7i0VxOL5RRro24b5_mKODakw@mail.gmail.com>
 <OSBPR01MB2293329B49BE6DCC6E949EF7D8C10@OSBPR01MB2293.jpnprd01.prod.outlook.com>
 <CAMuHMdW9U1rJ1mR2kHosb_e7zMGTDN2eznmeEwDu6V0fO35aCA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdW9U1rJ1mR2kHosb_e7zMGTDN2eznmeEwDu6V0fO35aCA@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Nov 12, 2018 at 09:18:41AM +0100, Geert Uytterhoeven wrote:
> Hi Shimoda-san,
> 
> On Mon, Nov 12, 2018 at 8:24 AM Yoshihiro Shimoda
> <yoshihiro.shimoda.uh@renesas.com> wrote:
> > > From: Geert Uytterhoeven, Sent: Sunday, October 28, 2018 10:33 PM
> > > On Sun, Oct 21, 2018 at 7:56 PM Magnus Damm <magnus.damm@gmail.com> wrote:
> > > > From: Magnus Damm <damm@opensource.se>
> > > >
> > > > For testing purpose enable IPMMU for Ethernet-AVB on R-Car M3-N/V3H/E3.
> > > >
> > > > Not for upstream merge.
> > > >
> > > > Not-Yet-Signed-off-by: Magnus Damm <damm@opensource.se>
> > > > ---
> > > >
> > > >  Applies on top of renesas-devel-20181019-v4.19-rc8
> > > >
> > > >  drivers/iommu/ipmmu-vmsa.c |    4 ++++
> > > >  1 file changed, 4 insertions(+)
> > > >
> > > > --- 0001/drivers/iommu/ipmmu-vmsa.c
> > > > +++ work/drivers/iommu/ipmmu-vmsa.c     2018-10-22 02:46:30.139880557 +0900
> > > > @@ -756,6 +756,10 @@ static int ipmmu_init_platform_device(st
> > > >
> > > >  static bool ipmmu_slave_whitelist(struct device *dev)
> > > >  {
> > > > +       /* R-Car M3-N/V3H/E3 Ethernet-AVB */
> > > > +       if (!strcmp(dev_name(dev), "e6800000.ethernet"))
> > > > +               return true;
> > >
> > > I'm afraid the whitelisting doesn't work that way: with the above check, it will
> > > be enabled on all R-Car Gen3 SoCs.
> >
> > I agree with Geert-san.
> > So, how about adding .revision into the soc_rcar_gen3 like a whitelist of SoCs first as following?
> > I believe almost all R-Car Gen3 SoCs can use IPMMU safety, except H3 ES2.0 or older and M3-W ES1.*.
> 
> Thanks for the information!
> 
> > --- a/drivers/iommu/ipmmu-vmsa.c
> > +++ b/drivers/iommu/ipmmu-vmsa.c
> > @@ -758,10 +758,10 @@ static bool ipmmu_slave_whitelist(struct device *dev)
> >  }
> >
> >  static const struct soc_device_attribute soc_rcar_gen3[] = {
> > -       { .soc_id = "r8a7795", },
> > -       { .soc_id = "r8a7796", },
> > +       { .soc_id = "r8a7795", .revision = "ES3.*" },
> >         { .soc_id = "r8a77965", },
> >         { .soc_id = "r8a77970", },
> > +       { .soc_id = "r8a77990", },
> >         { .soc_id = "r8a77995", },
> >         { /* sentinel */ }
> >  };
> 
> Given the above, I think the time is ripe to convert this from a whitelist to a
> blacklist?

My understanding is that the motivation for the whitelist was to allow us
to control enabling this device on a per-SOC basis in a very deliberate
maner to avoid enabling non-working hardware/firmware/driver combinations.

In moving to a whitelist I believe we would be saying that the risk of
such non-working combinations has subsided and can satisfactorily be
managed by a whitelist.

Are we comfortable in saying that?
