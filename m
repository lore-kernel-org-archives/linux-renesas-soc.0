Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:57098 "EHLO pokefinder.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751941AbcEJNzH (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 10 May 2016 09:55:07 -0400
From: Wolfram Sang <wsa@the-dreams.de>
To: driverdev-devel@linuxdriverproject.org
Cc: Wolfram Sang <wsa@the-dreams.de>, linux-renesas-soc@vger.kernel.org
Subject: [PATCH 24/27] staging: ks7010: indent michael_mic.h
Date: Tue, 10 May 2016 15:52:37 +0200
Message-Id: <1462888360-21649-25-git-send-email-wsa@the-dreams.de>
In-Reply-To: <1462888360-21649-1-git-send-email-wsa@the-dreams.de>
References: <1462888360-21649-1-git-send-email-wsa@the-dreams.de>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Wolfram Sang <wsa+renesas@sang-engineering.com>

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/staging/ks7010/michael_mic.h | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/ks7010/michael_mic.h b/drivers/staging/ks7010/michael_mic.h
index f14f160ad46549..57ecbe34153202 100644
--- a/drivers/staging/ks7010/michael_mic.h
+++ b/drivers/staging/ks7010/michael_mic.h
@@ -16,14 +16,14 @@
 struct michel_mic_t {
 	uint32_t K0;	// Key 
 	uint32_t K1;	// Key 
-	uint32_t L;		// Current state 
-	uint32_t R;		// Current state 
-	uint8_t M[4];		// Message accumulator (single word) 
-	int		nBytesInM; 	// # bytes in M 
-	uint8_t 	Result[8];
+	uint32_t L;	// Current state 
+	uint32_t R;	// Current state 
+	uint8_t M[4];	// Message accumulator (single word) 
+	int nBytesInM;	// # bytes in M 
+	uint8_t Result[8];
 };
 
 extern
-void MichaelMICFunction( struct michel_mic_t *Mic, uint8_t *Key, 
-			 uint8_t *Data, int Len, uint8_t priority, 
-			 uint8_t *Result );
+void MichaelMICFunction(struct michel_mic_t *Mic, uint8_t * Key,
+			uint8_t * Data, int Len, uint8_t priority,
+			uint8_t * Result);
-- 
2.8.1
