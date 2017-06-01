Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from albert.telenet-ops.be ([195.130.137.90]:53948 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751398AbdFAKgS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Jun 2017 06:36:18 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ASoC: rsnd: Document optional reset properties
Date: Thu,  1 Jun 2017 12:36:15 +0200
Message-Id: <1496313375-27892-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Document the optional properties for describing module resets, to
support resetting these modules on R-Car Gen2 and Gen3.

Note that the audio module has resets for the Serial Sound Interfaces
only.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/sound/renesas,rsnd.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/renesas,rsnd.txt b/Documentation/devicetree/bindings/sound/renesas,rsnd.txt
index 13cb21d53b8bdf5c..7246bb268bf9bab6 100644
--- a/Documentation/devicetree/bindings/sound/renesas,rsnd.txt
+++ b/Documentation/devicetree/bindings/sound/renesas,rsnd.txt
@@ -379,6 +379,9 @@ Optional properties:
 - clock-frequency		: for all audio_clkout0/1/2/3
 - clkout-lr-asynchronous	: boolean property. it indicates that audio_clkoutn
 				  is asynchronizes with lr-clock.
+- resets			: References to SSI resets.
+- reset-names			: List of valid reset names.
+				  "ssi-all", "ssi.X"
 
 SSI subnode properties:
 - interrupts			: Should contain SSI interrupt for PIO transfer
-- 
2.7.4
