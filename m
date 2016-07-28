Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtprelay4.synopsys.com ([198.182.47.9]:60924 "EHLO
	smtprelay.synopsys.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758984AbcG1QFo (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 28 Jul 2016 12:05:44 -0400
Subject: Re: [PATCH 1/3] drm: bridge: add DesignWare HDMI I2S audio support
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Mark Brown <broonie@kernel.org>,
	David Airlie <airlied@linux.ie>,
	Russell King <rmk+kernel@arm.linux.org.uk>,
	Fabio Estevam <fabio.estevam@freescale.com>,
	Daniel Vetter <daniel.vetter@ffwll.ch>,
	Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
	Thierry Reding <treding@nvidia.com>
References: <874m8jxqcy.wl%kuninori.morimoto.gx@renesas.com>
 <8737o3xqab.wl%kuninori.morimoto.gx@renesas.com>
CC: Linux-ALSA <alsa-devel@alsa-project.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Simon <horms@verge.net.au>, <linux-renesas-soc@vger.kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
From: Jose Abreu <Jose.Abreu@synopsys.com>
Message-ID: <579A2D4E.9000207@synopsys.com>
Date: Thu, 28 Jul 2016 17:05:34 +0100
MIME-Version: 1.0
In-Reply-To: <8737o3xqab.wl%kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi,


On 24-06-2016 03:40, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> Current dw-hdmi is supporting sound via AHB bus, but it has
> I2S audio feature too. This patch adds I2S audio support to dw-hdmi.
> This HDMI I2S is supported by using ALSA SoC common HDMI encoder
> driver.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>

I just tested this patch and everything seems ok. Should I give
my tested-by?

Best regards,
Jose Miguel Abreu
