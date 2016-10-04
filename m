Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Yangbo Lu <yangbo.lu@nxp.com>
Cc: Lee Jones <lee.jones@linaro.org>,
        Dirk Behme <dirk.behme@de.bosch.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/4] base: soc: Early register bus when needed
Date: Tue,  4 Oct 2016 11:09:24 +0200
Message-Id: <1475572167-29581-2-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1475572167-29581-1-git-send-email-geert+renesas@glider.be>
References: <1475572167-29581-1-git-send-email-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

If soc_device_register() is called before soc_bus_register(), it crashes
with a NULL pointer dereference.

soc_bus_register() is already a core_initcall(), but drivers/base/ is
entered later than e.g. drivers/pinctrl/ and drivers/soc/. Hence there
are several subsystems that may need to know SoC revision information,
while it's not so easy to initialize the SoC bus even earlier using an
initcall.

To fix this, let soc_device_register() register the bus early if that
hasn't happened yet.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/base/soc.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/base/soc.c b/drivers/base/soc.c
index 75b98aad6fafd171..f612715d24754d27 100644
--- a/drivers/base/soc.c
+++ b/drivers/base/soc.c
@@ -114,6 +114,12 @@ struct soc_device *soc_device_register(struct soc_device_attribute *soc_dev_attr
 	struct soc_device *soc_dev;
 	int ret;
 
+	if (!soc_bus_type.p) {
+		ret = bus_register(&soc_bus_type);
+		if (ret)
+			goto out1;
+	}
+
 	soc_dev = kzalloc(sizeof(*soc_dev), GFP_KERNEL);
 	if (!soc_dev) {
 		ret = -ENOMEM;
@@ -157,6 +163,9 @@ void soc_device_unregister(struct soc_device *soc_dev)
 
 static int __init soc_bus_register(void)
 {
+	if (soc_bus_type.p)
+		return 0;
+
 	return bus_register(&soc_bus_type);
 }
 core_initcall(soc_bus_register);
-- 
1.9.1
