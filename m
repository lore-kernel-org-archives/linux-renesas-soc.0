Return-Path: <kieran+caf_=kieranbingham=gmail.com@ksquared.org.uk>
Return-Path: <kieran@ksquared.org.uk>
Return-Path: <kieran@ksquared.org.uk>
Sender: Kieran Bingham <kieran@ksquared.org.uk>
From: Kieran Bingham <kieran@bingham.xyz>
To: laurent.pinchart@ideasonboard.com,
	linux-renesas-soc@vger.kernel.org,
	kieran@bingham.xyz
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 2/4] dt-bindings: Update Renesas R-Car FCP DT binding
Date: Fri, 27 May 2016 18:19:23 +0100
Message-Id: <1464369565-12259-4-git-send-email-kieran@bingham.xyz>
In-Reply-To: <1464369565-12259-1-git-send-email-kieran@bingham.xyz>
References: <1464369565-12259-1-git-send-email-kieran@bingham.xyz>
List-ID: <linux-renesas-soc.vger.kernel.org>

The FCP driver, can also support the FCPF variant for FDP1 compatible
processing.

Signed-off-by: Kieran Bingham <kieran@bingham.xyz>
---
 Documentation/devicetree/bindings/media/renesas,fcp.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

Cc: devicetree@vger.kernel.org

diff --git a/Documentation/devicetree/bindings/media/renesas,fcp.txt b/Documentation/devicetree/bindings/media/renesas,fcp.txt
index 6a12960609d8..1c0718b501ef 100644
--- a/Documentation/devicetree/bindings/media/renesas,fcp.txt
+++ b/Documentation/devicetree/bindings/media/renesas,fcp.txt
@@ -7,11 +7,12 @@ conversion of AXI transactions in order to reduce the memory bandwidth.
 
 There are three types of FCP: FCP for Codec (FCPC), FCP for VSP (FCPV) and FCP
 for FDP (FCPF). Their configuration and behaviour depend on the module they
-are paired with. These DT bindings currently support the FCPV only.
+are paired with. These DT bindings currently support the FCPV and FCPF.
 
  - compatible: Must be one or more of the following
 
    - "renesas,r8a7795-fcpv" for R8A7795 (R-Car H3) compatible 'FCP for VSP'
+   - "renesas,r8a7795-fcpf" for R8A7795 (R-Car H3) compatible 'FCP for FDP'
    - "renesas,fcpv" for generic compatible 'FCP for VSP'
 
    When compatible with the generic version, nodes must list the
-- 
2.5.0
