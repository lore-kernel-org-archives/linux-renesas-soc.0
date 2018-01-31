Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:34282 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750829AbeAaT4u (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 31 Jan 2018 14:56:50 -0500
Received: by mail-lf0-f65.google.com with SMTP id k19so22621323lfj.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 31 Jan 2018 11:56:49 -0800 (PST)
Subject: [PATCH 1/2] DT: arm: shmobile: document R8A77980 SoC bindings
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>
References: <fbdd08a3-1ab3-8e70-20f1-d9c41493b11c@cogentembedded.com>
Message-ID: <d238e77a-e304-1fca-7ca6-bb99f6e55a68@cogentembedded.com>
Date: Wed, 31 Jan 2018 22:56:47 +0300
MIME-Version: 1.0
In-Reply-To: <fbdd08a3-1ab3-8e70-20f1-d9c41493b11c@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Document the R-Car V3H (R8A77980) SoC device tree bindings.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 Documentation/devicetree/bindings/arm/shmobile.txt |    2 ++
 1 file changed, 2 insertions(+)

Index: renesas/Documentation/devicetree/bindings/arm/shmobile.txt
===================================================================
--- renesas.orig/Documentation/devicetree/bindings/arm/shmobile.txt
+++ renesas/Documentation/devicetree/bindings/arm/shmobile.txt
@@ -41,6 +41,8 @@ SoCs:
     compatible = "renesas,r8a7796"
   - R-Car V3M (R8A77970)
     compatible = "renesas,r8a77970"
+  - R-Car V3H (R8A77980)
+    compatible = "renesas,r8a77980"
   - R-Car D3 (R8A77995)
     compatible = "renesas,r8a77995"
 
