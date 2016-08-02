Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:34485 "EHLO
	mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S966604AbcHBNak (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 2 Aug 2016 09:30:40 -0400
Received: by mail-wm0-f65.google.com with SMTP id q128so30850467wma.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 02 Aug 2016 06:30:14 -0700 (PDT)
Date: Tue, 2 Aug 2016 15:14:57 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>,
	Jose Abreu <Jose.Abreu@synopsys.com>,
	David Airlie <airlied@linux.ie>,
	Russell King <rmk+kernel@arm.linux.org.uk>,
	Fabio Estevam <fabio.estevam@freescale.com>,
	Daniel Vetter <daniel.vetter@ffwll.ch>,
	Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
	Thierry Reding <treding@nvidia.com>,
	Linux-ALSA <alsa-devel@alsa-project.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Simon <horms@verge.net.au>, linux-renesas-soc@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] drm: bridge: add DesignWare HDMI I2S audio support
Message-ID: <20160802131457.GI6232@phenom.ffwll.local>
References: <874m8jxqcy.wl%kuninori.morimoto.gx@renesas.com>
 <8737o3xqab.wl%kuninori.morimoto.gx@renesas.com>
 <579A2D4E.9000207@synopsys.com>
 <87mvkx9jqj.wl%kuninori.morimoto.gx@renesas.com>
 <20160801174516.GY10376@sirena.org.uk>
 <878twghul8.wl%kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <878twghul8.wl%kuninori.morimoto.gx@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Aug 02, 2016 at 12:47:46AM +0000, Kuninori Morimoto wrote:
> 
> Hi Mark
> 
> > > Mark, Thierry, Daniel
> > > I wonder who can be maintainer for this patch ??
> > 
> > It's a DRM patch so I'd expect someone in the DRM subsystem.
> 
> OK, I see.
> But, I will keep Cc to you for this patch-set.

Archit Tajena is the maintainer of last resort for anything related to
drm_bridge.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
