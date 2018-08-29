Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f177.google.com ([209.85.208.177]:42362 "EHLO
        mail-lj1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727172AbeH2PR7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Aug 2018 11:17:59 -0400
Received: by mail-lj1-f177.google.com with SMTP id f1-v6so4035749ljc.9
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Aug 2018 04:21:32 -0700 (PDT)
From: "Niklas =?iso-8859-1?Q?S=F6derlund?=" <niklas.soderlund@ragnatech.se>
Date: Wed, 29 Aug 2018 13:21:30 +0200
To: Biju Das <biju.das@bp.renesas.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        KOJI MATSUOKA <koji.matsuoka.xm@renesas.com>,
        RYO KATAOKA <ryo.kataoka.wt@renesas.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: Regarding VIN test(cvbs capture:- PAL resolution)
Message-ID: <20180829112130.GH15572@bigcity.dyn.berto.se>
References: <OSBPR01MB2103D30E0C6946B72A701D2CB8090@OSBPR01MB2103.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <OSBPR01MB2103D30E0C6946B72A701D2CB8090@OSBPR01MB2103.jpnprd01.prod.outlook.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Biju,

On 2018-08-29 10:41:16 +0000, Biju Das wrote:
> Hi All,
> 
> I started testing vin on R-Car Gen3(CVBS  input from DVD player connected to R-Car M3-W,kernel:-renesas-devel-20180827-4.19-rc1)
> based on the information present in https://elinux.org/R-Car/Tests:rcar-vin.
> 
> Looks like PAL is not supported.
> When i execute the command, "media-ctl -d /dev/media1 --get-v4l2 "'adv748x 4-0070 afe':8"" on target
> , i get "[fmt:UYVY8_2X8/720x240 field:alternate]" instead of "[fmt:UYVY8_2X8/720x288 field:alternate]"
> 
> root@salvator-x:~# media-ctl -d /dev/media1 --get-v4l2 "'adv748x 4-0070 afe':8"
> [   28.708110] ##########afe->curr_norm=1000 V4L2_STD_525_60=f900
>                 [fmt:UYVY8_2X8/720x240 field:alternate]
> 
> Q1) Have any one observed this issue?

The format from the AFE is based on the video standard set. As v4l2 
don't allow a subdevice to autodetect and change the video standard 
automatically, you need to do this as the first step of the pipeline 
configuration. The default standard of the adv748x driver is NTSC and 
that is why this step is not strictly needed when testing a NTSC source.


1. Boot board video source off and check formats

    $ v4l2-ctl --get-detected-standard -d /dev/v4l-subdev23
    Video Standard = 0x00000000

    $ media-ctl -d /dev/media2 --get-v4l2 "'adv748x 4-0070 afe':8"
    [fmt:UYVY8_2X8/720x240 field:alternate colorspace:smpte170m]

2. Turn on video PAL source and check formats


    $ v4l2-ctl --get-detected-standard -d /dev/v4l-subdev23
    Video Standard = 0x000000ff
	PAL-B/B1/G/H/I/D/D1

    $ media-ctl -d /dev/media2 --get-v4l2 "'adv748x 4-0070 afe':8"
    [fmt:UYVY8_2X8/720x240 field:alternate colorspace:smpte170m]

    Notice that the resolution is still for NTSC.

3. Set video standard of the AFE and check format

    $ v4l2-ctl --set-standard=0x000000ff -d /dev/v4l-subdev23
    Standard set to 80000000000000ff

    $ media-ctl -d /dev/media2 --get-v4l2 "'adv748x 4-0070 afe':8"
    [fmt:UYVY8_2X8/720x288 field:alternate colorspace:smpte170m]

    You now have a correct standard for the AFE and can configure a 
    correct pipeline to capture PAL.

> 
> So I created a patch[2], based on [1]. With this, I get proper PAL resolution(720x576)
> 
> root@salvator-x:~# media-ctl -d /dev/media1 --get-v4l2 "'adv748x 4-0070 afe':8"
> [   42.472582] ##########afe->curr_norm=ff V4L2_STD_525_60=f900
>                 [fmt:UYVY8_2X8/720x288 field:alternate]
> 
> Q2) Is there any reason for not upstreaming the patch [1]?

As Kieran stated a subdevice is not allowed to change the video standard 
on it's own. Instead the user is required to ask the subevice which 
standard it detects and explicitly set that standard when configuring 
the video pipeline before capturing.

> 
> [1] https://kernel.googlesource.com/pub/scm/linux/kernel/git/horms/renesas-bsp/+/e0740949ae6b964da8bf1e88b504405276652aa7%5E%21/#F0
> 
> [2]
> --- a/drivers/media/i2c/adv748x/adv748x-afe.c
> +++ b/drivers/media/i2c/adv748x/adv748x-afe.c
> 
> @ -352,6 +353,7 @@ static int adv748x_afe_get_format(struct v4l2_subdev *sd,
> {
>         struct adv748x_afe *afe = adv748x_sd_to_afe(sd);
>         struct v4l2_mbus_framefmt *mbusformat;
> +       v4l2_std_id std = 0;
>         /* It makes no sense to get the format of the analog sink pads */
>         if (sdformat->pad != ADV748X_AFE_SOURCE)
> @@ -361,6 +363,9 @@ static int adv748x_afe_get_format(struct v4l2_subdev *sd,
>                 mbusformat = v4l2_subdev_get_try_format(sd, cfg, sdformat->pad);
>                 sdformat->format = *mbusformat;
>         } else {
> +               /* Set std_id automatically */
> +               adv748x_afe_querystd(sd, &std);
> +               adv748x_afe_s_std(sd, std);
>                 adv748x_afe_fill_format(afe, &sdformat->format);
>                 adv748x_afe_propagate_pixelrate(afe);
> 
> 
> Regards,
> Biju
> 
> 
> 
> 
> Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, Buckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered No. 04586709.

-- 
Regards,
Niklas S�derlund
