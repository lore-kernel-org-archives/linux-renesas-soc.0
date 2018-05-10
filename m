Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:45130 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756582AbeEJHN1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 May 2018 03:13:27 -0400
Subject: Re: [PATCH v2 25/26] drm/bridge: require the owner .odev to be
 filled in on drm_bridge_add/attach
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
Message-ID: <6278e7a4-c67a-6198-364e-526042acc393@samsung.com>
Date: Thu, 10 May 2018 09:13:16 +0200
MIME-Version: 1.0
In-Reply-To: <20180504135212.26977-26-peda@axentia.se>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
References: <20180504135212.26977-1-peda@axentia.se>
        <CGME20180504135352epcas5p48cd98762cd4476621f98b0356b891f7e@epcas5p4.samsung.com>
        <20180504135212.26977-26-peda@axentia.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 04.05.2018 15:52, Peter Rosin wrote:
> The .odev owner device will be handy to have around.
>
> Signed-off-by: Peter Rosin <peda@axentia.se>
Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>

 --
Regards
Andrzej
> ---
>  drivers/gpu/drm/drm_bridge.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index df084db33494..78d186b6831b 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -70,6 +70,9 @@ static LIST_HEAD(bridge_list);
>   */
>  void drm_bridge_add(struct drm_bridge *bridge)
>  {
> +	if (WARN_ON(!bridge->odev))
> +		return;
> +
>  	mutex_lock(&bridge_lock);
>  	list_add_tail(&bridge->list, &bridge_list);
>  	mutex_unlock(&bridge_lock);
> @@ -115,6 +118,9 @@ int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
>  	if (!encoder || !bridge)
>  		return -EINVAL;
>  
> +	if (WARN_ON(!bridge->odev))
> +		return -EINVAL;
> +
>  	if (previous && (!previous->dev || previous->encoder != encoder))
>  		return -EINVAL;
>  
