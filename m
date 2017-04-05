Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:52392 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752510AbdDERa3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Apr 2017 13:30:29 -0400
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, Mark Brown <broonie@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux-ALSA <alsa-devel@alsa-project.org>,
        Lars-Peter <lars@metafoo.de>, Simon <horms@verge.net.au>,
        alsa-devel@alsa-project.org
In-Reply-To: <877f32ngz0.wl%kuninori.morimoto.gx@renesas.com>
Message-Id: <E1cvolA-0000af-Vr@debutante>
Date: Wed, 05 Apr 2017 18:30:20 +0100
Subject: Applied "ASoC: soc-core: verify Sound Card normality" to the asoc tree
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The patch

   ASoC: soc-core: verify Sound Card normality

has been applied to the asoc tree at

   git://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

>From c12c1aad98bb75b435e79c6208b56d2018b42f8b Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Mon, 3 Apr 2017 06:31:22 +0000
Subject: [PATCH] ASoC: soc-core: verify Sound Card normality

Current ALSA SoC Sound Card basically consists of CPU/Codec/Platform
components. If system uses Kernel modules, we can disable these drivers
by using rmmod command. In such case, we can't disable
CPU/Codec/Platform driver without disabling Sound Card driver.

But on the other hand, we can disable these drivers by using unbind
command. In such case, we can disable these drivers randomly.
In this case, we can create dirty Sound Card which is missing necessary
components.

(1) If user disabled Sound Card first, but did nothing to other drivers,
user can't use Sound because Sound Card is no longer exists.
(2) If user disabled CPU/Codec/Platform driver randomly, but did nothing
to Sound Card, user still be able to use Sound Card, because dirty Sound
Card still exists. In this case, Sound system will be crashed if user
started sound playback/capture. But we can't block such random unbind
now.

To avoid Sound Card crash in (2) case, we need to unregister Sound Card
whenever CPU/Codec/Platform component were unregistered.
This patch solves this issue.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-core.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index f1901bb1466e..de6d5609c252 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -3076,6 +3076,11 @@ static void snd_soc_component_cleanup(struct snd_soc_component *component)
 
 static void snd_soc_component_del_unlocked(struct snd_soc_component *component)
 {
+	struct snd_soc_card *card = component->card;
+
+	if (card)
+		snd_soc_unregister_card(card);
+
 	list_del(&component->list);
 }
 
-- 
2.11.0
