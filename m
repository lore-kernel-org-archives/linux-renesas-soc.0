Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:35812 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933509AbdDGLdI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Apr 2017 07:33:08 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Niklas =?ISO-8859-1?Q?S=F6derlund?=
        <niklas.soderlund@ragnatech.se>, Vinod Koul <vinod.koul@intel.com>,
        dmaengine@vger.kernel.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>
Subject: Re: [PATCH 3/3] dmaengine: rcar-dmac: wait for ISR to finish before freeing resources
Date: Fri, 07 Apr 2017 14:33:47 +0300
Message-ID: <2060101.WvtNsFihc1@avalon>
In-Reply-To: <CAMuHMdVW44NEYeL-AtP8Qywhy1KuqgLdaYPVEiUJ01dMABmT4g@mail.gmail.com>
References: <20170328224035.8040-1-niklas.soderlund+renesas@ragnatech.se> <20170405091407.GG18945@bigcity.dyn.berto.se> <CAMuHMdVW44NEYeL-AtP8Qywhy1KuqgLdaYPVEiUJ01dMABmT4g@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On Wednesday 05 Apr 2017 12:40:11 Geert Uytterhoeven wrote:
> On Wed, Apr 5, 2017 at 11:14 AM, Niklas S=F6derlund wrote:
> > On 2017-04-05 08:55:31 +0530, Vinod Koul wrote:
> >> On Thu, Mar 30, 2017 at 09:38:39AM +0200, Niklas S=F6derlund wrote=
:
> >>> On 2017-03-29 15:30:42 +0200, Niklas S=F6derlund wrote:
> >>>> On 2017-03-29 14:31:33 +0200, Geert Uytterhoeven wrote:
> >>>>> On Wed, Mar 29, 2017 at 12:40 AM, Niklas S=F6derlund wrote:
> >>>>>> This fixes a race condition where the channel resources could =
be
> >>>>>> freed before the ISR had finished running resulting in a NULL
> >>>>>> pointer reference from the ISR.
> >>>>>>=20
> >>>>>> [  167.148934] Unable to handle kernel NULL pointer dereferenc=
e
> >>>>>> at virtual address 00000000
> >>>>>> [  167.157051] pgd =3D ffff80003c641000
> >>>>>> [  167.160449] [00000000] *pgd=3D000000007c507003,
> >>>>>> *pud=3D000000007c4ff003, *pmd=3D0000000000000000
> >>>>>> [  167.168719] Internal error: Oops: 96000046 [#1] PREEMPT SMP=

> >>>>>> [  167.174289] Modules linked in:
> >>>>>> [  167.177348] CPU: 3 PID: 10547 Comm: dma_ioctl Not tainted
> >>>>>> 4.11.0-rc1-00001-g8d92afddc2f6633a #73
> >>>>>> [  167.186131] Hardware name: Renesas Salvator-X board based o=
n
> >>>>>> r8a7795 (DT)
> >>>>>> [  167.192917] task: ffff80003a411a00 task.stack: ffff80003bcd=
4000
> >>>>>> [  167.198850] PC is at rcar_dmac_chan_prep_sg+0xe0/0x400
> >>>>>> [  167.203985] LR is at rcar_dmac_chan_prep_sg+0x48/0x400
> >>>>>=20
> >>>>> Do you have a test case to trigger this?
> >>>>=20
> >>>> Yes I have a testcase, it's rather complex and involves both a k=
ernel
> >>>> module and a userspaces application to stress the rcar-dmac. I'm=

> >>>> checking if I can share this publicly or not, please hold :-)
> >>>=20
> >>> I have now received feedback that I'm unfortunately not allowed t=
o
> >>> share the test case :-(
> >>>=20
> >>> The big picture in how to trigger this problem is that you start =
a DMA
> >>> transfer like this:
> >>>=20
> >>> struct dma_async_tx_descriptor *tx =3D ...;
> >>>=20
> >>> ...
> >>>=20
> >>> tx->tx_submit(tx);
> >>>=20
> >>> And then you directly call dma_release_channel() on this channel
> >>> without making sure the completion callback ran or anything. Now =
if you
> >>> are unlucky the ISR have not finished running for the DMA when
> >>> dma_release_channel() starts to clean up resources. The synchroni=
sation
> >>> point in the dma_release_channel() call path fixes this.
> >>=20
> >> Well the API expectation would be you abort the txn before calling=

> >> release. So the expected order should be:
> >>=20
> >> dmaengine_terminate_all();
> >> dma_release_channel();
> >=20
> > Agree this is the correct way and in this case patch 3/3 in this se=
ries
> > could be dropped. Then device_synchronize() would added to rcar-dma=
c,
> > dmaengine_terminate_all() would turn of the IRQ and
> > dma_release_channel() would ensure that device_synchronize() is cal=
led
> > prior to calling rcar-dmac device_free_chan_resources().
> >=20
> >> Terminate should then stop the channel, ie abort the pending
> >> descriptors..
> >=20
> > However for reasons unknown to me the rcar-dmac
> > device_free_chan_resources() implementation implements logic to tur=
n of
> > IRQs before it frees the resources. And it's because of this patch =
3/3
> > is needed so that it can be sure no ISR is running before it frees
> > resources.
> >=20
> > I don't know how to best proceed here. I agree it feels a bit odd t=
hat
> > device_free_chan_resources() is dealing with the IRQs as such thing=
s
> > should be done before it's called. But on the other hand that code =
has
> > been part of the driver since it was added upstream. I feel a bit
> > uncomfortable just removing that part from the
> > device_free_chan_resources() since the driver have been in use with=
 it
> > for such a long time.
> >=20
> > How would you prefer I try and resolve this?
>=20
> Perhaps Laurent knows why it was implemented this way?

That was nearly 3 years ago, and I can hardly remember reasons related =
to code=20
I wrote 3 months ago :-)

I might just have been overcautious, guarding against conditions that s=
hould=20
not happen if the caller behaves correctly. The situation might have ch=
anged=20
since the driver was written. It might also be just a case of cargo-cul=
t=20
programming, as the shdma_free_chan_resources() has very similar code.

Given that freeing channel resources when the channel isn't idle can ca=
use an=20
oops, I think we should guard against that. This should probably be=20
implemented in the dma-engine core, to make sure we catch the issue in =
as many=20
drivers as possible.

--=20
Regards,

Laurent Pinchart
