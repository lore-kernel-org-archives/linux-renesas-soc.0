Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:36324 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727204AbeH2PUb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Aug 2018 11:20:31 -0400
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
 <5cfff34d-c270-c4e7-15bc-d43d88c510ea@ideasonboard.com>
 <OSBPR01MB2103B82E4577312ABBB9B3F1B8090@OSBPR01MB2103.jpnprd01.prod.outlook.com>
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Message-ID: <414516b4-c40e-be3e-bf22-19c52ba3ae07@ideasonboard.com>
Date: Wed, 29 Aug 2018 12:24:00 +0100
MIME-Version: 1.0
In-Reply-To: <OSBPR01MB2103B82E4577312ABBB9B3F1B8090@OSBPR01MB2103.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Biju,

On 29/08/18 12:19, Biju Das wrote:
> Hi Kieran,
> 
> Thanks for the feedback.
> 

<snip>

>> Could you check to see the output of any of the following is correct:
>>
>> media-ctl -d /dev/media1 --get-v4l2 "'adv748x 4-0070 afe':0"
>> .. (and 1,2,3,4,5,6 if necessary)
>> media-ctl -d /dev/media1 --get-v4l2 "'adv748x 4-0070 afe':7"
> 
> Please find the output.
> 
> root@salvator-x:~# media-ctl -d /dev/media1 --get-v4l2 "'adv748x 4-0070 afe':0"
> root@salvator-x:~# media-ctl -d /dev/media1 --get-v4l2 "'adv748x 4-0070 afe':1"
> root@salvator-x:~# media-ctl -d /dev/media1 --get-v4l2 "'adv748x 4-0070 afe':2"
> root@salvator-x:~# media-ctl -d /dev/media1 --get-v4l2 "'adv748x 4-0070 afe':3"
> root@salvator-x:~# media-ctl -d /dev/media1 --get-v4l2 "'adv748x 4-0070 afe':4"
> root@salvator-x:~# media-ctl -d /dev/media1 --get-v4l2 "'adv748x 4-0070 afe':5"
> root@salvator-x:~# media-ctl -d /dev/media1 --get-v4l2 "'adv748x 4-0070 afe':6"
> root@salvator-x:~# media-ctl -d /dev/media1 --get-v4l2 "'adv748x 4-0070 afe':7"
> root@salvator-x:~# media-ctl -d /dev/media1 --get-v4l2 "'adv748x 4-0070 afe':8"
> [ 2589.712578] ##########afe->curr_norm=1000 V4L2_STD_525_60=f900
>                 [fmt:UYVY8_2X8/720x240 field:alternate]
> 


Aha - OK - I'm sorry - I was telling you the wrong way to detect.

Please see Niklas' recent e-mail :)

--
Kieran
