Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:36192 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727944AbeH2R5U (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Aug 2018 13:57:20 -0400
From: Biju Das <biju.das@bp.renesas.com>
To: =?iso-8859-1?Q?Niklas_S=F6derlund?= <niklas.soderlund@ragnatech.se>
CC: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        KOJI MATSUOKA <koji.matsuoka.xm@renesas.com>,
        RYO KATAOKA <ryo.kataoka.wt@renesas.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: Regarding VIN test(cvbs capture:- PAL resolution)
Date: Wed, 29 Aug 2018 14:00:07 +0000
Message-ID: <OSBPR01MB21038CE755179EDD83165CCDB8090@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <OSBPR01MB2103D30E0C6946B72A701D2CB8090@OSBPR01MB2103.jpnprd01.prod.outlook.com>
 <20180829112130.GH15572@bigcity.dyn.berto.se>
In-Reply-To: <20180829112130.GH15572@bigcity.dyn.berto.se>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Niklas,

Thanks for the  feedback.  I confirm it works.

> Subject: Re: Regarding VIN test(cvbs capture:- PAL resolution)
>
> Hi Biju,
>
> On 2018-08-29 10:41:16 +0000, Biju Das wrote:
> > Hi All,
> >
> > I started testing vin on R-Car Gen3(CVBS  input from DVD player
> > connected to R-Car M3-W,kernel:-renesas-devel-20180827-4.19-rc1)
> > based on the information present in https://elinux.org/R-Car/Tests:rcar=
-
> vin.
> >
> > Looks like PAL is not supported.
> > When i execute the command, "media-ctl -d /dev/media1 --get-v4l2
> > "'adv748x 4-0070 afe':8"" on target , i get "[fmt:UYVY8_2X8/720x240
> field:alternate]" instead of "[fmt:UYVY8_2X8/720x288 field:alternate]"
> >
> > root@salvator-x:~# media-ctl -d /dev/media1 --get-v4l2 "'adv748x 4-0070
> afe':8"
> > [   28.708110] ##########afe->curr_norm=3D1000 V4L2_STD_525_60=3Df900
> >                 [fmt:UYVY8_2X8/720x240 field:alternate]
> >
> > Q1) Have any one observed this issue?
>
> The format from the AFE is based on the video standard set. As v4l2 don't
> allow a subdevice to autodetect and change the video standard
> automatically, you need to do this as the first step of the pipeline
> configuration. The default standard of the adv748x driver is NTSC and tha=
t is
> why this step is not strictly needed when testing a NTSC source.
>
>
> 1. Boot board video source off and check formats
>
>     $ v4l2-ctl --get-detected-standard -d /dev/v4l-subdev23
>     Video Standard =3D 0x00000000
>
>     $ media-ctl -d /dev/media2 --get-v4l2 "'adv748x 4-0070 afe':8"
>     [fmt:UYVY8_2X8/720x240 field:alternate colorspace:smpte170m]
>
> 2. Turn on video PAL source and check formats
>
>
>     $ v4l2-ctl --get-detected-standard -d /dev/v4l-subdev23
>     Video Standard =3D 0x000000ff
> PAL-B/B1/G/H/I/D/D1
>
>     $ media-ctl -d /dev/media2 --get-v4l2 "'adv748x 4-0070 afe':8"
>     [fmt:UYVY8_2X8/720x240 field:alternate colorspace:smpte170m]
>
>     Notice that the resolution is still for NTSC.
>
> 3. Set video standard of the AFE and check format
>
>     $ v4l2-ctl --set-standard=3D0x000000ff -d /dev/v4l-subdev23
>     Standard set to 80000000000000ff
>
>     $ media-ctl -d /dev/media2 --get-v4l2 "'adv748x 4-0070 afe':8"
>     [fmt:UYVY8_2X8/720x288 field:alternate colorspace:smpte170m]
>
>     You now have a correct standard for the AFE and can configure a
>     correct pipeline to capture PAL.

root@salvator-x:/# ./v4l2-ctl --get-detected-standard -d /dev/v4l-subdev13
Video Standard =3D 0x000000ff
        PAL-B/B1/G/H/I/D/D1/K

root@salvator-x:/# media-ctl -d /dev/media1 --get-v4l2 "'adv748x 4-0070 afe=
':8"
[ 5345.141942] ##########afe->curr_norm=3D1000 V4L2_STD_525_60=3Df900
                [fmt:UYVY8_2X8/720x240 field:alternate]

root@salvator-x:/# ./v4l2-ctl --set-standard=3D0x000000ff -d /dev/v4l-subde=
v13
Standard set to 80000000000000ff

root@salvator-x:/# media-ctl -d /dev/media1 --get-v4l2 "'adv748x 4-0070 afe=
':8"
[ 5393.410504] ##########afe->curr_norm=3Dff V4L2_STD_525_60=3Df900
                [fmt:UYVY8_2X8/720x288 field:alternate]

root@salvator-x:/# media-ctl -d /dev/media1 -V "'rcar_csi2 fea80000.csi2':1=
 [fmt:UYVY8_2X8/720x288 field:alternate]"
root@salvator-x:/# media-ctl -d /dev/media1 -V "'adv748x 4-0070 afe':8 [fmt=
:UYVY8_2X8/720x288 field:alternate]"
[ 5415.591865] ##########afe->curr_norm=3Dff V4L2_STD_525_60=3Df900

root@salvator-x:/# /yavta -f RGB565 -s 720x576 --field interlaced -n 4 --ca=
pture=3D10 -F -F /dev/video7
Device /dev/video7 opened.
Device `R_Car_VIN' o[ 5429.869587] ##########afe->curr_norm=3Dff V4L2_STD_5=
25_60=3Df900
n `platform:e6ef1000.video' (driver 'rcar_vin') supports video, capture, wi=
thout mplanes.
Video format set: RGB565 (50424752) 720x576 (stride 1440) field interlaced =
buffer size 829440
Video format: RGB565 (50424752) 720x576 (stride 1440) field interlaced buff=
er size 829440
4 buffers requested.
length: 829440 offset: 0 timestamp type/source: mono/EoF
Buffer 0/0 mapped at address 0xffffb1289000.
length: 829440 offset: 831488 timestamp type/source: mono/EoF
Buffer 1/0 mapped at address 0xffffb11be000.
length: 829440 offset: 1662976 timestamp type/source: mono/EoF
Buffer 2/0 mapped at address 0xffffb10f3000.
length: 829440 offset: 2494464 timestamp type/source: mono/EoF
Buffer 3/0 mapped at address 0xffffb1028000.
0 (0) [-] interlaced 0 829440 B 5429.987981 5429.987994 12.577 fps ts mono/=
EoF
1 (1) [-] interlaced 1 829440 B 5430.027981 5430.517680 25.000 fps ts mono/=
EoF
2 (2) [-] interlaced 2 829440 B 5430.067984 5431.046340 24.998 fps ts mono/=
EoF
3 (3) [-] interlaced 3 829440 B 5430.107982 5431.582130 25.001 fps ts mono/=
EoF
4 (0) [-] interlaced 17 829440 B 5430.667986 5432.109747 1.786 fps ts mono/=
EoF
5 (1) [-] interlaced 30 829440 B 5431.187993 5432.633678 1.923 fps ts mono/=
EoF
6 (2) [-] interlaced 43 829440 B 5431.707996 5433.158245 1.923 fps ts mono/=
EoF
7 (3) [-] interlaced 57 829440 B 5432.268004 5433.681529 1.786 fps ts mono/=
EoF
8 (0) [-] interlaced 70 829440 B 5432.788008 5434.213606 1.923 fps ts mono/=
EoF
9 (1) [-] interlaced 83 829440 B 5433.308011 5434.750723 1.923 fps ts mono/=
EoF
Captured 10 frames in 4.842250 seconds (2.065156 fps, 1712922.583847 B/s).
4 buffers released.

> >
> > So I created a patch[2], based on [1]. With this, I get proper PAL
> > resolution(720x576)
> >
> > root@salvator-x:~# media-ctl -d /dev/media1 --get-v4l2 "'adv748x 4-0070
> afe':8"
> > [   42.472582] ##########afe->curr_norm=3Dff V4L2_STD_525_60=3Df900
> >                 [fmt:UYVY8_2X8/720x288 field:alternate]
> >
> > Q2) Is there any reason for not upstreaming the patch [1]?
>
> As Kieran stated a subdevice is not allowed to change the video standard =
on
> it's own. Instead the user is required to ask the subevice which standard=
 it
> detects and explicitly set that standard when configuring the video pipel=
ine
> before capturing.
>

OK.

> > [1]
> https://kernel.googlesource.com/pub/scm/linux/kernel/git/horms/renesas-
> bsp/+/e0740949ae6b964da8bf1e88b504405276652aa7%5E%21/#F0
> >
> > [2]
> > --- a/drivers/media/i2c/adv748x/adv748x-afe.c
> > +++ b/drivers/media/i2c/adv748x/adv748x-afe.c
> >
> > @ -352,6 +353,7 @@ static int adv748x_afe_get_format(struct v4l2_subdev
> *sd,
> > {
> >         struct adv748x_afe *afe =3D adv748x_sd_to_afe(sd);
> >         struct v4l2_mbus_framefmt *mbusformat;
> > +       v4l2_std_id std =3D 0;
> >         /* It makes no sense to get the format of the analog sink pads =
*/
> >         if (sdformat->pad !=3D ADV748X_AFE_SOURCE)
> > @@ -361,6 +363,9 @@ static int adv748x_afe_get_format(struct
> v4l2_subdev *sd,
> >                 mbusformat =3D v4l2_subdev_get_try_format(sd, cfg, sdfo=
rmat-
> >pad);
> >                 sdformat->format =3D *mbusformat;
> >         } else {
> > +               /* Set std_id automatically */
> > +               adv748x_afe_querystd(sd, &std);
> > +               adv748x_afe_s_std(sd, std);
> >                 adv748x_afe_fill_format(afe, &sdformat->format);
> >                 adv748x_afe_propagate_pixelrate(afe);
> >

Regards,
Biju



Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
