Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:36174 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727268AbeH2O42 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Aug 2018 10:56:28 -0400
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: Regarding VIN test(cvbs capture:- PAL resolution)
To: Biju Das <biju.das@bp.renesas.com>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        KOJI MATSUOKA <koji.matsuoka.xm@renesas.com>,
        RYO KATAOKA <ryo.kataoka.wt@renesas.com>
Cc: Chris Paterson <Chris.Paterson2@renesas.com>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
References: <OSBPR01MB2103D30E0C6946B72A701D2CB8090@OSBPR01MB2103.jpnprd01.prod.outlook.com>
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Message-ID: <5cfff34d-c270-c4e7-15bc-d43d88c510ea@ideasonboard.com>
Date: Wed, 29 Aug 2018 12:00:02 +0100
MIME-Version: 1.0
In-Reply-To: <OSBPR01MB2103D30E0C6946B72A701D2CB8090@OSBPR01MB2103.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Biju,

On 29/08/18 11:41, Biju Das wrote:
> Hi All,
> 
> �
> 
> I started testing vin on R-Car Gen3(CVBS �input from DVD player
> connected to R-Car M3-W,kernel:-renesas-devel-20180827-4.19-rc1)
> 
> based on the information present in https://elinux.org/R-Car/Tests:rcar-vin.
> 
> �
> 
> Looks like PAL is not supported.
> 
> When i execute the command, "media-ctl -d /dev/media1 --get-v4l2
> "'adv748x 4-0070 afe':8"" on target
> 

This looks like a bug in the documentation at
https://elinux.org/R-Car/Tests:rcar-vin. It's 'getting' the format of
the source pad of the AFE.


> , i get "[fmt:UYVY8_2X8/720x240 field:alternate]" instead of
> "[fmt:UYVY8_2X8/720x288 field:alternate]"

Hrm ... this is getting the format of the source pad of the AFE - which
is manually set, but the get_fmt should be done on the SINK pad of the
AFE. (ideally on the correct input port)

Could you check to see the output of any of the following is correct:

media-ctl -d /dev/media1 --get-v4l2 "'adv748x 4-0070 afe':0"
.. (and 1,2,3,4,5,6 if necessary)
media-ctl -d /dev/media1 --get-v4l2 "'adv748x 4-0070 afe':7"


I don't recall which pad is used on the Salvator-XS - and the media
control output doesn't make that clear - so we should improve that.


Anyway, then - Could you try setting the PAL format manually ?

> �media-ctl -d /dev/media0 -V "'adv748x 4-0070 afe':8 [fmt:UYVY8_2X8/720x288 field:alternate]"
>  media-ctl -d /dev/media0 -V "'rcar_csi2 fea80000.csi2':1 [fmt:UYVY8_2X8/720x288 field:alternate]"

I thought the ADV748x can tell the difference between PAL/NTSC and so it
should have detected it, so perhaps there is a bug there - but you do
have to manually propagate the format you want regardless.



> 
> root@salvator-x:~# media-ctl -d /dev/media1 --get-v4l2 "'adv748x 4-0070
> afe':8"
> 
> [�� 28.708110] ##########afe->curr_norm=1000 V4L2_STD_525_60=f900
> 
> ��������������� [fmt:UYVY8_2X8/720x240 field:alternate]
> 
> �
> 
> Q1) Have any one observed this issue?
> 

I thought most of my testing was on PAL actually. - But it's a long time
since I've tested the ADV748x CVBS input.


> So I created a patch[2], based on [1]. With this, I get proper PAL
> resolution(720x576)
> 
> �
> 
> root@salvator-x:~# media-ctl -d /dev/media1 --get-v4l2 "'adv748x 4-0070
> afe':8"
> 
> [�� 42.472582] ##########afe->curr_norm=ff V4L2_STD_525_60=f900
> 
> ��������������� [fmt:UYVY8_2X8/720x288 field:alternate]
> 
> �
> 
> Q2) Is there any reason for not upstreaming the patch [1]?

Yes, unfortunately - the V4L2 spec does not allow us to automatically
detect and then set the format.

The choice of which format to set must belong to userspace.


> [1]
> https://kernel.googlesource.com/pub/scm/linux/kernel/git/horms/renesas-bsp/+/e0740949ae6b964da8bf1e88b504405276652aa7%5E%21/#F0
> 
> �
> 
> [2]
> 
> --- a/drivers/media/i2c/adv748x/adv748x-afe.c
> 
> +++ b/drivers/media/i2c/adv748x/adv748x-afe.c
> 
> �
> 
> @ -352,6 +353,7 @@ static int adv748x_afe_get_format(struct v4l2_subdev *sd,
> 
> {
> 
> ������� struct adv748x_afe *afe = adv748x_sd_to_afe(sd);
> 
> ������� struct v4l2_mbus_framefmt *mbusformat;
> 
> +������ v4l2_std_id std = 0;
> 
> ��������/* It makes no sense to get the format of the analog sink pads */
> 
> ������� if (sdformat->pad != ADV748X_AFE_SOURCE)
> 
> @@ -361,6 +363,9 @@ static int adv748x_afe_get_format(struct v4l2_subdev
> *sd,
> 
> ��������������� mbusformat = v4l2_subdev_get_try_format(sd, cfg,
> sdformat->pad);
> 
> ��������������� sdformat->format = *mbusformat;
> 
> ������� } else {
> 
> +�������������� /* Set std_id automatically */
> 
> +�������������� adv748x_afe_querystd(sd, &std);
> 
> +�������������� adv748x_afe_s_std(sd, std);
> 
> ��������������� adv748x_afe_fill_format(afe, &sdformat->format);
> 
> ��������������� adv748x_afe_propagate_pixelrate(afe);
> 
> ���������������
> 
> �
> 
> Regards,
> 
> Biju
> 
> 
> 
> 
> Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne
> End, Buckinghamshire, SL8 5FH, UK. Registered in England & Wales under
> Registered No. 04586709.
> 
