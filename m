Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:45320 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727778AbeHVBYu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 Aug 2018 21:24:50 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Kuninori Morimoto <kuninori.morimoto.gx@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 06/11] net: ethernet: renesas: use SPDX identifier for Renesas drivers
Date: Wed, 22 Aug 2018 00:02:19 +0200
Message-Id: <20180821220233.9202-7-wsa+renesas@sang-engineering.com>
In-Reply-To: <20180821220233.9202-1-wsa+renesas@sang-engineering.com>
References: <20180821220233.9202-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

To be applied individually per subsystem tree. Morimoto-san, could you maybe
ack this with your Renesas address?

 drivers/net/ethernet/renesas/ravb.h      |  5 +----
 drivers/net/ethernet/renesas/ravb_main.c |  5 +----
 drivers/net/ethernet/renesas/sh_eth.c    | 13 +------------
 drivers/net/ethernet/renesas/sh_eth.h    | 13 +------------
 4 files changed, 4 insertions(+), 32 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb.h b/drivers/net/ethernet/renesas/ravb.h
index b81f4faf7b10..1470fc12282b 100644
--- a/drivers/net/ethernet/renesas/ravb.h
+++ b/drivers/net/ethernet/renesas/ravb.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /* Renesas Ethernet AVB device driver
  *
  * Copyright (C) 2014-2015 Renesas Electronics Corporation
@@ -5,10 +6,6 @@
  * Copyright (C) 2015-2016 Cogent Embedded, Inc. <source@cogentembedded.com>
  *
  * Based on the SuperH Ethernet driver
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License version 2,
- * as published by the Free Software Foundation.
  */
 
 #ifndef __RAVB_H__
diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index c06f2df895c2..aff5516b781e 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /* Renesas Ethernet AVB device driver
  *
  * Copyright (C) 2014-2015 Renesas Electronics Corporation
@@ -5,10 +6,6 @@
  * Copyright (C) 2015-2016 Cogent Embedded, Inc. <source@cogentembedded.com>
  *
  * Based on the SuperH Ethernet driver
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License version 2,
- * as published by the Free Software Foundation.
  */
 
 #include <linux/cache.h>
diff --git a/drivers/net/ethernet/renesas/sh_eth.c b/drivers/net/ethernet/renesas/sh_eth.c
index 5573199c4536..ad4433d59237 100644
--- a/drivers/net/ethernet/renesas/sh_eth.c
+++ b/drivers/net/ethernet/renesas/sh_eth.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*  SuperH Ethernet device driver
  *
  *  Copyright (C) 2014 Renesas Electronics Corporation
@@ -5,18 +6,6 @@
  *  Copyright (C) 2008-2014 Renesas Solutions Corp.
  *  Copyright (C) 2013-2017 Cogent Embedded, Inc.
  *  Copyright (C) 2014 Codethink Limited
- *
- *  This program is free software; you can redistribute it and/or modify it
- *  under the terms and conditions of the GNU General Public License,
- *  version 2, as published by the Free Software Foundation.
- *
- *  This program is distributed in the hope it will be useful, but WITHOUT
- *  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- *  FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- *  more details.
- *
- *  The full GNU General Public License is included in this distribution in
- *  the file called "COPYING".
  */
 
 #include <linux/module.h>
diff --git a/drivers/net/ethernet/renesas/sh_eth.h b/drivers/net/ethernet/renesas/sh_eth.h
index f94be99cf400..0c18650bbfe6 100644
--- a/drivers/net/ethernet/renesas/sh_eth.h
+++ b/drivers/net/ethernet/renesas/sh_eth.h
@@ -1,19 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*  SuperH Ethernet device driver
  *
  *  Copyright (C) 2006-2012 Nobuhiro Iwamatsu
  *  Copyright (C) 2008-2012 Renesas Solutions Corp.
- *
- *  This program is free software; you can redistribute it and/or modify it
- *  under the terms and conditions of the GNU General Public License,
- *  version 2, as published by the Free Software Foundation.
- *
- *  This program is distributed in the hope it will be useful, but WITHOUT
- *  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- *  FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- *  more details.
- *
- *  The full GNU General Public License is included in this distribution in
- *  the file called "COPYING".
  */
 
 #ifndef __SH_ETH_H__
-- 
2.11.0
