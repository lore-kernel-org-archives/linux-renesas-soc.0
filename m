Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp-proxy004.phy.lolipop.jp ([157.7.104.45]:37270 "EHLO
	smtp-proxy004.phy.lolipop.jp" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752372AbcG2Ahn (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 28 Jul 2016 20:37:43 -0400
Subject: Re: Question about struct snd_soc_dai() :: cpu_dai->codec
To: Lars-Peter Clausen <lars@metafoo.de>,
	Vinod Koul <vinod.koul@intel.com>, Takashi Iwai <tiwai@suse.de>
References: <878twpj739.wl%kuninori.morimoto.gx@renesas.com>
 <20160727032111.GY9681@localhost> <s5hh9bb7he6.wl-tiwai@suse.de>
 <20160727172125.GF9681@localhost> <20160727180456.GQ11806@sirena.org.uk>
 <s5h1t2f6jdm.wl-tiwai@suse.de> <20160727182233.GV11806@sirena.org.uk>
 <s5hpopy6dbi.wl-tiwai@suse.de> <20160728034643.GH9681@localhost>
 <579A6C1B.2060904@metafoo.de>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-renesas-soc@vger.kernel.org, Simon <horms@verge.net.au>
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Message-ID: <579AA39B.5030100@sakamocchi.jp>
Date: Fri, 29 Jul 2016 09:30:19 +0900
MIME-Version: 1.0
In-Reply-To: <579A6C1B.2060904@metafoo.de>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Lars,

On Jul 29 2016 05:33, Lars-Peter Clausen wrote:
> Hotplug is something that always pops up sooner or later. E.g. if someone
> puts a ASoC supported CODEC on a hot-pluggable device (maybe USB) we
> don't want to duplicate the code, but be able to reuse.

(A bit to sidetrack)

To me, it's unclear for devices on USB. When ALSA SoC part supports 
these devices, what is the scenario you assumed? In short, assuming we 
put codes to ALSA SoC part, what is the shape of the corresponding 
devices and links of pairs of endpoints? Additionally, in this case, 
what codes are able to be reused?


Regards

Takashi Sakamoto
