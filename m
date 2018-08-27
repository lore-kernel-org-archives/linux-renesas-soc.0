Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:46977 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726809AbeH0NgD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 27 Aug 2018 09:36:03 -0400
Date: Mon, 27 Aug 2018 11:49:56 +0200
From: jacopo mondi <jacopo@jmondi.org>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>, geert@linux-m68k.org,
        horms@verge.net.au, kieran.bingham+renesas@ideasonboard.com,
        damm+renesas@opensource.se, ulrich.hecht+renesas@gmail.com,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [RFT 0/8] arm64: dts: renesas: Ebisu: Add HDMI and CVBS input
Message-ID: <20180827094956.GA3566@w540>
References: <1534760202-20114-1-git-send-email-jacopo+renesas@jmondi.org>
 <12690843.BN01eCh2kh@avalon>
 <20180825063715.GI1493@bigcity.dyn.berto.se>
 <20180825131806.GK26480@w540>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="jRHKVT23PllUwdXP"
Content-Disposition: inline
In-Reply-To: <20180825131806.GK26480@w540>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--jRHKVT23PllUwdXP
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Niklas,
        A few more talk on the adv748x link handling, please bear with me...

On Sat, Aug 25, 2018 at 03:18:06PM +0200, jacopo mondi wrote:
> Hi Laurent, Niklas,
>
> On Sat, Aug 25, 2018 at 08:37:15AM +0200, Niklas S=C3=B6derlund wrote:
> > Hi Laurent and Jacopo,
> >
> > On 2018-08-25 02:54:44 +0300, Laurent Pinchart wrote:
> > > Hi Jacopo,
> > >
> > > On Monday, 20 August 2018 13:16:34 EEST Jacopo Mondi wrote:
> > > > Hello renesas list,
> > > >    this series add supports for the HDMI and CVBS input to R-Car E3=
 R8A77990
> > > > Ebisu board.
> > > >
> > > > It's an RFT, as I don't have an Ebisu to test with :(
> > > >
> > > > The series adds supports for the following items:
> > > >
> > > > - PFC: add VIN groups and functions
> > > > - R-Car VIN and R-Car CSI-2: add support for R8A77990
> > > > - R8A77990: Add I2C, VIN and CSI-2 nodes
> > > > - Ebisu: describe HDMI and CVBS inputs
> > > >
> > > > Each patch, when relevant reports difference between the upported B=
SP patch
> > > > and the proposed one.
> > > >
> > > > I know Laurent should receive an Ebisu sooner or later, maybe we ca=
n sync
> > > > for testing :)
> > >
> > > I've given the series a first test, and I think a bit more work is ne=
eded :-)
> > >
> > > [    1.455533] adv748x 0-0070: Endpoint /soc/i2c@e6500000/video-recei=
ver@70/
> > > port@7/endpoint on port 7
> > > [    1.464683] adv748x 0-0070: Endpoint /soc/i2c@e6500000/video-recei=
ver@70/
> > > port@8/endpoint on port 8
> > > [    1.473728] adv748x 0-0070: Endpoint /soc/i2c@e6500000/video-recei=
ver@70/
> > > port@a/endpoint on port 10
> > > [    1.484835] adv748x 0-0070: chip found @ 0xe0 revision 2143
> > > [    1.639470] adv748x 0-0070: No endpoint found for txb
> > > [    1.644653] adv748x 0-0070: Failed to probe TXB
> >
> > I fear this is a design choice in the adv748x driver. Currently the
> > driver requires both of its two CSI-2 transmitters to be connected/used
> > else probe fails. Furthermore the HDMI capture is always routed to TXA
> > while the analog capture is always routed to TXB.
> >
> > Now that we have a board where only TXA is connected but both HDMI and
> > analog captures are used maybe it's time to do some more work on v4l2
> > and the adv748x driver ;-P What's missing:
> >
> > - Probe should be OK with either TXA or TXB connected and not bail if
> >   not both are used.
>
> I have three patches for this I hope to share as soon as I'll be able
> to do some more testing
>
> > - The media_device_ops or at least the .link_notify() callback of that
> >   struct must be changed so not one driver in the media graph is
> >   responsible for all links. In this case rcar-vin provides the callback
> >   and rcar-vin should not judge which links between the adv748x
> >   subdevices are OK to enable/disable. Currently the links between the
> >   adv748x subdevices are immutably enabled to avoid this particular
> >   problem.
>
> Uh, I didn't get this :/ Care to elaborate more?
>

I'm thinking if it is not enough to just provide a .link_setup()
callback to the (enabled) csi-2 sink pads of the adv748x and handle
routing between the afe/hdmi sources and that sink, without the vin's
registered link_notify playing any role in that.

> What I was about to do, instead, given the fixed HDMI->TXA and AFE->TXB
> routing in the adv748x driver was to insert a .link_validate() callback f=
or
> both the HDMI and AFE backends, that checks for the availability of
> the corresponding output endpoint. This seems to me that this makes
> easy when dynamic routing will be added to do the same on the
> dynamically configured sink pad.
> What do you think?

On a second thought if a CSI-2 sink it's not enabled it is not part of
the media graph neither, so it should not be possible to link it in any
pipeline, so no link validation is required. The link simply can't
exist.

It seems to me that to support Ebisu-like designs is then enough to
make the adv748x driver probe with a single csi-2 output enabled and
handle power management accordingly. I will share patches for this
briefly.

>
> Thanks
>   j
>
> >
> > >
> > > > PS: the list of upported patches will be sent separately.
> > > >
> > > > Jacopo Mondi (5):
> > > >   media: dt-bindings: media: rcar-vin: Add R8A77990 support
> > > >   media: rcar-vin: Add support for R-Car R8A77990
> > > >   dt-bindings: media: rcar-csi2: Add R8A77990
> > > >   media: rcar-csi2: Add R8A77990 support
> > > >   arm64: dts: renesas: ebisu: Add HDMI and CVBS input
> > > >
> > > > Koji Matsuoka (1):
> > > >   arm64: dts: r8a77990: Add VIN and CSI-2 device nodes
> > > >
> > > > Takeshi Kihara (2):
> > > >   pinctrl: sh-pfc: r8a77990: Add VIN pins, groups and functions
> > > >   arm64: dts: r8a77990: Add I2C device nodes
> > > >
> > > >  .../devicetree/bindings/media/rcar_vin.txt         |   1 +
> > > >  .../bindings/media/renesas,rcar-csi2.txt           |   1 +
> > > >  arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts     |  86 ++++
> > > >  arch/arm64/boot/dts/renesas/r8a77990.dtsi          | 202 +++++++++
> > > >  drivers/media/platform/rcar-vin/rcar-core.c        |  20 +
> > > >  drivers/media/platform/rcar-vin/rcar-csi2.c        |   9 +
> > > >  drivers/pinctrl/sh-pfc/pfc-r8a77990.c              | 504 +++++++++=
+++++++++
> > > >  7 files changed, 823 insertions(+)
> > >
> > > --
> > > Regards,
> > >
> > > Laurent Pinchart
> > >
> > >
> > >
> >
> > --
> > Regards,
> > Niklas S=C3=B6derlund



--jRHKVT23PllUwdXP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJbg8krAAoJEHI0Bo8WoVY8yR0P/3b8LgQnP7r5ezCgKB7NXIZl
3hzYvAbKqie20yvblXmdt+/EAm07J+l5uN6q5kmy7NEdGFCViIFUnygIw9gcn2Us
DVNMsQtz0a/QxBCYLu7nF9GLF6kmdxCctySz+u3qm5m0U2sGtllZPbOxV/za9oZC
TDmFqLUdAfJiv8pRtKlP4TLVTclnzAltV/yZx9wHujei9W1FQqMru8+mOY8OhwOc
8TV2GXuMeNpLJH6D5ZeHSCxPZDvI2HfhI0Czkjhy4VNZhdG9ZwpC5elvWLmm5QOg
heQe9OjqkNI/291ynKLfgAGNzLITSp/OyPEqpNUEm47TKlbfStVW3x5qCFKg3zZR
umwQvNrDmiBAyldErHF7MoBm+mPuWzwwQECtwn17CN43W3oDiclHx+uMh1biI8fK
mTKMEoAQtSpRhweLsHKauWJ3Shs7NkBKscl/QeMOaOe7QEK65aNQTKetHzDsTfZu
qWpExbeFhzoM4QXYzvVdVF8q9leptjaszQPXHmokJuHv1FoGkwCXSlvkFr0y81AB
qkatmKYk6AdZBjYYKs7arTNwebXq13eE+z/OlEfuBYdNoK0MihZyOelxKlkaueew
ICYcCj8QDhvUieqBflTgwLY1H+Lz+gZVUEGqOpvc9x0Jzb/KF58bv9eVkkwMiuix
eWPwKxxMhyUdYZqK+8gC
=qSfz
-----END PGP SIGNATURE-----

--jRHKVT23PllUwdXP--
