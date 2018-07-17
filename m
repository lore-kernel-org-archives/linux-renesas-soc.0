Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pg1-f194.google.com ([209.85.215.194]:47071 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729720AbeGQUW1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Jul 2018 16:22:27 -0400
Received: by mail-pg1-f194.google.com with SMTP id p23-v6so879235pgv.13
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Jul 2018 12:48:20 -0700 (PDT)
From: Yoshihiro Kaneko <ykaneko0929@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH/RFT 2/7] ASoC: rsnd: Document R-Car M3-N support
Date: Wed, 18 Jul 2018 04:47:58 +0900
Message-Id: <1531856883-19645-3-git-send-email-ykaneko0929@gmail.com>
In-Reply-To: <1531856883-19645-1-git-send-email-ykaneko0929@gmail.com>
References: <1531856883-19645-1-git-send-email-ykaneko0929@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>

Document support for the sound modules in the Renesas M3-N (r8a77965)
SoC.

No driver update is needed.

Signed-off-by: Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>
Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
---
 Documentation/devicetree/bindings/sound/renesas,rsnd.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/renesas,rsnd.txt b/Documentation/devicetree/bindings/sound/renesas,rsnd.txt
index b86d790..9e764270 100644
--- a/Documentation/devicetree/bindings/sound/renesas,rsnd.txt
+++ b/Documentation/devicetree/bindings/sound/renesas,rsnd.txt
@@ -352,6 +352,7 @@ Required properties:
 				    - "renesas,rcar_sound-r8a7794" (R-Car E2)
 				    - "renesas,rcar_sound-r8a7795" (R-Car H3)
 				    - "renesas,rcar_sound-r8a7796" (R-Car M3-W)
+				    - "renesas,rcar_sound-r8a77965" (R-Car M3-N)
 - reg				: Should contain the register physical address.
 				  required register is
 				   SRU/ADG/SSI      if generation1
-- 
1.9.1
