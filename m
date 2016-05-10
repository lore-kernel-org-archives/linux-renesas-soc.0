Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:57086 "EHLO pokefinder.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751726AbcEJNyu (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 10 May 2016 09:54:50 -0400
From: Wolfram Sang <wsa@the-dreams.de>
To: driverdev-devel@linuxdriverproject.org
Cc: Wolfram Sang <wsa@the-dreams.de>, linux-renesas-soc@vger.kernel.org
Subject: [PATCH 13/27] staging: ks7010: add example cfg file as a reference
Date: Tue, 10 May 2016 15:52:26 +0200
Message-Id: <1462888360-21649-14-git-send-email-wsa@the-dreams.de>
In-Reply-To: <1462888360-21649-1-git-send-email-wsa@the-dreams.de>
References: <1462888360-21649-1-git-send-email-wsa@the-dreams.de>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Wolfram Sang <wsa+renesas@sang-engineering.com>

We want to remove it, but to do so properly, it is good to have a
working example. Needs to be copied to /lib/firmware in order to be
used.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/staging/ks7010/ks79xx.cfg | 116 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 116 insertions(+)
 create mode 100644 drivers/staging/ks7010/ks79xx.cfg

diff --git a/drivers/staging/ks7010/ks79xx.cfg b/drivers/staging/ks7010/ks79xx.cfg
new file mode 100644
index 00000000000000..0f2d24d4e66a89
--- /dev/null
+++ b/drivers/staging/ks7010/ks79xx.cfg
@@ -0,0 +1,116 @@
+#ks79xx.cfg
+#KS79xx configuration file
+#
+
+#
+#BeaconLostCount	default 20
+BeaconLostCount=20
+#
+
+#
+#Ap List Scan Type default ACTIVE_SCAN ACTIVE_SCAN or PASSIVE_SCAN
+ScanType=ACTIVE_SCAN
+#
+
+#
+#Channel		default 10		min 1 	max 14
+Channel=10
+#
+
+#
+#FragmentThreshold	default 2346		min 256	max 2346
+FragmentThreshold=2346
+#
+
+#
+#OperationMode		default Infrastructure	Pseudo-Ad-Hoc or 802.11-Ad-Hoc or Infrastructure
+OperationMode=Infrastructure
+#
+
+#
+#PowerManagementMode	default ACTIVE     ACTIVE or SAVE1 or SAVE2
+PowerManagementMode=ACTIVE
+#
+
+#
+#RTSThreshold		default 2347		min 0	max 2347
+RTSThreshold=2347
+#
+
+#
+#SSID			default ""		max 32 character
+SSID="default"
+#
+
+#
+#TxRate			default Auto		1, 2, 5.5, 11	ex. TxRate=1,2 TxRate=11 TxRate=Auto ...
+TxRate=Auto
+#
+
+#
+#Wep			default OFF		OFF or 64bit or 128bit
+Wep=OFF
+#
+
+#
+#WepType		default STRING		STRING or HEX
+WepType=STRING
+#
+
+#
+#WepIndex=1
+#
+
+#
+#WepKeyValue1
+#	character_wep_key:64bit key_length = 5;  128bit key_length = 13
+#	      hex_wep_key:64bit key_length = 10; 128bit key_length = 26
+#
+
+#
+#WepKeyValue2
+#	character_wep_key:64bit key_length = 5;  128bit key_length = 13
+#	      hex_wep_key:64bit key_length = 10; 128bit key_length = 26
+#
+
+#
+#WepKeyValue3
+#	character_wep_key:64bit key_length = 5;  128bit key_length = 13
+#	      hex_wep_key:64bit key_length = 10; 128bit key_length = 26
+#
+
+#
+#WepKeyValue4
+#	character_wep_key:64bit key_length = 5;  128bit key_length = 13
+#	      hex_wep_key:64bit key_length = 10; 128bit key_length = 26
+#
+
+#
+#AuthenticationAlgorithm default OPEN_SYSTEM	OPEN_SYSTEM or  SHARED_KEY
+AuthenticationAlgorithm=OPEN_SYSTEM
+#
+
+#
+#PREAMBLE_TYPE default LONG	LONG or  SHORT
+PREAMBLE_TYPE=SHORT
+#
+
+#
+# PhyType default BG_MODE	B_MODE, G_MODE or BG_MODE
+PhyType=BG_MODE
+#
+
+#
+# CtsMode defalut FALSE		TURE or FALSE
+CtsMode=FALSE
+#
+
+#
+# PhyInformationTimer defalut 0  uint 100msec 
+PhyInformationTimer=0
+#
+
+#
+#ROM_FILE default "ks7010sd.rom"
+ROM_FILE="ks7010sd.rom"
+#
-- 
2.8.1
