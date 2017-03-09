Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from xavier.telenet-ops.be ([195.130.132.52]:42852 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932920AbdCISSk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Mar 2017 13:18:40 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/2] [RFC] base: soc: Let soc_device_match() return no match when called too early
Date: Thu,  9 Mar 2017 19:18:32 +0100
Message-Id: <1489083513-19245-2-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1489083513-19245-1-git-send-email-geert+renesas@glider.be>
References: <1489083513-19245-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

If soc_device_match() is called before the SoC bus has been registered,
bus_for_each_dev() returns -EINVAL, which is considered a match, as it
is non-zero.

While calling soc_device_match() can be considered an integration
mistake, returning a match is counter-intuitive: soc_device_match() is
typically used to handle quirks, i.e. to deviate from the default path.
Hence add a check to abort checking and return no match instead.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Should this use WARN_ONCE()?
---
 drivers/base/soc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/base/soc.c b/drivers/base/soc.c
index dc26e5949a320223..50033081834a9ccd 100644
--- a/drivers/base/soc.c
+++ b/drivers/base/soc.c
@@ -230,6 +230,8 @@ const struct soc_device_attribute *soc_device_match(
 			break;
 		ret = bus_for_each_dev(&soc_bus_type, NULL, (void *)matches,
 				       soc_device_match_one);
+		if (ret < 0)
+			return NULL;
 		if (!ret)
 			matches++;
 		else
-- 
2.7.4
