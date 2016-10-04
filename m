Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:48760 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752220AbcJDMbr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Oct 2016 08:31:47 -0400
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org, David Airlie <airlied@linux.ie>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH 1/6] video: of: Constify node argument to display timing functions
Date: Tue,  4 Oct 2016 15:31:34 +0300
Message-Id: <1475584299-21236-2-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <1475584299-21236-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
References: <1475584299-21236-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The node pointer passed to the display timing functions is never
modified, make it const.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/video/of_display_timing.c |  6 +++---
 include/video/of_display_timing.h | 15 ++++++++-------
 2 files changed, 11 insertions(+), 10 deletions(-)

Cc: David Airlie <airlied@linux.ie>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>

diff --git a/drivers/video/of_display_timing.c b/drivers/video/of_display_timing.c
index 8a1076beecd3..26c88f7839d2 100644
--- a/drivers/video/of_display_timing.c
+++ b/drivers/video/of_display_timing.c
@@ -110,7 +110,7 @@ static int of_parse_display_timing(const struct device_node *np,
  * @name: name of the timing node
  * @dt: display_timing struct to fill
  **/
-int of_get_display_timing(struct device_node *np, const char *name,
+int of_get_display_timing(const struct device_node *np, const char *name,
 		struct display_timing *dt)
 {
 	struct device_node *timing_np;
@@ -133,7 +133,7 @@ EXPORT_SYMBOL_GPL(of_get_display_timing);
  * of_get_display_timings - parse all display_timing entries from a device_node
  * @np: device_node with the subnodes
  **/
-struct display_timings *of_get_display_timings(struct device_node *np)
+struct display_timings *of_get_display_timings(const struct device_node *np)
 {
 	struct device_node *timings_np;
 	struct device_node *entry;
@@ -249,7 +249,7 @@ EXPORT_SYMBOL_GPL(of_get_display_timings);
  * of_display_timings_exist - check if a display-timings node is provided
  * @np: device_node with the timing
  **/
-int of_display_timings_exist(struct device_node *np)
+int of_display_timings_exist(const struct device_node *np)
 {
 	struct device_node *timings_np;
 
diff --git a/include/video/of_display_timing.h b/include/video/of_display_timing.h
index ea755b5616d8..956455fc9f9a 100644
--- a/include/video/of_display_timing.h
+++ b/include/video/of_display_timing.h
@@ -16,21 +16,22 @@ struct display_timings;
 #define OF_USE_NATIVE_MODE -1
 
 #ifdef CONFIG_OF
-int of_get_display_timing(struct device_node *np, const char *name,
+int of_get_display_timing(const struct device_node *np, const char *name,
 		struct display_timing *dt);
-struct display_timings *of_get_display_timings(struct device_node *np);
-int of_display_timings_exist(struct device_node *np);
+struct display_timings *of_get_display_timings(const struct device_node *np);
+int of_display_timings_exist(const struct device_node *np);
 #else
-static inline int of_get_display_timing(struct device_node *np, const char *name,
-		struct display_timing *dt)
+static inline int of_get_display_timing(const struct device_node *np,
+		const char *name, struct display_timing *dt)
 {
 	return -ENOSYS;
 }
-static inline struct display_timings *of_get_display_timings(struct device_node *np)
+static inline struct display_timings *
+of_get_display_timings(const struct device_node *np)
 {
 	return NULL;
 }
-static inline int of_display_timings_exist(struct device_node *np)
+static inline int of_display_timings_exist(const struct device_node *np)
 {
 	return -ENOSYS;
 }
-- 
Regards,

Laurent Pinchart
