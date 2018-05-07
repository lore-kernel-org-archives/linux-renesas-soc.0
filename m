Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-db5eur01on0094.outbound.protection.outlook.com ([104.47.2.94]:23088
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1750881AbeEGNnL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 May 2018 09:43:11 -0400
Subject: Re: [PATCH v2 26/26] drm/bridge: establish a link between the bridge
 supplier and consumer
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
 <CGME20180504135358epcas3p2bd9c2f5c9a8295152f2c96fdbb2ea8b1@epcas3p2.samsung.com>
 <20180504135212.26977-27-peda@axentia.se>
 <4cdcd215-8caf-e045-a478-f438f128c9f2@samsung.com>
From: Peter Rosin <peda@axentia.se>
Message-ID: <9751c1c5-f2fa-f24e-64f3-71019f253332@axentia.se>
Date: Mon, 7 May 2018 15:43:01 +0200
MIME-Version: 1.0
In-Reply-To: <4cdcd215-8caf-e045-a478-f438f128c9f2@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 2018-05-07 14:59, Andrzej Hajda wrote:
> On 04.05.2018 15:52, Peter Rosin wrote:
>> If the bridge supplier is unbound, this will bring the bridge consumer
>> down along with the bridge. Thus, there will no longer linger any
>> dangling pointers from the bridge consumer (the drm_device) to some
>> non-existent bridge supplier.
> 
> I understand rationales behind this patch, but it is another step into
> making drm_dev one big driver with subcomponents, where drm will work
> only if every subcomponent is working/loaded.

The step is very small IMHO. Just a device-link, which is very easy to
remove once whatever other solution is ready.

>                                               Do we need to go this way?

If the drivers expect the parts to be there, and there is no other safety
net in place if they are not, what is the (short-term) alternative?

> In case of many platforms such approach results in display turned on
> very late on boot for example due to late initialization of some
> regulator exposed by some i2c device, which is used by hdmi bridge. And
> this hdmi bridge is just to provide alternative(rarely used) display
> path, the main display path would work anyway.

This patch does not contribute to any late init and any such delay is not
affected by this. At all.

> So the main question to drm maintainers is about evolution of bridges,
> if drm_bridges should become mandatory components of drm device or they
> could be added/removed dynamically?

That is a much bigger question than this patch/series. Conflating the
two is not fair IMHO. You could run this very same argument for every
driver that gets added, since any additional driver will just make it
harder to make everything dynamic. Should we stop development right
away?

Besides, as long as the drm devices are in fact acting as big static
drivers (built from smaller parts), this should be considered a bug-fix
that will prevent dereference of stale pointers.

Or will some other solution appear and magically make all bridges and
drm drivers capable of dynamic reconfiguration in the next few weeks?
Yeah, right...

Cheers,
Peter

> Regards
> Andrzej
> 
> 
>>
>> Signed-off-by: Peter Rosin <peda@axentia.se>
>> ---
>>  drivers/gpu/drm/drm_bridge.c | 18 ++++++++++++++++++
>>  include/drm/drm_bridge.h     |  2 ++
>>  2 files changed, 20 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
>> index 78d186b6831b..0259f0a3ff27 100644
>> --- a/drivers/gpu/drm/drm_bridge.c
>> +++ b/drivers/gpu/drm/drm_bridge.c
>> @@ -26,6 +26,7 @@
>>  #include <linux/mutex.h>
>>  
>>  #include <drm/drm_bridge.h>
>> +#include <drm/drm_device.h>
>>  #include <drm/drm_encoder.h>
>>  
>>  #include "drm_crtc_internal.h"
>> @@ -127,12 +128,25 @@ int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
>>  	if (bridge->dev)
>>  		return -EBUSY;
>>  
>> +	if (encoder->dev->dev != bridge->odev) {
>> +		bridge->link = device_link_add(encoder->dev->dev,
>> +					       bridge->odev, 0);
>> +		if (!bridge->link) {
>> +			dev_err(bridge->odev, "failed to link bridge to %s\n",
>> +				dev_name(encoder->dev->dev));
>> +			return -EINVAL;
>> +		}
>> +	}
>> +
>>  	bridge->dev = encoder->dev;
>>  	bridge->encoder = encoder;
>>  
>>  	if (bridge->funcs->attach) {
>>  		ret = bridge->funcs->attach(bridge);
>>  		if (ret < 0) {
>> +			if (bridge->link)
>> +				device_link_del(bridge->link);
>> +			bridge->link = NULL;
>>  			bridge->dev = NULL;
>>  			bridge->encoder = NULL;
>>  			return ret;
>> @@ -159,6 +173,10 @@ void drm_bridge_detach(struct drm_bridge *bridge)
>>  	if (bridge->funcs->detach)
>>  		bridge->funcs->detach(bridge);
>>  
>> +	if (bridge->link)
>> +		device_link_del(bridge->link);
>> +	bridge->link = NULL;
>> +
>>  	bridge->dev = NULL;
>>  }
>>  
>> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
>> index b656e505d11e..804189c63a4c 100644
>> --- a/include/drm/drm_bridge.h
>> +++ b/include/drm/drm_bridge.h
>> @@ -261,6 +261,7 @@ struct drm_bridge_timings {
>>   * @list: to keep track of all added bridges
>>   * @timings: the timing specification for the bridge, if any (may
>>   * be NULL)
>> + * @link: drm consumer <-> bridge supplier
>>   * @funcs: control functions
>>   * @driver_private: pointer to the bridge driver's internal context
>>   */
>> @@ -271,6 +272,7 @@ struct drm_bridge {
>>  	struct drm_bridge *next;
>>  	struct list_head list;
>>  	const struct drm_bridge_timings *timings;
>> +	struct device_link *link;
>>  
>>  	const struct drm_bridge_funcs *funcs;
>>  	void *driver_private;
> 
> 
