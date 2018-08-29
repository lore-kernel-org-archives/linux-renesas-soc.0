Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:1141 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727254AbeH2PPo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Aug 2018 11:15:44 -0400
From: Biju Das <biju.das@bp.renesas.com>
To: "kieran.bingham+renesas@ideasonboard.com"
        <kieran.bingham+renesas@ideasonboard.com>,
        =?iso-8859-1?Q?Niklas_S=F6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        KOJI MATSUOKA <koji.matsuoka.xm@renesas.com>,
        RYO KATAOKA <ryo.kataoka.wt@renesas.com>
CC: Chris Paterson <Chris.Paterson2@renesas.com>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: Regarding VIN test(cvbs capture:- PAL resolution)
Date: Wed, 29 Aug 2018 11:19:13 +0000
Message-ID: <OSBPR01MB2103B82E4577312ABBB9B3F1B8090@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <OSBPR01MB2103D30E0C6946B72A701D2CB8090@OSBPR01MB2103.jpnprd01.prod.outlook.com>
 <5cfff34d-c270-c4e7-15bc-d43d88c510ea@ideasonboard.com>
In-Reply-To: <5cfff34d-c270-c4e7-15bc-d43d88c510ea@ideasonboard.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Kieran,

Thanks for the feedback.

> Subject: Re: Regarding VIN test(cvbs capture:- PAL resolution)

> On 29/08/18 11:41, Biju Das wrote:
> > Hi All,
> >
> >
> >
> > I started testing vin on R-Car Gen3(CVBS  input from DVD player
> > connected to R-Car M3-W,kernel:-renesas-devel-20180827-4.19-rc1)
> >
> > based on the information present in https://elinux.org/R-Car/Tests:rcar=
-
> vin.
> >
> >
> >
> > Looks like PAL is not supported.
> >
> > When i execute the command, "media-ctl -d /dev/media1 --get-v4l2
> > "'adv748x 4-0070 afe':8"" on target
> >
>
> This looks like a bug in the documentation at https://elinux.org/R-
> Car/Tests:rcar-vin. It's 'getting' the format of the source pad of the AF=
E.
>
>
> > , i get "[fmt:UYVY8_2X8/720x240 field:alternate]" instead of
> > "[fmt:UYVY8_2X8/720x288 field:alternate]"
>
> Hrm ... this is getting the format of the source pad of the AFE - which i=
s
> manually set, but the get_fmt should be done on the SINK pad of the AFE.
> (ideally on the correct input port)
>
> Could you check to see the output of any of the following is correct:
>
> media-ctl -d /dev/media1 --get-v4l2 "'adv748x 4-0070 afe':0"
> .. (and 1,2,3,4,5,6 if necessary)
> media-ctl -d /dev/media1 --get-v4l2 "'adv748x 4-0070 afe':7"

Please find the output.

root@salvator-x:~# media-ctl -d /dev/media1 --get-v4l2 "'adv748x 4-0070 afe=
':0"
root@salvator-x:~# media-ctl -d /dev/media1 --get-v4l2 "'adv748x 4-0070 afe=
':1"
root@salvator-x:~# media-ctl -d /dev/media1 --get-v4l2 "'adv748x 4-0070 afe=
':2"
root@salvator-x:~# media-ctl -d /dev/media1 --get-v4l2 "'adv748x 4-0070 afe=
':3"
root@salvator-x:~# media-ctl -d /dev/media1 --get-v4l2 "'adv748x 4-0070 afe=
':4"
root@salvator-x:~# media-ctl -d /dev/media1 --get-v4l2 "'adv748x 4-0070 afe=
':5"
root@salvator-x:~# media-ctl -d /dev/media1 --get-v4l2 "'adv748x 4-0070 afe=
':6"
root@salvator-x:~# media-ctl -d /dev/media1 --get-v4l2 "'adv748x 4-0070 afe=
':7"
root@salvator-x:~# media-ctl -d /dev/media1 --get-v4l2 "'adv748x 4-0070 afe=
':8"
[ 2589.712578] ##########afe->curr_norm=3D1000 V4L2_STD_525_60=3Df900
                [fmt:UYVY8_2X8/720x240 field:alternate]

>
> I don't recall which pad is used on the Salvator-XS - and the media contr=
ol
> output doesn't make that clear - so we should improve that.
>
>
> Anyway, then - Could you try setting the PAL format manually ?
>
> >  media-ctl -d /dev/media0 -V "'adv748x 4-0070 afe':8
> [fmt:UYVY8_2X8/720x288 field:alternate]"
> >  media-ctl -d /dev/media0 -V "'rcar_csi2 fea80000.csi2':1
> [fmt:UYVY8_2X8/720x288 field:alternate]"

I tried this, it is not capturing the data, broken pipe,

root@salvator-x:~# media-ctl -d /dev/media1 -l "'rcar_csi2 fea80000.csi2':1=
 -> 'VIN1 output':0 [1]"
root@salvator-x:~# media-ctl -d /dev/media1 -V "'rcar_csi2 fea80000.csi2':1=
 [fmt:UYVY8_2X8/720x288 field:alternate]"
root@salvator-x:~# media-ctl -d /dev/media1 -V "'adv748x 4-0070 afe':8 [fmt=
:UYVY8_2X8/720x288 field:alternate]"
[ 3102.288488] ##########afe->curr_norm=3D1000 V4L2_STD_525_60=3Df900
root@salvator-x:~# /yavta -f RGB565 -s 720x576 --field interlaced -n 4 --ca=
pture=3D10 -F -F /dev/video7
Device /dev/video7 opened.
Device `R_Car_VIN' on `platf[ 3111.778791] ##########afe->curr_norm=3D1000 =
V4L2_STD_525_60=3Df900
orm:e6ef1000.video' (driver 'rcar_vin') supports video, capture, without mp=
lanes.
Video format set: RGB565 (50424752) 720x576 (stride 1440) field interlaced =
buffer size 829440
Video format: RGB565 (50424752) 720x576 (stride 1440) field interlaced buff=
er size 829440
4 buffers requested.
length: 829440 offset: 0 timestamp type/source: mono/EoF
Buffer 0/0 mapped at address 0xffffbbf61000.
length: 829440 offset: 831488 timestamp type/source: mono/EoF
Buffer 1/0 mapped at address 0xffffbbe96000.
length: 829440 offset: 1662976 timestamp type/source: mono/EoF
Buffer 2/0 mapped at address 0xffffbbdcb000.
length: 829440 offset: 2494464 timestamp type/source: mono/EoF
Buffer 3/0 mapped at address 0xffffbbd00000.
Unable to start streaming: Broken pipe (32).
4 buffers released.

But if I configure for 720x480, it captures the data properly
---------------------------------------------------------------------------=
----
media-ctl -d /dev/media1 -V "'rcar_csi2 fea80000.csi2':1 [fmt:UYVY8_2X8/720=
x240 field:alternate]"
media-ctl -d /dev/media1 -V "'adv748x 4-0070 afe':8 [fmt:UYVY8_2X8/720x240 =
field:alternate]"

root@salvator-x:~# /yavta -f RGB565 -s 720x480 --field interlaced -n 4 --ca=
pture=3D10 -F -F /dev/video7
Device /dev/video7 opened.
Device `R_Car_VIN' on `platf[ 3204.676120] ##########afe->curr_norm=3D1000 =
V4L2_STD_525_60=3Df900
orm:e6ef1000.video' (driver 'rcar_vin') supports video, capture, without mp=
lanes.
Video format set: RGB565 (50424752) 720x480 (stride 1440) field interlaced =
buffer size 691200
Video format: RGB565 (50424752) 720x480 (stride 1440) field interlaced buff=
er size 691200
4 buffers requested.
length: 691200 offset: 0 timestamp type/source: mono/EoF
Buffer 0/0 mapped at address 0xffffa73d5000.
length: 691200 offset: 692224 timestamp type/source: mono/EoF
Buffer 1/0 mapped at address 0xffffa732c000.
length: 691200 offset: 1384448 timestamp type/source: mono/EoF
Buffer 2/0 mapped at address 0xffffa7283000.
length: 691200 offset: 2076672 timestamp type/source: mono/EoF
Buffer 3/0 mapped at address 0xffffa71da000.
0 (0) [-] interlaced 0 691200 B 3204.806369 3204.806392 11.133 fps ts mono/=
EoF
1 (1) [-] interlaced 1 691200 B 3204.846371 3205.331077 24.999 fps ts mono/=
EoF
2 (2) [-] interlaced 2 691200 B 3204.886370 3205.805796 25.001 fps ts mono/=
EoF
3 (3) [-] interlaced 3 691200 B 3204.926372 3206.241537 24.999 fps ts mono/=
EoF
4 (0) [-] interlaced 17 691200 B 3205.486375 3206.677245 1.786 fps ts mono/=
EoF
5 (1) [-] interlaced 28 691200 B 3205.926382 3207.110142 2.273 fps ts mono/=
EoF
6 (2) [-] interlaced 39 691200 B 3206.366383 3207.545465 2.273 fps ts mono/=
EoF
7 (3) [-] interlaced 50 691200 B 3206.806388 3207.981542 2.273 fps ts mono/=
EoF
8 (0) [-] interlaced 61 691200 B 3207.246393 3208.413540 2.273 fps ts mono/=
EoF
9 (1) [-] interlaced 72 691200 B 3207.686397 3208.849208 2.273 fps ts mono/=
EoF
Captured 10 frames in 4.132659 seconds (2.419749 fps, 1672530.534442 B/s).
4 buffers released.

> I thought the ADV748x can tell the difference between PAL/NTSC and so it
> should have detected it, so perhaps there is a bug there - but you do hav=
e to
> manually propagate the format you want regardless.
>
>
>
> >
> > root@salvator-x:~# media-ctl -d /dev/media1 --get-v4l2 "'adv748x
> > 4-0070 afe':8"
> >
> > [   28.708110] ##########afe->curr_norm=3D1000 V4L2_STD_525_60=3Df900
> >
> >                 [fmt:UYVY8_2X8/720x240 field:alternate]
> >
> >
> >
> > Q1) Have any one observed this issue?
> >
>
> I thought most of my testing was on PAL actually. - But it's a long time =
since
> I've tested the ADV748x CVBS input.
>
>
> > So I created a patch[2], based on [1]. With this, I get proper PAL
> > resolution(720x576)
> >
> >
> >
> > root@salvator-x:~# media-ctl -d /dev/media1 --get-v4l2 "'adv748x
> > 4-0070 afe':8"
> >
> > [   42.472582] ##########afe->curr_norm=3Dff V4L2_STD_525_60=3Df900
> >
> >                 [fmt:UYVY8_2X8/720x288 field:alternate]
> >
> >
> >
> > Q2) Is there any reason for not upstreaming the patch [1]?
>
> Yes, unfortunately - the V4L2 spec does not allow us to automatically det=
ect
> and then set the format.
>
> The choice of which format to set must belong to userspace.
>
>
> > [1]
> >
> https://kernel.googlesource.com/pub/scm/linux/kernel/git/horms/renesas
> > -bsp/+/e0740949ae6b964da8bf1e88b504405276652aa7%5E%21/#F0
> >
> >
> >
> > [2]
> >
> > --- a/drivers/media/i2c/adv748x/adv748x-afe.c
> >
> > +++ b/drivers/media/i2c/adv748x/adv748x-afe.c
> >
> >
> >
> > @ -352,6 +353,7 @@ static int adv748x_afe_get_format(struct
> > v4l2_subdev *sd,
> >
> > {
> >
> >         struct adv748x_afe *afe =3D adv748x_sd_to_afe(sd);
> >
> >         struct v4l2_mbus_framefmt *mbusformat;
> >
> > +       v4l2_std_id std =3D 0;
> >
> >         /* It makes no sense to get the format of the analog sink pads
> > */
> >
> >         if (sdformat->pad !=3D ADV748X_AFE_SOURCE)
> >
> > @@ -361,6 +363,9 @@ static int adv748x_afe_get_format(struct
> > v4l2_subdev *sd,
> >
> >                 mbusformat =3D v4l2_subdev_get_try_format(sd, cfg,
> > sdformat->pad);
> >
> >                 sdformat->format =3D *mbusformat;
> >
> >         } else {
> >
> > +               /* Set std_id automatically */
> >
> > +               adv748x_afe_querystd(sd, &std);
> >
> > +               adv748x_afe_s_std(sd, std);
> >
> >                 adv748x_afe_fill_format(afe, &sdformat->format);
> >
> >                 adv748x_afe_propagate_pixelrate(afe);
> >
[>] regards,
Biju



Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
