Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
To: mattw@codeaurora.org, mitchelh@codeaurora.org, broonie@kernel.org,
        linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, chris.paterson2@renesas.com,
        Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
Subject: [PATCH 2/2] regmap: Avoid namespace collision within macro
Date: Thu, 27 Oct 2016 10:33:19 +0100
Message-Id: <1477560799-58896-3-git-send-email-ramesh.shanmugasundaram@bp.renesas.com>
In-Reply-To: <1477560799-58896-1-git-send-email-ramesh.shanmugasundaram@bp.renesas.com>
References: <1477560799-58896-1-git-send-email-ramesh.shanmugasundaram@bp.renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Renamed variable "timeout" to "__timeout" to avoid namespace collision.

Signed-off-by: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
---
 include/linux/regmap.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/regmap.h b/include/linux/regmap.h
index 9adc7b2..32f339a 100644
--- a/include/linux/regmap.h
+++ b/include/linux/regmap.h
@@ -115,7 +115,7 @@ struct reg_sequence {
  */
 #define regmap_read_poll_timeout(map, addr, val, cond, sleep_us, timeout_us) \
 ({ \
-	ktime_t timeout = ktime_add_us(ktime_get(), timeout_us); \
+	ktime_t __timeout = ktime_add_us(ktime_get(), timeout_us); \
 	int ret; \
 	might_sleep_if(sleep_us); \
 	for (;;) { \
@@ -124,7 +124,7 @@ struct reg_sequence {
 			break; \
 		if (cond) \
 			break; \
-		if (timeout_us && ktime_compare(ktime_get(), timeout) > 0) { \
+		if (timeout_us && ktime_compare(ktime_get(), __timeout) > 0) { \
 			ret = regmap_read((map), (addr), &(val)); \
 			break; \
 		} \
-- 
1.9.1
