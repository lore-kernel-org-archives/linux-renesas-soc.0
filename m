Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:57840 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750737AbdLNAZP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Dec 2017 19:25:15 -0500
From: Kieran Bingham <kbingham@kernel.org>
To: linux-renesas-soc@vger.kernel.org,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com
Cc: Kieran Bingham <kieran@ksquared.org.uk>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [RFC PATCH 1/3] kms-tests: Provide .gitignore
Date: Thu, 14 Dec 2017 00:25:07 +0000
Message-Id: <e5595b1910e29c055c0345b2abf5d730bfaf2e31.1513211056.git-series.kieran@bingham.xyz>
In-Reply-To: <cover.417c1b91fc9842fb290756d5ad23bdc16970b1e1.1513211056.git-series.kieran@bingham.xyz>
References: <cover.417c1b91fc9842fb290756d5ad23bdc16970b1e1.1513211056.git-series.kieran@bingham.xyz>
In-Reply-To: <cover.417c1b91fc9842fb290756d5ad23bdc16970b1e1.1513211056.git-series.kieran@bingham.xyz>
References: <cover.417c1b91fc9842fb290756d5ad23bdc16970b1e1.1513211056.git-series.kieran@bingham.xyz>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Kieran Bingham <kieran@bingham.xyz>

From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Provide an initial .gitignore file to hide python related
files that may be created in an active workspace

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 .gitignore | 4 ++++
 1 file changed, 4 insertions(+)
 create mode 100644 .gitignore

diff --git a/.gitignore b/.gitignore
new file mode 100644
index 000000000000..8df6f4ad55ab
--- /dev/null
+++ b/.gitignore
@@ -0,0 +1,4 @@
+*.log
+*.swp
+*.pyc
+__pycache__
-- 
git-series 0.9.1
