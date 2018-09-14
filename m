Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:36040 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727013AbeINSfQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Sep 2018 14:35:16 -0400
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH 2/3] drm: rcar-du: Add pixel format support
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>
References: <20180831181259.29529-1-kieran.bingham+renesas@ideasonboard.com>
 <20180831181259.29529-3-kieran.bingham+renesas@ideasonboard.com>
 <3865052.iN5JJav0kF@avalon>
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Message-ID: <b338a8f7-6af6-8e35-7de3-67f43dd2d52d@ideasonboard.com>
Date: Fri, 14 Sep 2018 14:20:43 +0100
MIME-Version: 1.0
In-Reply-To: <3865052.iN5JJav0kF@avalon>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

On 14/09/18 12:17, Laurent Pinchart wrote:
> Hi Kieran,
> 
> On Friday, 31 August 2018 21:12:58 EEST Kieran Bingham wrote:
>> From: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
>>
>> This patch supports pixel format of RGB332, ARGB4444, XRGB4444,
>> BGR888, RGB888, BGRA8888, BGRX8888 and YVYU.
>> VYUY pixel format is not supported by H/W specification.
> 
> Should VYUY be removed from rcar_du_vsp.c ? This can be done in a separate 
> patch.

On further consideration - yes, I believe it should.

Removal patch generated, and doesn't negatively affect the current
kms-tests, so expect it in your inbox imminently.

--
Regards

Kieran


> 
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
> 
