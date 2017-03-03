Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from slow1-d.mail.gandi.net ([217.70.178.86]:33070 "EHLO
        slow1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751269AbdCCN1x (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 3 Mar 2017 08:27:53 -0500
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
        by slow1-d.mail.gandi.net (Postfix) with ESMTP id 135AF4961B1
        for <linux-renesas-soc@vger.kernel.org>; Fri,  3 Mar 2017 13:39:01 +0100 (CET)
Subject: Re: [PATCH] drm: rcar-du: Make sure DRM planes are created by VSP1
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
References: <1488528578-26978-1-git-send-email-jacopo+renesas@jmondi.org>
 <2578296.10DKCH3R7T@avalon>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
From: jacopo mondi <jacopo@jmondi.org>
Message-ID: <2fcd3ee9-eb17-aaef-a2d7-158c8c7985a9@jmondi.org>
Date: Fri, 3 Mar 2017 13:37:56 +0100
MIME-Version: 1.0
In-Reply-To: <2578296.10DKCH3R7T@avalon>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

HI Laurent,

On 03/03/2017 12:26, Laurent Pinchart wrote:
> Hi Jacopo,
>
> Thank you for the patch.
>
> On Friday 03 Mar 2017 09:09:38 Jacopo Mondi wrote:
>> On Gen3 platforms compositing planes are allocated  by VSP on behalf of
>> DRM/KMS.
>> If VSP support is not compiled in, vsp1 initialization stub routine is
>> called, leading to invalid memory accesses later on when un-initialized
>> planes are accessed.
>>
>> Fail explicitly earlier if planes are not properly created.
>>
>> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
>> ---
>>  drivers/gpu/drm/rcar-du/rcar_du_kms.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
>> b/drivers/gpu/drm/rcar-du/rcar_du_kms.c index b5d3f16..7f56c09 100644
>> --- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
>> +++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
>> @@ -616,6 +616,9 @@ int rcar_du_modeset_init(struct rcar_du_device *rcdu)
>>  			ret = rcar_du_vsp_init(vsp);
>>  			if (ret < 0)
>>  				return ret;
>> +
>> +			if (!vsp->planes)
>> +				return -EINVAL;
>
> Given that this code is only called when the DU hardware requires the VSP to
> operate, how about modifying the rcar_du_vsp_init() stub function to return -
> ENXIO instead of 0 ? That way you won't need to add an additional check here.
>

Ok, I'll make sure it is only called there also.

> Ideally we should require VSP through Kconfig as well. If you feel like
> submitting a patch (and testing it with various combinations of module and
> built-in) it would be appreciated.

That would be ideal.
Am I wrong or the condition that selects DRM_RCAR_VSP is (DRM_RCAR_DU && 
Gen3-platform)? Implying that on Gen2 DU can live without VSP enabled?

Thanks
    j


>
>>  		}
>>  	}
>
