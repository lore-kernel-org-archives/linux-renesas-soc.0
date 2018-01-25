Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:35309 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751174AbeAYWA1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 25 Jan 2018 17:00:27 -0500
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: Re: DRM: double free in rcar_du_vsp.c
Reply-To: kieran.bingham@ideasonboard.com
To: Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
        linux-arm-kernel@lists.infradead.org,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        linux-renesas-soc@vger.kernel.org
References: <234140a7-8538-3ec4-1c40-e6ebcc42be8f@epam.com>
 <f61c270f-219c-56e5-a03d-e9a3e122d4b4@epam.com>
Message-ID: <8130932d-7b03-291b-df4f-3227c089fcc4@ideasonboard.com>
Date: Thu, 25 Jan 2018 22:00:23 +0000
MIME-Version: 1.0
In-Reply-To: <f61c270f-219c-56e5-a03d-e9a3e122d4b4@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Volodymyr,

My apologies for the silence on this thread, but it has not been ignored.

I believe Laurent has investigated this issue, and prepared a patch
locally on his tree. However, he is currently out-of-office with travel and may
not find time to reply to this thread this week or next.

I suspect after a bit of testing and polish he will send it out for
review/integration, or inclusion in a mainline pull-request.
--
Regards

Kieran

On 24/01/18 12:04, Volodymyr Babchuk wrote:
> 
> Looping in DRM maintainer.
> 
>> Hello,
>>
>> I have found issue with double free() in RCAR DU VSP driver. it is
>> caused by rcar_du_vsp_plane_atomic_duplicate_state(), which duplicates
>> struct rcar_du_vsp_plane_state. This struct holds sg_tables which are
>> then freed in rcar_du_vsp_plane_cleanup_fb(). This function is called
>> for every rcar_du_vsp_plane_state, so it calls sg_free_table() twice for
>> the same sg_table.
>>
>> I'm not familiar with DRM, so I can't say why this does not occur every
>> time, but this bug caused problems on our setup from time to time. Looks
>> like it occurs only under heavy system load.
>>
>> As I said, I'm not good in DRM, so I don't know the proper fix. But you
>> can find workaround at [1]. I don't know how good it is, but at least
>> it resolved issue on our setup. If drm guys think that this fix is fine
>> enough, I can push it to the  ML for a proper review.
>>
>> [1]
>> https://github.com/lorc/linux/commit/80155506d3499273155366a1d263a81baface718
>>
>> Cheers,
>> -- 
>> Volodymyr Babchuk
>>
>> _______________________________________________
>> linux-arm-kernel mailing list
>> linux-arm-kernel@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
