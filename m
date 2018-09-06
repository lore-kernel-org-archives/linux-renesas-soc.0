Return-Path: <devicetree-owner@vger.kernel.org>
From: Yoshihiro Kaneko <ykaneko0929@gmail.com>
To: Mark Brown <broonie@kernel.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2] ASoC: rsnd: Add device tree binding for r8a77990
Date: Thu,  6 Sep 2018 22:28:33 +0900
Message-Id: <1536240513-22172-1-git-send-email-ykaneko0929@gmail.com>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>

This patch adds the device tree binding of the r8a77990 SoC.

Signed-off-by: Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>
Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
---

This patch is based on the devel branch of Simon Horman's renesas tree.

v2 [Yoshihiro Kaneko]
- Rebased

 Documentation/devicetree/bindings/sound/renesas,rsnd.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/renesas,rsnd.txt b/Documentation/devicetree/bindings/sound/renesas,rsnd.txt
index 9e764270..58971a6 100644
--- a/Documentation/devicetree/bindings/sound/renesas,rsnd.txt
+++ b/Documentation/devicetree/bindings/sound/renesas,rsnd.txt
@@ -353,6 +353,7 @@ Required properties:
 				    - "renesas,rcar_sound-r8a7795" (R-Car H3)
 				    - "renesas,rcar_sound-r8a7796" (R-Car M3-W)
 				    - "renesas,rcar_sound-r8a77965" (R-Car M3-N)
+				    - "renesas,rcar_sound-r8a77990" (R-Car E3)
 - reg				: Should contain the register physical address.
 				  required register is
 				   SRU/ADG/SSI      if generation1
-- 
1.9.1
