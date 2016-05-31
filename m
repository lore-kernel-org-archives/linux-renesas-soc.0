Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f53.google.com ([209.85.215.53]:33295 "EHLO
	mail-lf0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756529AbcEaWan (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 31 May 2016 18:30:43 -0400
Received: by mail-lf0-f53.google.com with SMTP id s64so1072045lfe.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 31 May 2016 15:30:42 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org,
	pawel.moll@arm.com, mark.rutland@arm.com,
	ijc+devicetree@hellion.org.uk, galak@codeaurora.org,
	devicetree@vger.kernel.org
Subject: [PATCH 11/13] DT: arm: shmobile: document Blanche board
Date: Wed, 01 Jun 2016 01:30:39 +0300
Message-ID: <52321184.HGKDRaDOBe@wasted.cogentembedded.com>
In-Reply-To: <13205049.n7pM8utpHF@wasted.cogentembedded.com>
References: <13205049.n7pM8utpHF@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Document the Blanche device tree bindings, listing it as a supported board.

This allows to use checkpatch.pl to validate .dts files referring to the
Blanche board.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 Documentation/devicetree/bindings/arm/shmobile.txt |    2 ++
 1 file changed, 2 insertions(+)

Index: renesas/Documentation/devicetree/bindings/arm/shmobile.txt
===================================================================
--- renesas.orig/Documentation/devicetree/bindings/arm/shmobile.txt
+++ renesas/Documentation/devicetree/bindings/arm/shmobile.txt
@@ -39,6 +39,8 @@ Boards:
     compatible = "renesas,ape6evm", "renesas,r8a73a4"
   - Atmark Techno Armadillo-800 EVA
     compatible = "renesas,armadillo800eva"
+  - Blanche (RTP0RC7792SEB00010S)
+    compatible = "renesas,blanche", "renesas,r8a7792"
   - BOCK-W
     compatible = "renesas,bockw", "renesas,r8a7778"
   - Genmai (RTK772100BC00000BR)
