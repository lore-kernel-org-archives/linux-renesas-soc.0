Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f52.google.com ([209.85.215.52]:36602 "EHLO
        mail-lf0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751470AbdILVFo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Sep 2017 17:05:44 -0400
Received: by mail-lf0-f52.google.com with SMTP id m199so29513717lfe.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Sep 2017 14:05:44 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-Id: <20170912210540.129836169@cogentembedded.com>
Date: Tue, 12 Sep 2017 23:37:25 +0300
To: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will.deacon@arm.com>
To: Simon Horman <horms@verge.net.au>
Cc: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Subject: [PATCH 09/11] arm64: renesas: document Eagle board
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Disposition: inline; filename=arm64-renesas-document-Eagle-board.patch
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Document the Eagle device tree bindings, listing it as a supported board.

This allows to use checkpatch.pl to validate .dts files referring to the
Eagle board.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 Documentation/devicetree/bindings/arm/shmobile.txt |    2 ++
 1 file changed, 2 insertions(+)

Index: renesas/Documentation/devicetree/bindings/arm/shmobile.txt
===================================================================
--- renesas.orig/Documentation/devicetree/bindings/arm/shmobile.txt
+++ renesas/Documentation/devicetree/bindings/arm/shmobile.txt
@@ -59,6 +59,8 @@ Boards:
     compatible = "renesas,bockw", "renesas,r8a7778"
   - Draak (RTP0RC77995SEB0010S)
     compatible = "renesas,draak", "renesas,r8a77995"
+  - Eagle (RTP0RC77970SEB0010S)
+    compatible = "renesas,eagle", "renesas,r8a77970";
   - Genmai (RTK772100BC00000BR)
     compatible = "renesas,genmai", "renesas,r7s72100"
   - GR-Peach (X28A-M01-E/F)
