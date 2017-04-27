Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: linus.walleij@linaro.org, geert+renesas@glider.be,
        laurent.pinchart@ideasonboard.com, chris.brandt@renesas.com,
        robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 02/10] pinctrl: generic: Add macros to unpack properties
Date: Thu, 27 Apr 2017 10:19:46 +0200
Message-Id: <1493281194-5200-3-git-send-email-jacopo+renesas@jmondi.org>
In-Reply-To: <1493281194-5200-1-git-send-email-jacopo+renesas@jmondi.org>
References: <1493281194-5200-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add PIN_CONF_UNPACK_PARAM and PIN_CONF_UNPACK_ARGS macros useful to
unpack generic properties and their arguments

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 include/linux/pinctrl/pinconf-generic.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/linux/pinctrl/pinconf-generic.h b/include/linux/pinctrl/pinconf-generic.h
index 279e3c5..2cd2a03 100644
--- a/include/linux/pinctrl/pinconf-generic.h
+++ b/include/linux/pinctrl/pinconf-generic.h
@@ -118,7 +118,9 @@ enum pin_config_param {
 /*
  * Helpful configuration macro to be used in tables etc.
  */
-#define PIN_CONF_PACKED(p, a) ((a << 8) | ((unsigned long) p & 0xffUL))
+#define PIN_CONF_PACKED(p, a) (((a) << 8) | ((unsigned long) (p) & 0xffUL))
+#define PIN_CONF_UNPACK_PARAM(c) ((c) & 0xffUL)
+#define PIN_CONF_UNPACK_ARGS(c) ((c) >> 8)
 
 /*
  * The following inlines stuffs a configuration parameter and data value
-- 
2.7.4
