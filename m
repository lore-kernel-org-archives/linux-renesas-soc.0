Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt1-f195.google.com ([209.85.160.195]:34077 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731548AbeKVFcA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 22 Nov 2018 00:32:00 -0500
Received: by mail-qt1-f195.google.com with SMTP id r14so4981069qtp.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Nov 2018 10:56:28 -0800 (PST)
Message-ID: <db5924d66229bd8b50e44395ace64ae2293fa78d.camel@redhat.com>
Subject: Re: [PATCH 6/9] drm: remove deprecated
 "drm_connector_[un]reference" functions
From: Lyude Paul <lyude@redhat.com>
To: Fernando Ramos <greenfoo@gluegarage.com>,
        dri-devel@lists.freedesktop.org
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Gilles Muller <Gilles.Muller@lip6.fr>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        linux-kernel@vger.kernel.org, Gerd Hoffmann <kraxel@redhat.com>,
        cocci@systeme.lip6.fr, Marek Vasut <marex@denx.de>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Alexey Brodkin <abrodkin@synopsys.com>,
        David Airlie <airlied@linux.ie>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Russell King <linux+etnaviv@armlinux.org.uk>,
        Nicolas Palix <nicolas.palix@imag.fr>,
        etnaviv@lists.freedesktop.org,
        Boris Brezillon <boris.brezillon@bootlin.com>,
        virtualization@lists.linux-foundation.org,
        Sean Paul <sean@poorly.run>,
        linux-arm-kernel@lists.infradead.org,
        Michal Marek <michal.lkml@markovi.net>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Julia Lawall <Julia.Lawall@lip6.fr>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Shawn Guo <shawnguo@kernel.org>
Date: Wed, 21 Nov 2018 13:56:24 -0500
In-Reply-To: <20181115221634.22715-7-greenfoo@gluegarage.com>
References: <20181115221634.22715-1-greenfoo@gluegarage.com>
         <20181115221634.22715-7-greenfoo@gluegarage.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Thu, 2018-11-15 at 23:16 +0100, Fernando Ramos wrote:
> There are no more places where this (deprecated) function is being
> used from, thus it can now be removed.
> 
> Signed-off-by: Fernando Ramos <greenfoo@gluegarage.com>
> ---
>  include/drm/drm_connector.h | 24 ------------------------
>  1 file changed, 24 deletions(-)
> 
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 9ccad6b062f2..b91b206f1665 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -1191,30 +1191,6 @@ static inline void drm_connector_put(struct
> drm_connector *connector)
>  	drm_mode_object_put(&connector->base);
>  }
>  
> -/**
> - * drm_connector_reference - acquire a connector reference
> - * @connector: DRM connector
> - *
> - * This is a compatibility alias for drm_connector_get() and should not be
> - * used by new code.
> - */
> -static inline void drm_connector_reference(struct drm_connector *connector)
> -{
> -	drm_connector_get(connector);
> -}
> -
> -/**
> - * drm_connector_unreference - release a connector reference
> - * @connector: DRM connector
> - *
> - * This is a compatibility alias for drm_connector_put() and should not be
> - * used by new code.
> - */
> -static inline void drm_connector_unreference(struct drm_connector
> *connector)
> -{
> -	drm_connector_put(connector);
> -}
> -
>  /**
>   * drm_connector_is_unregistered - has the connector been unregistered from
>   * userspace?
-- 
Cheers,
	Lyude Paul
