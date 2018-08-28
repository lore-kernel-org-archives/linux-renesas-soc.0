Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:40828 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727264AbeH1Obf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 Aug 2018 10:31:35 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Niklas =?ISO-8859-1?Q?S=F6derlund?=
        <niklas.soderlund@ragnatech.se>
Cc: jacopo mondi <jacopo@jmondi.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>, geert@linux-m68k.org,
        horms@verge.net.au, kieran.bingham+renesas@ideasonboard.com,
        damm+renesas@opensource.se, ulrich.hecht+renesas@gmail.com,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [RFT 0/8] arm64: dts: renesas: Ebisu: Add HDMI and CVBS input
Date: Tue, 28 Aug 2018 13:40:34 +0300
Message-ID: <4076708.qWth0rfBdu@avalon>
In-Reply-To: <20180827132345.GC15572@bigcity.dyn.berto.se>
References: <1534760202-20114-1-git-send-email-jacopo+renesas@jmondi.org> <20180827094956.GA3566@w540> <20180827132345.GC15572@bigcity.dyn.berto.se>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Niklas,

On Monday, 27 August 2018 16:23:45 EEST Niklas S=F6derlund wrote:
> On 2018-08-27 11:49:56 +0200, Jacopo Mondi wrote:
> > On Sat, Aug 25, 2018 at 03:18:06PM +0200, jacopo mondi wrote:
> >> On Sat, Aug 25, 2018 at 08:37:15AM +0200, Niklas S=F6derlund wrote:
> >>> On 2018-08-25 02:54:44 +0300, Laurent Pinchart wrote:
> >>>> On Monday, 20 August 2018 13:16:34 EEST Jacopo Mondi wrote:
> >>>>> Hello renesas list,
> >>>>>=20
> >>>>> this series add supports for the HDMI and CVBS input to R-Car
> >>>>> E3 R8A77990 Ebisu board.
> >>>>>=20
> >>>>> It's an RFT, as I don't have an Ebisu to test with :(
> >>>>>=20
> >>>>> The series adds supports for the following items:
> >>>>>=20
> >>>>> - PFC: add VIN groups and functions
> >>>>> - R-Car VIN and R-Car CSI-2: add support for R8A77990
> >>>>> - R8A77990: Add I2C, VIN and CSI-2 nodes
> >>>>> - Ebisu: describe HDMI and CVBS inputs
> >>>>>=20
> >>>>> Each patch, when relevant reports difference between the upported
> >>>>> BSP patch and the proposed one.
> >>>>>=20
> >>>>> I know Laurent should receive an Ebisu sooner or later, maybe we
> >>>>> can sync for testing :)
> >>>>=20
> >>>> I've given the series a first test, and I think a bit more work is
> >>>> needed :-)
> >>>>=20
> >>>> [    1.455533] adv748x 0-0070: Endpoint
> >>>> /soc/i2c@e6500000/video-receiver@70/ port@7/endpoint on port 7
> >>>> [    1.464683] adv748x 0-0070: Endpoint
> >>>> /soc/i2c@e6500000/video-receiver@70/ port@8/endpoint on port 8
> >>>> [    1.473728] adv748x 0-0070: Endpoint
> >>>> /soc/i2c@e6500000/video-receiver@70/ port@a/endpoint on port 10
> >>>> [    1.484835] adv748x 0-0070: chip found @ 0xe0 revision 2143
> >>>> [    1.639470] adv748x 0-0070: No endpoint found for txb
> >>>> [    1.644653] adv748x 0-0070: Failed to probe TXB
> >>>=20
> >>> I fear this is a design choice in the adv748x driver. Currently the
> >>> driver requires both of its two CSI-2 transmitters to be
> >>> connected/used else probe fails. Furthermore the HDMI capture is alwa=
ys
> >>> routed to TXA while the analog capture is always routed to TXB.
> >>>=20
> >>> Now that we have a board where only TXA is connected but both HDMI and
> >>> analog captures are used maybe it's time to do some more work on v4l2
> >>> and the adv748x driver ;-P What's missing:
> >>>=20
> >>> - Probe should be OK with either TXA or TXB connected and not bail if
> >>>   not both are used.
> >>=20
> >> I have three patches for this I hope to share as soon as I'll be able
> >> to do some more testing
> >>=20
> >>> - The media_device_ops or at least the .link_notify() callback of that
> >>>   struct must be changed so not one driver in the media graph is
> >>>   responsible for all links. In this case rcar-vin provides the
> >>>   callback and rcar-vin should not judge which links between the
> >>>   adv748x subdevices are OK to enable/disable. Currently the links
> >>>   between the adv748x subdevices are immutably enabled to avoid this
> >>>   particular problem.
> >>=20
> >> Uh, I didn't get this :/ Care to elaborate more?
> >=20
> > I'm thinking if it is not enough to just provide a .link_setup()
> > callback to the (enabled) csi-2 sink pads of the adv748x and handle
> > routing between the afe/hdmi sources and that sink, without the vin's
> > registered link_notify playing any role in that.
>=20
> That is my point, the v4l2 framework needs work to allow all drivers to
> provide a .link_setup() callback. And this as you describe will conflict
> with the current solution where there is only one possible such
> callback. So in addition to being able to have multiple such callbacks
> the current drivers implementing one would need to be updated to ignore
> links which it do not care about.

Isn't this already possible ? We have a single top-level .link_notify()=20
operation at the media device level, but also .link_setup() operations for=
=20
each entity.

> In our case the .link_setup() in rcar-vin should not care about the
> links between the adv748x internal subdevice. Of course the other way
> around is also true, the .link_setup() in adv748x should not care about
> the links handled by rcar-vin :-)
>=20
> As you discovers this is not possible today and might require some work
> or maybe even a different design then the one outlined above.
>=20
> >> What I was about to do, instead, given the fixed HDMI->TXA and AFE->TXB
> >> routing in the adv748x driver was to insert a .link_validate() callback
> >> for both the HDMI and AFE backends, that checks for the availability of
> >> the corresponding output endpoint. This seems to me that this makes
> >> easy when dynamic routing will be added to do the same on the
> >> dynamically configured sink pad.
> >> What do you think?
> >=20
> > On a second thought if a CSI-2 sink it's not enabled it is not part of
> > the media graph neither, so it should not be possible to link it in any
> > pipeline, so no link validation is required. The link simply can't
> > exist.
> >=20
> > It seems to me that to support Ebisu-like designs is then enough to
> > make the adv748x driver probe with a single csi-2 output enabled and
> > handle power management accordingly. I will share patches for this
> > briefly.

=2D-=20
Regards,

Laurent Pinchart
