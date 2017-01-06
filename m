Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from www.zeus03.de ([194.117.254.33]:49898 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S936792AbdAFJYD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Jan 2017 04:24:03 -0500
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: busybox@busybox.net
Cc: linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFC busybox] watchdog: add pretimeout parameter
Date: Fri,  6 Jan 2017 10:23:53 +0100
Message-Id: <20170106092353.1998-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Linux Watchdog API defined pretimeout for some time now, but recently
support for it significantly increased, e.g. by implementing the
pretimeout framework and adding that feature to the softdog. So, add
support for pretimeout in the watchdog applet.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

This is an RFC because I am not sure if this needs to be guarded with #ifdef
WDIOC_SETPRETIMEOUT so it will be only compiled when available? Nonetheless,
this code works nicely with busybox 1.24.2. I assume the final patch should
be based on 1.26.x?

 miscutils/watchdog.c |   12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/watchdog.c b/watchdog.c
index d3a76ed..fae3f98 100644
--- a/miscutils/watchdog.c
+++ b/miscutils/watchdog.c
@@ -10,11 +10,12 @@
  */
 
 //usage:#define watchdog_trivial_usage
-//usage:       "[-t N[ms]] [-T N[ms]] [-F] DEV"
+//usage:       "[-t N[ms]] [-T N[ms]] [-P N[ms]] [-F] DEV"
 //usage:#define watchdog_full_usage "\n\n"
 //usage:       "Periodically write to watchdog device DEV\n"
 //usage:     "\n	-T N	Reboot after N seconds if not reset (default 60)"
 //usage:     "\n	-t N	Reset every N seconds (default 30)"
+//usage:     "\n	-P N	Warn N seconds before reboot (default 0)"
 //usage:     "\n	-F	Run in foreground"
 //usage:     "\n"
 //usage:     "\nUse 500ms to specify period in milliseconds"
@@ -26,6 +27,7 @@
 #define OPT_FOREGROUND  (1 << 0)
 #define OPT_STIMER      (1 << 1)
 #define OPT_HTIMER      (1 << 2)
+#define OPT_PTIMER      (1 << 3)
 
 static void watchdog_shutdown(int sig UNUSED_PARAM)
 {
@@ -50,11 +52,13 @@ int watchdog_main(int argc, char **argv)
 	unsigned opts;
 	unsigned stimer_duration; /* how often to restart */
 	unsigned htimer_duration = 60000; /* reboots after N ms if not restarted */
+	unsigned ptimer_duration; /* pre-timeout notification N ms before reboot */
 	char *st_arg;
 	char *ht_arg;
+	char *pt_arg;
 
 	opt_complementary = "=1"; /* must have exactly 1 argument */
-	opts = getopt32(argv, "Ft:T:", &st_arg, &ht_arg);
+	opts = getopt32(argv, "Ft:T:P:", &st_arg, &ht_arg, &pt_arg);
 
 	/* We need to daemonize *before* opening the watchdog as many drivers
 	 * will only allow one process at a time to do so.  Since daemonizing
@@ -88,6 +92,10 @@ int watchdog_main(int argc, char **argv)
 	}
 # endif
 	ioctl_or_warn(3, WDIOC_SETTIMEOUT, &htimer_duration);
+	if (opts & OPT_PTIMER) {
+		ptimer_duration = xatou_sfx(pt_arg, suffixes) / 1000;
+		ioctl_or_warn(3, WDIOC_SETPRETIMEOUT, &ptimer_duration);
+	}
 #endif
 
 #if 0
-- 
2.10.2
