Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:57715 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726958AbeH0SH1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 27 Aug 2018 14:07:27 -0400
Date: Mon, 27 Aug 2018 16:20:31 +0200
From: jacopo mondi <jacopo@jmondi.org>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>, geert@linux-m68k.org,
        horms@verge.net.au, kieran.bingham+renesas@ideasonboard.com,
        damm+renesas@opensource.se, ulrich.hecht+renesas@gmail.com,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [RFT 0/8] arm64: dts: renesas: Ebisu: Add HDMI and CVBS input
Message-ID: <20180827142031.GB3566@w540>
References: <1534760202-20114-1-git-send-email-jacopo+renesas@jmondi.org>
 <12690843.BN01eCh2kh@avalon>
 <20180825063715.GI1493@bigcity.dyn.berto.se>
 <20180825131806.GK26480@w540>
 <20180827094956.GA3566@w540>
 <20180827132345.GC15572@bigcity.dyn.berto.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="4SFOXa2GPu3tIq4H"
Content-Disposition: inline
In-Reply-To: <20180827132345.GC15572@bigcity.dyn.berto.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--4SFOXa2GPu3tIq4H
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

On Mon, Aug 27, 2018 at 03:23:45PM +0200, Niklas S=C3=B6derlund wrote:
> Hi Jacopo,
>
> On 2018-08-27 11:49:56 +0200, Jacopo Mondi wrote:
> > Hi Niklas,
> >         A few more talk on the adv748x link handling, please bear with =
me...
> >
> > On Sat, Aug 25, 2018 at 03:18:06PM +0200, jacopo mondi wrote:
> > > Hi Laurent, Niklas,
> > >
> > > On Sat, Aug 25, 2018 at 08:37:15AM +0200, Niklas S=C3=B6derlund wrote:
> > > > Hi Laurent and Jacopo,
> > > >
> > > > On 2018-08-25 02:54:44 +0300, Laurent Pinchart wrote:
> > > > > Hi Jacopo,
> > > > >
> > > > > On Monday, 20 August 2018 13:16:34 EEST Jacopo Mondi wrote:
> > > > > > Hello renesas list,
> > > > > >    this series add supports for the HDMI and CVBS input to R-Ca=
r E3 R8A77990
> > > > > > Ebisu board.
> > > > > >
> > > > > > It's an RFT, as I don't have an Ebisu to test with :(
> > > > > >
> > > > > > The series adds supports for the following items:
> > > > > >
> > > > > > - PFC: add VIN groups and functions
> > > > > > - R-Car VIN and R-Car CSI-2: add support for R8A77990
> > > > > > - R8A77990: Add I2C, VIN and CSI-2 nodes
> > > > > > - Ebisu: describe HDMI and CVBS inputs
> > > > > >
> > > > > > Each patch, when relevant reports difference between the upport=
ed BSP patch
> > > > > > and the proposed one.
> > > > > >
> > > > > > I know Laurent should receive an Ebisu sooner or later, maybe w=
e can sync
> > > > > > for testing :)
> > > > >
> > > > > I've given the series a first test, and I think a bit more work i=
s needed :-)
> > > > >
> > > > > [    1.455533] adv748x 0-0070: Endpoint /soc/i2c@e6500000/video-r=
eceiver@70/
> > > > > port@7/endpoint on port 7
> > > > > [    1.464683] adv748x 0-0070: Endpoint /soc/i2c@e6500000/video-r=
eceiver@70/
> > > > > port@8/endpoint on port 8
> > > > > [    1.473728] adv748x 0-0070: Endpoint /soc/i2c@e6500000/video-r=
eceiver@70/
> > > > > port@a/endpoint on port 10
> > > > > [    1.484835] adv748x 0-0070: chip found @ 0xe0 revision 2143
> > > > > [    1.639470] adv748x 0-0070: No endpoint found for txb
> > > > > [    1.644653] adv748x 0-0070: Failed to probe TXB
> > > >
> > > > I fear this is a design choice in the adv748x driver. Currently the
> > > > driver requires both of its two CSI-2 transmitters to be connected/=
used
> > > > else probe fails. Furthermore the HDMI capture is always routed to =
TXA
> > > > while the analog capture is always routed to TXB.
> > > >
> > > > Now that we have a board where only TXA is connected but both HDMI =
and
> > > > analog captures are used maybe it's time to do some more work on v4=
l2
> > > > and the adv748x driver ;-P What's missing:
> > > >
> > > > - Probe should be OK with either TXA or TXB connected and not bail =
if
> > > >   not both are used.
> > >
> > > I have three patches for this I hope to share as soon as I'll be able
> > > to do some more testing
> > >
> > > > - The media_device_ops or at least the .link_notify() callback of t=
hat
> > > >   struct must be changed so not one driver in the media graph is
> > > >   responsible for all links. In this case rcar-vin provides the cal=
lback
> > > >   and rcar-vin should not judge which links between the adv748x
> > > >   subdevices are OK to enable/disable. Currently the links between =
the
> > > >   adv748x subdevices are immutably enabled to avoid this particular
> > > >   problem.
> > >
> > > Uh, I didn't get this :/ Care to elaborate more?
> > >
> >
> > I'm thinking if it is not enough to just provide a .link_setup()
> > callback to the (enabled) csi-2 sink pads of the adv748x and handle
> > routing between the afe/hdmi sources and that sink, without the vin's
> > registered link_notify playing any role in that.
>
> That is my point, the v4l2 framework needs work to allow all drivers to
> provide a .link_setup() callback. And this as you describe will conflict
> with the current solution where there is only one possible such
> callback. So in addition to being able to have multiple such callbacks
> the current drivers implementing one would need to be updated to ignore
> links which it do not care about.
>
> In our case the .link_setup() in rcar-vin should not care about the
> links between the adv748x internal subdevice. Of course the other way
> around is also true, the .link_setup() in adv748x should not care about
> the links handled by rcar-vin :-)
>
> As you discovers this is not possible today and might require some work
> or maybe even a different design then the one outlined above.
>
Myabe I'm missing some piece for sure, but why do you think it is not
possible?

I've applied, for testing, the following patch:
https://paste.debian.net/1039515/

And that's the output I get

* At system boot, no link is enabled between the HDMI backend and the
  TXA output:

[root@alarm ~]# media-ctl -p -d /dev/media2
=2E...
- entity 7: adv748x 4-0070 txa (2 pads, 2 links)
            type V4L2 subdev subtype Unknown flags 0
            device node name /dev/v4l-subdev21
        pad0: Sink
                [fmt:unknown/0x0]
                <- "adv748x 4-0070 hdmi":1 []
        pad1: Source
                [fmt:unknown/0x0]
                -> "rcar_csi2 feaa0000.csi2":0 [ENABLED,IMMUTABLE]

- entity 10: adv748x 4-0070 hdmi (2 pads, 1 link)
             type V4L2 subdev subtype Unknown flags 0
             device node name /dev/v4l-subdev20
        pad0: Sink
                [dv.caps:BT.656/1120 min:640x480@13000000 max:1920x1200@162=
000000 stds:CEA-861,DMT caps:progressive]
        pad1: Source
                [fmt:RGB888_1X24/1280x720 field:none colorspace:srgb]
                [dv.caps:BT.656/1120 min:640x480@13000000 max:1920x1200@162=
000000 stds:CEA-861,DMT caps:progressive]
                [dv.query:no-link]
                [dv.current:BT.656/1120 1280x720p30 (3300x750) stds:CEA-861=
 flags:can-reduce-fps,CE-video,has-cea861-vic]
                -> "adv748x 4-0070 txa":0 []
=2E..

* Enable the link, and see that .link_setup() has been called for the
  adv748x
[root@alarm ~]# media-ctl -v -d /dev/media2 -l "'adv748x 4-0070 hdmi':1 -> =
'adv748x 4-0070 txa':0 [1]"
[root@alarm ~]# dmesg | tail
=2E..
[  183.294541] rvin_group_link_notify:126 SOURCE adv748x 4-0070 hdmi -> SIN=
K adv748x 4-0070 txa
[  183.304663] adv748x_link_setup:332 LOCAL adv748x 4-0070 hdmi -> REMOTE a=
dv748x 4-0070 txa
[  183.314207] adv748x_link_setup:332 LOCAL adv748x 4-0070 txa -> REMOTE ad=
v748x 4-0070 hdmi
[  183.323720] rvin_group_link_notify:126 SOURCE adv748x 4-0070 hdmi -> SIN=
K adv748x 4-0070 txa

[root@alarm ~]# media-ctl -p -d /dev/media2
=2E...
- entity 7: adv748x 4-0070 txa (2 pads, 2 links)
            type V4L2 subdev subtype Unknown flags 0
            device node name /dev/v4l-subdev21
        pad0: Sink
                [fmt:unknown/0x0]
                <- "adv748x 4-0070 hdmi":1 [ENABLED]
        pad1: Source
                [fmt:unknown/0x0]
                -> "rcar_csi2 feaa0000.csi2":0 [ENABLED,IMMUTABLE]

- entity 10: adv748x 4-0070 hdmi (2 pads, 1 link)
             type V4L2 subdev subtype Unknown flags 0
             device node name /dev/v4l-subdev20
        pad0: Sink
                [dv.caps:BT.656/1120 min:640x480@13000000 max:1920x1200@162=
000000 stds:CEA-861,DMT caps:progressive]
        pad1: Source
                [fmt:RGB888_1X24/1280x720 field:none colorspace:srgb]
                [dv.caps:BT.656/1120 min:640x480@13000000 max:1920x1200@162=
000000 stds:CEA-861,DMT caps:progressive]
                [dv.query:no-link]
                [dv.current:BT.656/1120 1280x720p30 (3300x750) stds:CEA-861=
 flags:can-reduce-fps,CE-video,has-cea861-vic]
                -> "adv748x 4-0070 txa":0 [ENABLED]
=2E..

So, at link creation time, the adv748x receives a .link_setup() callback (as
well as the vin driver does though...)

Isn't this enough to dynamically set-up links created between the HDMI/CVBS
inputs and one of the CSI-2 transmitters?

Thanks
  j

> >
> > > What I was about to do, instead, given the fixed HDMI->TXA and AFE->T=
XB
> > > routing in the adv748x driver was to insert a .link_validate() callba=
ck for
> > > both the HDMI and AFE backends, that checks for the availability of
> > > the corresponding output endpoint. This seems to me that this makes
> > > easy when dynamic routing will be added to do the same on the
> > > dynamically configured sink pad.
> > > What do you think?
> >
> > On a second thought if a CSI-2 sink it's not enabled it is not part of
> > the media graph neither, so it should not be possible to link it in any
> > pipeline, so no link validation is required. The link simply can't
> > exist.
> >
> > It seems to me that to support Ebisu-like designs is then enough to
> > make the adv748x driver probe with a single csi-2 output enabled and
> > handle power management accordingly. I will share patches for this
> > briefly.
> >
> > >
> > > Thanks
> > >   j
> > >
> > > >
> > > > >
> > > > > > PS: the list of upported patches will be sent separately.
> > > > > >
> > > > > > Jacopo Mondi (5):
> > > > > >   media: dt-bindings: media: rcar-vin: Add R8A77990 support
> > > > > >   media: rcar-vin: Add support for R-Car R8A77990
> > > > > >   dt-bindings: media: rcar-csi2: Add R8A77990
> > > > > >   media: rcar-csi2: Add R8A77990 support
> > > > > >   arm64: dts: renesas: ebisu: Add HDMI and CVBS input
> > > > > >
> > > > > > Koji Matsuoka (1):
> > > > > >   arm64: dts: r8a77990: Add VIN and CSI-2 device nodes
> > > > > >
> > > > > > Takeshi Kihara (2):
> > > > > >   pinctrl: sh-pfc: r8a77990: Add VIN pins, groups and functions
> > > > > >   arm64: dts: r8a77990: Add I2C device nodes
> > > > > >
> > > > > >  .../devicetree/bindings/media/rcar_vin.txt         |   1 +
> > > > > >  .../bindings/media/renesas,rcar-csi2.txt           |   1 +
> > > > > >  arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts     |  86 ++++
> > > > > >  arch/arm64/boot/dts/renesas/r8a77990.dtsi          | 202 +++++=
++++
> > > > > >  drivers/media/platform/rcar-vin/rcar-core.c        |  20 +
> > > > > >  drivers/media/platform/rcar-vin/rcar-csi2.c        |   9 +
> > > > > >  drivers/pinctrl/sh-pfc/pfc-r8a77990.c              | 504 +++++=
+++++++++++++
> > > > > >  7 files changed, 823 insertions(+)
> > > > >
> > > > > --
> > > > > Regards,
> > > > >
> > > > > Laurent Pinchart
> > > > >
> > > > >
> > > > >
> > > >
> > > > --
> > > > Regards,
> > > > Niklas S=C3=B6derlund
> >
> >
>
>
>
> --
> Regards,
> Niklas S=C3=B6derlund

--4SFOXa2GPu3tIq4H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJbhAivAAoJEHI0Bo8WoVY8/gkQALnlJ8S3gy8p21/1+5SEUaXE
xu5ywwH3zkl5AkUfjnTONyVLwQnNvOwMmPzOHR051LV7aVoMwhDnV5uLZ2ITUuf7
Z2Klh8t5UKHkK1Kc+pefO7KAS5ucEUyhTHPTWReOdvWlrAksTyBYrFbUHGi1I9V0
px9QHuqDKeJeb2cV7RdwyTBUEcO3WOVt/AA0MABmMgqVhCulcEVLY4EDL1vju6D/
yi3hhekW8O/14rCfmxfXup9lpaxPCZkvgAw1ua8y3KHD08qhHuXopZQp0bTOH6+C
60bGiqNOtr2uxnCNTcJeISeUT4sCTdj5W8+DZLHNwFFiWshMxcJnbjeEm0l0o8R6
gouBNzMDvpnIc3mX/OCY49ibHqHv81BuqRqgymh0katxfugaNpTDtlMxhqsJ+ICU
mT//r2L8MhUmCdAjGYXGBfOv1P4cWahBGmoztKsoOezEo0VMxXmRa+HMrnCKA5Jz
XIYtmDCim5mnTC3nU0pn1WDG336UUBXq5QGlWea4iW2ekTpJH3WjeUC9q8x+ZhsO
WwGeoNh4d9DN/TvFNce3O2GG6u0LFKReWKcndxU8WtQjAYoq4xDli/D/RxmnT+Hg
tYBB41oCdy+2d+lE/IOcPyiaGCVtplEypyqooxu5sn4cOlazGR+T8Y0+DH6D3PkR
sLU9cKuOz8GfannXASty
=zyLn
-----END PGP SIGNATURE-----

--4SFOXa2GPu3tIq4H--
