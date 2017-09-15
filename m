Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f45.google.com ([209.85.215.45]:52522 "EHLO
        mail-lf0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751778AbdIOToq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Sep 2017 15:44:46 -0400
Received: by mail-lf0-f45.google.com with SMTP id b127so3395702lfe.9
        for <linux-renesas-soc@vger.kernel.org>; Fri, 15 Sep 2017 12:44:46 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-Id: <20170915194442.464361390@cogentembedded.com>
Date: Fri, 15 Sep 2017 22:43:24 +0300
To: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Simon Horman <horms@verge.net.au>,
        linux-renesas-soc@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will.deacon@arm.com>
Subject: [PATCH v2 6/8] arm64: renesas: document Eagle board bindings
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Disposition: inline; filename=arm64-renesas-document-Eagle-board-bindings-v2.patch
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Document the Eagle device tree bindings, listing it as a supported board.

This allows to use checkpatch.pl to validate .dts files referring to the
Eagle board.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
Changes in version 2:
- renamed the patch.

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
