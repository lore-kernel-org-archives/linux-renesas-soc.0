Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:40076 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751108AbdFUMDk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Jun 2017 08:03:40 -0400
Date: Wed, 21 Jun 2017 14:03:09 +0200
From: Simon Horman <horms@verge.net.au>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Magnus <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 0/2] arm64: defconfig: ak4613/renesas sound will be
 kernle module
Message-ID: <20170621120309.GD17965@verge.net.au>
References: <87injs25la.wl%kuninori.morimoto.gx@renesas.com>
 <20170620132038.GG14340@verge.net.au>
 <87bmpi8atz.wl%kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87bmpi8atz.wl%kuninori.morimoto.gx@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Jun 21, 2017 at 12:10:31AM +0000, Kuninori Morimoto wrote:
> 
> Hi Simon
> 
> > > These exchange Renesas sound related driver as module.
> > > But, it doesn't exchange simple-sound-card which is
> > > used from other platform.
> > > 
> > > Kuninori Morimoto (2):
> > >   arm64: defconfig: compile ak4613 as kernel module
> > >   arm64: defconfig: compile renesas sound as kernel module
> > 
> > Thanks Morimoto-san,
> > 
> > do you mind if I squash these into one patch?
> 
> Thanks.
> I have no objection about it

Thanks, I have queued up the following:

>From e21f341ad74f986a69913bc2632e474d13d2161b Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Mon, 19 Jun 2017 00:23:59 +0000
Subject: [PATCH] arm64: defconfig: compile ak4613 and renesas sound as modules

Compile the renesas sound and ak4613 drivers to reduce the ARM64 kernel
size. These modules are currently only used by Renesas platforms so
there should little risk of negative impact of this change on other users.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
[simon: consilidated two patches into one]
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/configs/defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 1bbac74a0c44..dedab907b8fb 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -366,9 +366,9 @@ CONFIG_SOUND=y
 CONFIG_SND=y
 CONFIG_SND_SOC=y
 CONFIG_SND_BCM2835_SOC_I2S=m
-CONFIG_SND_SOC_RCAR=y
+CONFIG_SND_SOC_RCAR=m
 CONFIG_SND_SOC_SAMSUNG=y
-CONFIG_SND_SOC_AK4613=y
+CONFIG_SND_SOC_AK4613=m
 CONFIG_SND_SIMPLE_CARD=y
 CONFIG_USB=y
 CONFIG_USB_OTG=y
-- 
2.1.4
