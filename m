Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:41995 "EHLO pokefinder.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751505AbcEaK5y (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 31 May 2016 06:57:54 -0400
From: Wolfram Sang <wsa@the-dreams.de>
To: driverdev-devel@linuxdriverproject.org
Cc: Wolfram Sang <wsa@the-dreams.de>, linux-renesas-soc@vger.kernel.org
Subject: [PATCH V2 23/31] staging: ks7010: indent michael_mic.c
Date: Tue, 31 May 2016 12:56:35 +0200
Message-Id: <1464692203-4180-24-git-send-email-wsa@the-dreams.de>
In-Reply-To: <1464692203-4180-1-git-send-email-wsa@the-dreams.de>
References: <1464692203-4180-1-git-send-email-wsa@the-dreams.de>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Wolfram Sang <wsa+renesas@sang-engineering.com>

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/staging/ks7010/michael_mic.c | 43 ++++++++++++++++++------------------
 1 file changed, 21 insertions(+), 22 deletions(-)

diff --git a/drivers/staging/ks7010/michael_mic.c b/drivers/staging/ks7010/michael_mic.c
index ec8769a974427a..adb17df46f939b 100644
--- a/drivers/staging/ks7010/michael_mic.c
+++ b/drivers/staging/ks7010/michael_mic.c
@@ -34,11 +34,11 @@
 				A->nBytesInM = 0;
 
 static
-void MichaelInitializeFunction( struct michel_mic_t *Mic, uint8_t *key )
+void MichaelInitializeFunction(struct michel_mic_t *Mic, uint8_t * key)
 {
 	// Set the key
-	Mic->K0 = getUInt32( key , 0 );
-	Mic->K1 = getUInt32( key , 4 );
+	Mic->K0 = getUInt32(key, 0);
+	Mic->K1 = getUInt32(key, 4);
 
 	//clear();
 	MichaelClear(Mic);
@@ -56,11 +56,10 @@ do{								\
 	L += R;							\
 }while(0)
 
-
 static
-void MichaelAppend( struct michel_mic_t *Mic, uint8_t *src, int nBytes )
+void MichaelAppend(struct michel_mic_t *Mic, uint8_t * src, int nBytes)
 {
-	int addlen ;
+	int addlen;
 	if (Mic->nBytesInM) {
 		addlen = 4 - Mic->nBytesInM;
 		if (addlen > nBytes)
@@ -73,13 +72,13 @@ void MichaelAppend( struct michel_mic_t *Mic, uint8_t *src, int nBytes )
 		if (Mic->nBytesInM < 4)
 			return;
 
-		Mic->L ^= getUInt32(Mic->M,0);
+		Mic->L ^= getUInt32(Mic->M, 0);
 		MichaelBlockFunction(Mic->L, Mic->R);
 		Mic->nBytesInM = 0;
 	}
 
-	while(nBytes >= 4){
-		Mic->L ^= getUInt32(src,0);
+	while (nBytes >= 4) {
+		Mic->L ^= getUInt32(src, 0);
 		MichaelBlockFunction(Mic->L, Mic->R);
 		src += 4;
 		nBytes -= 4;
@@ -92,7 +91,7 @@ void MichaelAppend( struct michel_mic_t *Mic, uint8_t *src, int nBytes )
 }
 
 static
-void MichaelGetMIC( struct michel_mic_t *Mic, uint8_t *dst )
+void MichaelGetMIC(struct michel_mic_t *Mic, uint8_t * dst)
 {
 	uint8_t *data = Mic->M;
 	switch (Mic->nBytesInM) {
@@ -107,24 +106,24 @@ void MichaelGetMIC( struct michel_mic_t *Mic, uint8_t *dst )
 		break;
 	case 3:
 		Mic->L ^= data[0] | (data[1] << 8) | (data[2] << 16) |
-			0x5a000000;
+		    0x5a000000;
 		break;
 	}
 	MichaelBlockFunction(Mic->L, Mic->R);
 	MichaelBlockFunction(Mic->L, Mic->R);
 	// The appendByte function has already computed the result.
-	putUInt32( dst, 0, Mic->L );
-	putUInt32( dst, 4, Mic->R );
+	putUInt32(dst, 0, Mic->L);
+	putUInt32(dst, 4, Mic->R);
 
 	// Reset to the empty message.
 	MichaelClear(Mic);
 }
 
-void MichaelMICFunction( struct michel_mic_t *Mic, uint8_t *Key,
-			 uint8_t *Data, int Len, uint8_t priority,
-			 uint8_t *Result )
+void MichaelMICFunction(struct michel_mic_t *Mic, uint8_t * Key,
+			uint8_t * Data, int Len, uint8_t priority,
+			uint8_t * Result)
 {
-	uint8_t pad_data[4] = {priority,0,0,0};
+	uint8_t pad_data[4] = { priority, 0, 0, 0 };
 	// Compute the MIC value
 	/*
 	 * IEEE802.11i  page 47
@@ -135,9 +134,9 @@ void MichaelMICFunction( struct michel_mic_t *Mic, uint8_t *Key,
 	 * |DA|SA|Priority|0 |Data|M0|M1|M2|M3|M4|M5|M6|M7|
 	 * +--+--+--------+--+----+--+--+--+--+--+--+--+--+
 	 */
-	MichaelInitializeFunction( Mic, Key ) ;
-	MichaelAppend( Mic, (uint8_t*)Data, 12 ); /* |DA|SA| */
-	MichaelAppend( Mic, pad_data, 4 ); /* |Priority|0|0|0| */
-	MichaelAppend( Mic, (uint8_t*)(Data+12), Len -12 ); /* |Data| */
-	MichaelGetMIC( Mic, Result ) ;
+	MichaelInitializeFunction(Mic, Key);
+	MichaelAppend(Mic, (uint8_t *) Data, 12);	/* |DA|SA| */
+	MichaelAppend(Mic, pad_data, 4);	/* |Priority|0|0|0| */
+	MichaelAppend(Mic, (uint8_t *) (Data + 12), Len - 12);	/* |Data| */
+	MichaelGetMIC(Mic, Result);
 }
-- 
2.8.1
