Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:35844 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727013AbeINSQi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Sep 2018 14:16:38 -0400
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH 2/3] drm: rcar-du: Add pixel format support
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>
References: <20180831181259.29529-1-kieran.bingham+renesas@ideasonboard.com>
 <20180831181259.29529-3-kieran.bingham+renesas@ideasonboard.com>
 <9318122.8LJjaKzHaP@avalon>
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Message-ID: <e9a443fa-729b-fad9-cb06-9a8d2d65b408@ideasonboard.com>
Date: Fri, 14 Sep 2018 14:02:09 +0100
MIME-Version: 1.0
In-Reply-To: <9318122.8LJjaKzHaP@avalon>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

On 14/09/18 12:11, Laurent Pinchart wrote:
> Hi Kieran,
> 
> Thank you for the patch.
> 
> How about renaming the subject line to "Add support for missing pixel formats" 
> ?
> 

Ack.

> On Friday, 31 August 2018 21:12:58 EEST Kieran Bingham wrote:
>> From: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
>>
>> This patch supports pixel format of RGB332, ARGB4444, XRGB4444,
>> BGR888, RGB888, BGRA8888, BGRX8888 and YVYU.
>> VYUY pixel format is not supported by H/W specification.
>>
>> Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
>> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>>
>> ---
>>
>> This patch does not remove existing support for multiplanar YVUY, even
>> though the hardware does not explicitly provide it, because we support
>> it through software by swapping the plane buffers.
>>
>>  drivers/gpu/drm/rcar-du/rcar_du_kms.c | 32 +++++++++++++++++++++++++++
>>  1 file changed, 32 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
>> b/drivers/gpu/drm/rcar-du/rcar_du_kms.c index 7c7aff8cdf77..d1bd174ec893
>> 100644
>> --- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
>> +++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
>> @@ -124,6 +124,38 @@ static const struct rcar_du_format_info
>> rcar_du_format_infos[] = { .fourcc = DRM_FORMAT_YVU444,
>>  		.bpp = 24,
>>  		.planes = 3,
>> +	}, {
>> +		.fourcc = DRM_FORMAT_RGB332,
>> +		.bpp = 8,
>> +		.planes = 1,
>> +	}, {
>> +		.fourcc = DRM_FORMAT_ARGB4444,
>> +		.bpp = 16,
>> +		.planes = 1,
>> +	}, {
>> +		.fourcc = DRM_FORMAT_XRGB4444,
>> +		.bpp = 16,
>> +		.planes = 1,
>> +	}, {
>> +		.fourcc = DRM_FORMAT_BGR888,
>> +		.bpp = 24,
>> +		.planes = 1,
>> +	}, {
>> +		.fourcc = DRM_FORMAT_RGB888,
>> +		.bpp = 24,
>> +		.planes = 1,
>> +	}, {
>> +		.fourcc = DRM_FORMAT_BGRA8888,
>> +		.bpp = 32,
>> +		.planes = 1,
>> +	}, {
>> +		.fourcc = DRM_FORMAT_BGRX8888,
>> +		.bpp = 32,
>> +		.planes = 1,
>> +	}, {
>> +		.fourcc = DRM_FORMAT_YVYU,
>> +		.bpp = 16,
>> +		.planes = 1,
>>  	},
>>  };
> 
> I would list the RGB formats first, followed by the packed YUV format, and 
> then the multiplanar YUV formats. With this changed,
> 
Ack.

> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> If you're fine with the changes there's no need to resubmit.


That's fine by me.

Thanks

--
Kieran
