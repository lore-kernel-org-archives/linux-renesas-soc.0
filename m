Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ve1eur01on0116.outbound.protection.outlook.com ([104.47.1.116]:45338
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S965238AbeEIPxh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 May 2018 11:53:37 -0400
Subject: Re: [PATCH v2 01/26] drm/bridge: allow optionally specifying an owner
 .odev device
To: Andrzej Hajda <a.hajda@samsung.com>, linux-kernel@vger.kernel.org
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
References: <20180504135212.26977-1-peda@axentia.se>
 <CGME20180504135245epcas4p1d0463b6b3c73d1dd2550c6ed5a4e3986@epcas4p1.samsung.com>
 <20180504135212.26977-2-peda@axentia.se>
 <4e92fdea-0609-0fff-0e3f-d9f78f596eb7@samsung.com>
From: Peter Rosin <peda@axentia.se>
Message-ID: <4be4448e-763c-4832-f194-6b79afe87d08@axentia.se>
Date: Wed, 9 May 2018 17:53:26 +0200
MIME-Version: 1.0
In-Reply-To: <4e92fdea-0609-0fff-0e3f-d9f78f596eb7@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 2018-05-09 17:08, Andrzej Hajda wrote:
> On 04.05.2018 15:51, Peter Rosin wrote:
>> Bridge drivers can now (temporarily, in a transition phase) select if
>> they want to provide a full owner device or keep just providing an
>> of_node.
>>
>> By providing a full owner device, the bridge drivers no longer need
>> to provide an of_node since that node is available via the owner
>> device.
>>
>> When all bridge drivers provide an owner device, that will become
>> mandatory and the .of_node member will be removed.
>>
>> Signed-off-by: Peter Rosin <peda@axentia.se>
>> ---
>>  drivers/gpu/drm/drm_bridge.c             | 3 ++-
>>  drivers/gpu/drm/rockchip/rockchip_lvds.c | 4 +++-
> 
> What is the reason to put rockchip here? Shouldn't be in separate patch?

Because the rockchip driver peeks into the bridge struct and all the
changes in this patch relate to making the new .odev member optional in
the transition phase, when the bridge can have either a new-style odev
or an old style of_node.

I guess this rockchip change could be patch 2, but it has to come first
after this patch and it makes no sense on its own. Hence, one patch.

This rockchip_lvds interaction is also present in patch 24/26
drm/bridge: remove the .of_node member

I can split them if you want, but I personally don't see the point.

>>  include/drm/drm_bridge.h                 | 2 ++
>>  3 files changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
>> index 1638bfe9627c..3872f5379998 100644
>> --- a/drivers/gpu/drm/drm_bridge.c
>> +++ b/drivers/gpu/drm/drm_bridge.c
>> @@ -365,7 +365,8 @@ struct drm_bridge *of_drm_find_bridge(struct device_node *np)
>>  	mutex_lock(&bridge_lock);
>>  
>>  	list_for_each_entry(bridge, &bridge_list, list) {
>> -		if (bridge->of_node == np) {
>> +		if ((bridge->odev && bridge->odev->of_node == np) ||
>> +		    bridge->of_node == np) {
>>  			mutex_unlock(&bridge_lock);
>>  			return bridge;
>>  		}
>> diff --git a/drivers/gpu/drm/rockchip/rockchip_lvds.c b/drivers/gpu/drm/rockchip/rockchip_lvds.c
>> index 4bd94b167d2c..557e0079c98d 100644
>> --- a/drivers/gpu/drm/rockchip/rockchip_lvds.c
>> +++ b/drivers/gpu/drm/rockchip/rockchip_lvds.c
>> @@ -377,8 +377,10 @@ static int rockchip_lvds_bind(struct device *dev, struct device *master,
>>  	}
>>  	if (lvds->panel)
>>  		remote = lvds->panel->dev->of_node;
>> -	else
>> +	else if (lvds->bridge->of_node)
>>  		remote = lvds->bridge->of_node;
>> +	else
>> +		remote = lvds->bridge->odev->of_node;
> 
> I guess odev should be NULL here, or have I missed something.

s/should/could/ ???

Assuming that was what you meant and answering accordingly...

No, .odev cannot be NULL in that else branch. drm_of_find_panel_or_bridge
either found a panel or a bridge (or it failed). If it found a bridge
(which is the relevant branch for this question) that bridge would have
to have either an of_node (in the transition phase) or a valid .odev.
Otherwise the bridge could not have been found by
drm_of_find_panel_or_bridge.

*time passes*

Ahh, yes, .odev is always NULL here so you probably did mean "should".
But after patches 2-23 when bridges start populating .odev *instead*
of .of_node, .odev will not remain NULL. But as I said above, while
.odev is NULL, .of_node will never be NULL and vice versa (or
drm_of_find_panel_or_bridge could not have found the bridge) so there
is no risk of a NULL dereference.

Cheers,
Peter

> 
> Regards
> Andrzej
> 
>>  	if (of_property_read_string(dev->of_node, "rockchip,output", &name))
>>  		/* default set it as output rgb */
>>  		lvds->output = DISPLAY_OUTPUT_RGB;
>> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
>> index 3270fec46979..7c17977c3537 100644
>> --- a/include/drm/drm_bridge.h
>> +++ b/include/drm/drm_bridge.h
>> @@ -254,6 +254,7 @@ struct drm_bridge_timings {
>>  
>>  /**
>>   * struct drm_bridge - central DRM bridge control structure
>> + * @odev: device that owns the bridge
>>   * @dev: DRM device this bridge belongs to
>>   * @encoder: encoder to which this bridge is connected
>>   * @next: the next bridge in the encoder chain
>> @@ -265,6 +266,7 @@ struct drm_bridge_timings {
>>   * @driver_private: pointer to the bridge driver's internal context
>>   */
>>  struct drm_bridge {
>> +	struct device *odev;
>>  	struct drm_device *dev;
>>  	struct drm_encoder *encoder;
>>  	struct drm_bridge *next;
> 
> 
