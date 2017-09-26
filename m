Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:54386 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965047AbdIZKGP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Sep 2017 06:06:15 -0400
Received: from avalon.guest.par1.mozilla.com (unknown [IPv6:2a00:8c40:243:232:120b:a9ff:fe3c:7148])
        by galahad.ideasonboard.com (Postfix) with ESMTPSA id EAF8921457
        for <linux-renesas-soc@vger.kernel.org>; Tue, 26 Sep 2017 12:06:04 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Subject: [RFC 01/13] dt-bindings: reserved-memory: Add binding for the Renesas lossy decompression area
Date: Tue, 26 Sep 2017 13:05:53 +0300
Message-Id: <20170926100605.2313-4-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20170926100605.2313-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20170926100605.2313-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The Renesas R-Car Gen3 DDR3/4 controller supports transparent
decompression of data stored in the Renesas near-lossless image
compression format (FCNL). Decompression is controlled based on system
memory ranges configured by the secure mode boot loader. As any data
located within those memory ranges will be automatically decompressed
when read, those ranges are not usable as normal system memory.

The memory ranges for lossy decompression are system-specific and fixed
from a non-secure software point of view. These bindings describe the
ranges in the form of a reserved memory node.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 .../renesas,lossy-decompression.txt                | 102 +++++++++++++++++++++
 1 file changed, 102 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reserved-memory/renesas,lossy-decompression.txt

diff --git a/Documentation/devicetree/bindings/reserved-memory/renesas,lossy-decompression.txt b/Documentation/devicetree/bindings/reserved-memory/renesas,lossy-decompression.txt
new file mode 100644
index 000000000000..a70f84ae7b4a
--- /dev/null
+++ b/Documentation/devicetree/bindings/reserved-memory/renesas,lossy-decompression.txt
@@ -0,0 +1,102 @@
+Renesas Lossy Decompression Reserved Memory Area
+------------------------------------------------
+
+The Renesas R-Car Gen3 DDR3/4 controller supports transparent decompression of
+data stored in the Renesas near-lossless image compression format (FCNL).
+Decompression is controlled based on system memory ranges configured by the
+secure mode boot loader. As any data located within those memory ranges will
+be automatically decompressed when read, those ranges are not usable as normal
+system memory.
+
+The memory ranges for lossy decompression are system-specific and fixed from a
+non-secure software point of view. These bindings describe the ranges in the
+form of a reserved memory node.
+
+Required properties:
+
+- compatible: Shall be "renesas,lossy-decompression", "shared-dma-pool".
+- reg: Reserved memory ranges for the lossy decompression (up to 16).
+- no-map: Shall be set.
+- renesas,format: The image format used for the memory range. Valid formats
+  are:
+
+  - 0: YUV planar
+  - 1: YUV422 interleaved
+  - 2: ARGB8888
+
+The Lossy Decompression nodes must be located as direct children of the
+/reserved-memory node. See reserved-memory.txt for more information.
+
+In order to allow references to those reserved memory nodes (through
+memory-region properties) in device tree sources, they are meant to be
+included without a reg property, and later updated in the device tree blob by
+the boot loader before passing control to the operating system.
+
+Without a reg property in the device tree source the Lossy Decompression nodes
+can't have a unit address, and would thus all have the same name, which isn't
+valid. To solve that problem the device tree sources should name the nodes
+lossy-decompression-<format> where format is the value of the renesas,format
+property. The boot loader is expected to rename the nodes to
+lossy-decompression@<unit-address>.
+
+
+Example: R8A7795 (R-Car H3) Lossy Decompression Nodes
+
+- Original device tree source
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		lossy-decompression-0 {
+			compatible = "renesas,lossy-decompression",
+				     "shared-dma-pool";
+			no-map;
+			renesas,formats = <0>;
+		};
+
+		lossy-decompression-1 {
+			compatible = "renesas,lossy-decompression",
+				     "shared-dma-pool";
+			no-map;
+			renesas,formats = <1>;
+		};
+
+		lossy-decompression-2 {
+			compatible = "renesas,lossy-decompression",
+				     "shared-dma-pool";
+			no-map;
+			renesas,formats = <2>;
+		};
+	};
+
+- Device tree after being patched by the boot loader
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		lossy-decompression@54000000 {
+			compatible = "renesas,lossy-decompression",
+				     "shared-dma-pool";
+			reg = <0 0x54000000 0 0x03000000>;
+			no-map;
+			renesas,formats = <2>;
+		};
+
+		lossy-decompression@57000000 {
+			compatible = "renesas,lossy-decompression",
+				     "shared-dma-pool";
+			reg = <0 0x57000000 0 0x03000000>;
+			no-map;
+			renesas,formats = <0>;
+		};
+
+		lossy-decompression@5a000000 {
+			compatible = "renesas,lossy-decompression",
+				     "shared-dma-pool";
+			reg = <0 0x5a000000 0 0x03000000>;
+			no-map;
+			renesas,formats = <1>;
+		};
+	};
-- 
Regards,

Laurent Pinchart
