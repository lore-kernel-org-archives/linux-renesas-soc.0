Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:57819 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756305AbeEJHAe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 May 2018 03:00:34 -0400
Subject: Re: [PATCH v2 01/26] drm/bridge: allow optionally specifying an
 owner .odev device
To: Peter Rosin <peda@axentia.se>, linux-kernel@vger.kernel.org
Cc: Archit Taneja <architt@codeaurora.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Peter Senna Tschudin <peter.senna@collabora.com>,
        Martin Donnelly <martin.donnelly@ge.com>,
        Martyn Welch <martyn.welch@collabora.co.uk>,
        Gustavo Padovan <gustavo@padovan.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Sean Paul <seanpaul@chromium.org>,
        Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        CK Hu <ck.hu@mediatek.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Clark <robdclark@gmail.com>,
        Sandy Huang <hjc@rock-chips.com>,
        =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Vincent Abriou <vincent.abriou@st.com>,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, Jyri Sarha <jsarha@ti.com>,
        Daniel Vetter <daniel@ffwll.ch>
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <603ed606-022b-6520-149d-3b333123cfcf@samsung.com>
Date: Thu, 10 May 2018 09:00:26 +0200
MIME-Version: 1.0
In-Reply-To: <5abcab35-8a78-a02a-9f22-321da55d9858@axentia.se>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
References: <20180504135212.26977-1-peda@axentia.se>
        <CGME20180504135245epcas4p1d0463b6b3c73d1dd2550c6ed5a4e3986@epcas4p1.samsung.com>
        <20180504135212.26977-2-peda@axentia.se>
        <4e92fdea-0609-0fff-0e3f-d9f78f596eb7@samsung.com>
        <4be4448e-763c-4832-f194-6b79afe87d08@axentia.se>
        <5abcab35-8a78-a02a-9f22-321da55d9858@axentia.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 10.05.2018 00:21, Peter Rosin wrote:
> On 2018-05-09 17:53, Peter Rosin wrote:
>> On 2018-05-09 17:08, Andrzej Hajda wrote:
>>> On 04.05.2018 15:51, Peter Rosin wrote:
>>>> Bridge drivers can now (temporarily, in a transition phase) select if
>>>> they want to provide a full owner device or keep just providing an
>>>> of_node.
>>>>
>>>> By providing a full owner device, the bridge drivers no longer need
>>>> to provide an of_node since that node is available via the owner
>>>> device.
>>>>
>>>> When all bridge drivers provide an owner device, that will become
>>>> mandatory and the .of_node member will be removed.
>>>>
>>>> Signed-off-by: Peter Rosin <peda@axentia.se>
>>>> ---
>>>>  drivers/gpu/drm/drm_bridge.c             | 3 ++-
>>>>  drivers/gpu/drm/rockchip/rockchip_lvds.c | 4 +++-
>>> What is the reason to put rockchip here? Shouldn't be in separate patch?
>> Because the rockchip driver peeks into the bridge struct and all the
>> changes in this patch relate to making the new .odev member optional in
>> the transition phase, when the bridge can have either a new-style odev
>> or an old style of_node.
>>
>> I guess this rockchip change could be patch 2, but it has to come first
>> after this patch and it makes no sense on its own. Hence, one patch.
>>
>> This rockchip_lvds interaction is also present in patch 24/26
>> drm/bridge: remove the .of_node member
>>
>> I can split them if you want, but I personally don't see the point.
> I had a second look, and maybe the series should start with a patch like
> this instead, so that the rockchip_lvds.c hunks can be removed from
> patch 1/26 and 24/26. That would perhaps be slightly cleaner?
>
> On the other hand, it's orthogonal and this series can be left as is
> (with the benefit of me not having to do another iteration and you all
> not having another bunch of messages to sift through). The below
> patch could easily be (adjusted and) applied later instead. Or not,
> since the right fix is to do this with the newfangled static image
> format mechanism from Jacopo Mondi, and it might be easier to just do
> it right.
>
> State your preference.

For me the current version is OK, it maybe lacks explanation why do you
need to touch rockchip, from my PoV it did not seem so obvious.
Somebody should fix rockchip to use Jacopo's approach instead of
violating abstractions, but this is another story.

With or without added missing explanation:

Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>

 --
Regards
Andrzej


>
> Cheers,
> Peter
>
> >From dee27b36a36acd271459d1489336b56132097425 Mon Sep 17 00:00:00 2001
> From: Peter Rosin <peda@axentia.se>
> Date: Wed, 9 May 2018 23:58:24 +0200
> Subject: [PATCH] drm/rockchip: lvds: do not dig into the DT of remote bridges
>
> The driver is trying to find the needed "data-mapping" for
> interacting with the following bridge in the graphics chain.
> But, doing so is bad since it is done w/o regard of the
> compatible of the remote bridge, so the value of "data-mapping"
> might not mean what this driver assumes. It is also pointless
> since no bridge has any documented "data-mapping" DT property
> and no dts file show any undocumented use.
>
> Just remove the inappropriate code.
>
> Signed-off-by: Peter Rosin <peda@axentia.se>
> ---
>  drivers/gpu/drm/rockchip/rockchip_lvds.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/rockchip/rockchip_lvds.c b/drivers/gpu/drm/rockchip/rockchip_lvds.c
> index 4bd94b167d2c..fa3f4bf9712f 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_lvds.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_lvds.c
> @@ -377,8 +377,6 @@ static int rockchip_lvds_bind(struct device *dev, struct device *master,
>  	}
>  	if (lvds->panel)
>  		remote = lvds->panel->dev->of_node;
> -	else
> -		remote = lvds->bridge->of_node;
>  	if (of_property_read_string(dev->of_node, "rockchip,output", &name))
>  		/* default set it as output rgb */
>  		lvds->output = DISPLAY_OUTPUT_RGB;
