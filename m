Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:60516 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932414AbeFKOuQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Jun 2018 10:50:16 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Simon Horman <horms@verge.net.au>,
        Kuninori Morimoto <kuninori.morimoto.gx@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 1/3] arm64: dts: renesas: convert to SPDX identifiers
Date: Mon, 11 Jun 2018 23:49:35 +0900
Message-Id: <20180611144937.9554-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20180611144937.9554-1-wsa+renesas@sang-engineering.com>
References: <20180611144937.9554-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm64/boot/dts/renesas/r8a7795-es1-h3ulcb-kf.dts  | 5 +----
 arch/arm64/boot/dts/renesas/r8a7795-es1-h3ulcb.dts     | 5 +----
 arch/arm64/boot/dts/renesas/r8a7795-es1-salvator-x.dts | 5 +----
 arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi           | 5 +----
 arch/arm64/boot/dts/renesas/r8a7795-h3ulcb-kf.dts      | 5 +----
 arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts         | 5 +----
 arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts     | 5 +----
 arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts    | 5 +----
 arch/arm64/boot/dts/renesas/r8a7795.dtsi               | 5 +----
 arch/arm64/boot/dts/renesas/r8a7796-m3ulcb-kf.dts      | 5 +----
 arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts         | 5 +----
 arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts     | 5 +----
 arch/arm64/boot/dts/renesas/r8a7796-salvator-xs.dts    | 5 +----
 arch/arm64/boot/dts/renesas/r8a7796.dtsi               | 5 +----
 arch/arm64/boot/dts/renesas/r8a77970-eagle.dts         | 5 +----
 arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts         | 5 +----
 arch/arm64/boot/dts/renesas/r8a77970.dtsi              | 5 +----
 arch/arm64/boot/dts/renesas/r8a77995-draak.dts         | 5 +----
 arch/arm64/boot/dts/renesas/r8a77995.dtsi              | 5 +----
 arch/arm64/boot/dts/renesas/salvator-common.dtsi       | 5 +----
 arch/arm64/boot/dts/renesas/salvator-x.dtsi            | 5 +----
 arch/arm64/boot/dts/renesas/salvator-xs.dtsi           | 5 +----
 arch/arm64/boot/dts/renesas/ulcb-kf.dtsi               | 5 +----
 arch/arm64/boot/dts/renesas/ulcb.dtsi                  | 5 +----
 24 files changed, 24 insertions(+), 96 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795-es1-h3ulcb-kf.dts b/arch/arm64/boot/dts/renesas/r8a7795-es1-h3ulcb-kf.dts
index 009cb1cb0dde..2f24dfc45617 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-es1-h3ulcb-kf.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7795-es1-h3ulcb-kf.dts
@@ -1,12 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Device Tree Source for the H3ULCB Kingfisher board
  *
  * Copyright (C) 2017 Renesas Electronics Corp.
  * Copyright (C) 2017 Cogent Embedded, Inc.
- *
- * This file is licensed under the terms of the GNU General Public License
- * version 2.  This program is licensed "as is" without any warranty of any
- * kind, whether express or implied.
  */
 
 #include "r8a7795-es1-h3ulcb.dts"
diff --git a/arch/arm64/boot/dts/renesas/r8a7795-es1-h3ulcb.dts b/arch/arm64/boot/dts/renesas/r8a7795-es1-h3ulcb.dts
index dd4f9b6a4254..598b98168559 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-es1-h3ulcb.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7795-es1-h3ulcb.dts
@@ -1,12 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Device Tree Source for the H3ULCB (R-Car Starter Kit Premier) board
  *
  * Copyright (C) 2016 Renesas Electronics Corp.
  * Copyright (C) 2016 Cogent Embedded, Inc.
- *
- * This file is licensed under the terms of the GNU General Public License
- * version 2.  This program is licensed "as is" without any warranty of any
- * kind, whether express or implied.
  */
 
 /dts-v1/;
diff --git a/arch/arm64/boot/dts/renesas/r8a7795-es1-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a7795-es1-salvator-x.dts
index 3f46345a4644..6b5fa91f1d5d 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-es1-salvator-x.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7795-es1-salvator-x.dts
@@ -1,11 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Device Tree Source for the Salvator-X board with R-Car H3 ES1.x
  *
  * Copyright (C) 2015 Renesas Electronics Corp.
- *
- * This file is licensed under the terms of the GNU General Public License
- * version 2.  This program is licensed "as is" without any warranty of any
- * kind, whether express or implied.
  */
 
 /dts-v1/;
diff --git a/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi b/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
index e19dcd6cb767..fde3e84626d7 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
@@ -1,11 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Device Tree Source for the r8a7795 ES1.x SoC
  *
  * Copyright (C) 2015 Renesas Electronics Corp.
- *
- * This file is licensed under the terms of the GNU General Public License
- * version 2.  This program is licensed "as is" without any warranty of any
- * kind, whether express or implied.
  */
 
 #include "r8a7795.dtsi"
diff --git a/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb-kf.dts b/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb-kf.dts
index 4403227c0f97..80791ed27539 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb-kf.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb-kf.dts
@@ -1,12 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Device Tree Source for the H3ULCB Kingfisher board
  *
  * Copyright (C) 2017 Renesas Electronics Corp.
  * Copyright (C) 2017 Cogent Embedded, Inc.
- *
- * This file is licensed under the terms of the GNU General Public License
- * version 2.  This program is licensed "as is" without any warranty of any
- * kind, whether express or implied.
  */
 
 #include "r8a7795-h3ulcb.dts"
diff --git a/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts b/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
index 0afe777973de..df50bf46406e 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
@@ -1,12 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Device Tree Source for the H3ULCB (R-Car Starter Kit Premier) board
  *
  * Copyright (C) 2016 Renesas Electronics Corp.
  * Copyright (C) 2016 Cogent Embedded, Inc.
- *
- * This file is licensed under the terms of the GNU General Public License
- * version 2.  This program is licensed "as is" without any warranty of any
- * kind, whether express or implied.
  */
 
 /dts-v1/;
diff --git a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
index 0efbef5ea9b7..446822f5751c 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
@@ -1,11 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Device Tree Source for the Salvator-X board with R-Car H3 ES2.0
  *
  * Copyright (C) 2015 Renesas Electronics Corp.
- *
- * This file is licensed under the terms of the GNU General Public License
- * version 2.  This program is licensed "as is" without any warranty of any
- * kind, whether express or implied.
  */
 
 /dts-v1/;
diff --git a/arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts b/arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts
index e231b5a7cbab..8ded64d0a4d5 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts
@@ -1,11 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Device Tree Source for the Salvator-X 2nd version board with R-Car H3 ES2.0
  *
  * Copyright (C) 2015-2017 Renesas Electronics Corp.
- *
- * This file is licensed under the terms of the GNU General Public License
- * version 2.  This program is licensed "as is" without any warranty of any
- * kind, whether express or implied.
  */
 
 /dts-v1/;
diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index 7f66faad565d..ebfb9f62b552 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -1,11 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Device Tree Source for the r8a7795 SoC
  *
  * Copyright (C) 2015 Renesas Electronics Corp.
- *
- * This file is licensed under the terms of the GNU General Public License
- * version 2.  This program is licensed "as is" without any warranty of any
- * kind, whether express or implied.
  */
 
 #include <dt-bindings/clock/r8a7795-cpg-mssr.h>
diff --git a/arch/arm64/boot/dts/renesas/r8a7796-m3ulcb-kf.dts b/arch/arm64/boot/dts/renesas/r8a7796-m3ulcb-kf.dts
index de2390f009e7..2df50eb11f16 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796-m3ulcb-kf.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7796-m3ulcb-kf.dts
@@ -1,12 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Device Tree Source for the M3ULCB Kingfisher board
  *
  * Copyright (C) 2017 Renesas Electronics Corp.
  * Copyright (C) 2017 Cogent Embedded, Inc.
- *
- * This file is licensed under the terms of the GNU General Public License
- * version 2.  This program is licensed "as is" without any warranty of any
- * kind, whether express or implied.
  */
 
 #include "r8a7796-m3ulcb.dts"
diff --git a/arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts b/arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts
index daee1f1a3f68..cbd8acbf537e 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts
@@ -1,12 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Device Tree Source for the M3ULCB (R-Car Starter Kit Pro) board
  *
  * Copyright (C) 2016 Renesas Electronics Corp.
  * Copyright (C) 2016 Cogent Embedded, Inc.
- *
- * This file is licensed under the terms of the GNU General Public License
- * version 2.  This program is licensed "as is" without any warranty of any
- * kind, whether express or implied.
  */
 
 /dts-v1/;
diff --git a/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
index 90cca09b9a5e..052d72acc862 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
@@ -1,11 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Device Tree Source for the Salvator-X board with R-Car M3-W
  *
  * Copyright (C) 2016 Renesas Electronics Corp.
- *
- * This file is licensed under the terms of the GNU General Public License
- * version 2.  This program is licensed "as is" without any warranty of any
- * kind, whether express or implied.
  */
 
 /dts-v1/;
diff --git a/arch/arm64/boot/dts/renesas/r8a7796-salvator-xs.dts b/arch/arm64/boot/dts/renesas/r8a7796-salvator-xs.dts
index ddf35d4cd5e5..8860be65342e 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796-salvator-xs.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7796-salvator-xs.dts
@@ -1,11 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Device Tree Source for the Salvator-X 2nd version board with R-Car M3-W
  *
  * Copyright (C) 2015-2017 Renesas Electronics Corp.
- *
- * This file is licensed under the terms of the GNU General Public License
- * version 2.  This program is licensed "as is" without any warranty of any
- * kind, whether express or implied.
  */
 
 /dts-v1/;
diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
index 85169239b606..b4957ab336c7 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
@@ -1,11 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Device Tree Source for the r8a7796 SoC
  *
  * Copyright (C) 2016 Renesas Electronics Corp.
- *
- * This file is licensed under the terms of the GNU General Public License
- * version 2.  This program is licensed "as is" without any warranty of any
- * kind, whether express or implied.
  */
 
 #include <dt-bindings/clock/r8a7796-cpg-mssr.h>
diff --git a/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts b/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
index 21f9cf5c6e84..b6d53321576b 100644
--- a/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
@@ -1,12 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Device Tree Source for the Eagle board
  *
  * Copyright (C) 2016-2017 Renesas Electronics Corp.
  * Copyright (C) 2017 Cogent Embedded, Inc.
- *
- * This file is licensed under the terms of the GNU General Public License
- * version 2.  This program is licensed "as is" without any warranty of any
- * kind, whether express or implied.
  */
 
 /dts-v1/;
diff --git a/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts b/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts
index 9fce031a596f..8eac8ca6550b 100644
--- a/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts
@@ -1,12 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Device Tree Source for the V3M Starter Kit board
  *
  * Copyright (C) 2017 Renesas Electronics Corp.
  * Copyright (C) 2017 Cogent Embedded, Inc.
- *
- * This file is licensed under the terms of the GNU General Public License
- * version 2.  This program is licensed "as is" without any warranty of any
- * kind, whether express or implied.
  */
 
 /dts-v1/;
diff --git a/arch/arm64/boot/dts/renesas/r8a77970.dtsi b/arch/arm64/boot/dts/renesas/r8a77970.dtsi
index c8464d1ef1b2..a949cee2eda4 100644
--- a/arch/arm64/boot/dts/renesas/r8a77970.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77970.dtsi
@@ -1,12 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Device Tree Source for the r8a77970 SoC
  *
  * Copyright (C) 2016-2017 Renesas Electronics Corp.
  * Copyright (C) 2017 Cogent Embedded, Inc.
- *
- * This file is licensed under the terms of the GNU General Public License
- * version 2.  This program is licensed "as is" without any warranty of any
- * kind, whether express or implied.
  */
 
 #include <dt-bindings/clock/r8a77970-cpg-mssr.h>
diff --git a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
index 9d73de8bc94d..0a11d611207d 100644
--- a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
@@ -1,12 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Device Tree Source for the Draak board
  *
  * Copyright (C) 2016 Renesas Electronics Corp.
  * Copyright (C) 2017 Glider bvba
- *
- * This file is licensed under the terms of the GNU General Public License
- * version 2.  This program is licensed "as is" without any warranty of any
- * kind, whether express or implied.
  */
 
 /dts-v1/;
diff --git a/arch/arm64/boot/dts/renesas/r8a77995.dtsi b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
index 2506f46293e8..c964650fabe5 100644
--- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
@@ -1,12 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Device Tree Source for the r8a77995 SoC
  *
  * Copyright (C) 2016 Renesas Electronics Corp.
  * Copyright (C) 2017 Glider bvba
- *
- * This file is licensed under the terms of the GNU General Public License
- * version 2.  This program is licensed "as is" without any warranty of any
- * kind, whether express or implied.
  */
 
 #include <dt-bindings/clock/r8a77995-cpg-mssr.h>
diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
index 9256fbaaab7f..313e36beaf5c 100644
--- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
@@ -1,11 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Device Tree Source for common parts of Salvator-X board variants
  *
  * Copyright (C) 2015-2016 Renesas Electronics Corp.
- *
- * This file is licensed under the terms of the GNU General Public License
- * version 2.  This program is licensed "as is" without any warranty of any
- * kind, whether express or implied.
  */
 
 /*
diff --git a/arch/arm64/boot/dts/renesas/salvator-x.dtsi b/arch/arm64/boot/dts/renesas/salvator-x.dtsi
index 468868c8ed9f..f7091ecb02f9 100644
--- a/arch/arm64/boot/dts/renesas/salvator-x.dtsi
+++ b/arch/arm64/boot/dts/renesas/salvator-x.dtsi
@@ -1,11 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Device Tree Source for the Salvator-X board
  *
  * Copyright (C) 2015-2016 Renesas Electronics Corp.
- *
- * This file is licensed under the terms of the GNU General Public License
- * version 2.  This program is licensed "as is" without any warranty of any
- * kind, whether express or implied.
  */
 
 #include "salvator-common.dtsi"
diff --git a/arch/arm64/boot/dts/renesas/salvator-xs.dtsi b/arch/arm64/boot/dts/renesas/salvator-xs.dtsi
index bf4d200fb546..8b139d93488f 100644
--- a/arch/arm64/boot/dts/renesas/salvator-xs.dtsi
+++ b/arch/arm64/boot/dts/renesas/salvator-xs.dtsi
@@ -1,11 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Device Tree Source for the Salvator-X 2nd version board
  *
  * Copyright (C) 2015-2017 Renesas Electronics Corp.
- *
- * This file is licensed under the terms of the GNU General Public License
- * version 2.  This program is licensed "as is" without any warranty of any
- * kind, whether express or implied.
  */
 
 #include "salvator-common.dtsi"
diff --git a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
index a4e715cbde87..8bf3091a899c 100644
--- a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
@@ -1,12 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Device Tree Source for the Kingfisher (ULCB extension) board
  *
  * Copyright (C) 2017 Renesas Electronics Corp.
  * Copyright (C) 2017 Cogent Embedded, Inc.
- *
- * This file is licensed under the terms of the GNU General Public License
- * version 2.  This program is licensed "as is" without any warranty of any
- * kind, whether express or implied.
  */
 
 / {
diff --git a/arch/arm64/boot/dts/renesas/ulcb.dtsi b/arch/arm64/boot/dts/renesas/ulcb.dtsi
index 0edb16e6b372..219ad06edfc7 100644
--- a/arch/arm64/boot/dts/renesas/ulcb.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb.dtsi
@@ -1,12 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Device Tree Source for the R-Car Gen3 ULCB board
  *
  * Copyright (C) 2016 Renesas Electronics Corp.
  * Copyright (C) 2016 Cogent Embedded, Inc.
- *
- * This file is licensed under the terms of the GNU General Public License
- * version 2.  This program is licensed "as is" without any warranty of any
- * kind, whether express or implied.
  */
 
 #include <dt-bindings/gpio/gpio.h>
-- 
2.11.0
