Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168]:38679 "EHLO
	mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754400AbcFPPQa (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 16 Jun 2016 11:16:30 -0400
Date: Thu, 16 Jun 2016 16:16:24 +0100
From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
CC: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Peter Ujfalusi <peter.ujfalusi@ti.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	<patches@opensource.wolfsonmicro.com>,
	<linux-renesas-soc@vger.kernel.org>, <alsa-devel@alsa-project.org>
Subject: Re: [PATCH 3/3] ASoC: wm8940: Enable cache usage to fix crashes on
 resume
Message-ID: <20160616151624.GC1552@localhost.localdomain>
References: <1466080472-9817-1-git-send-email-geert+renesas@glider.be>
 <1466080472-9817-4-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1466080472-9817-4-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Jun 16, 2016 at 02:34:32PM +0200, Geert Uytterhoeven wrote:
> The wm8940 driver is using a regmap cache sync to restore the
> configuration of the chip when switching from OFF to STANDBY, but does
> not actually define a register cache which means that the restore is
> never going to work and we trigger asserts in regmap.  Fix this by
> enabling caching.
> 
> Based on commit d3030d11961a8c10 ("ASoC: ak4642: Enable cache usage to
> fix crashes on resume") by Mark Brown <broonie@kernel.org>.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>

Thanks,
Charles
