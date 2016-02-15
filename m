Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Mon, 15 Feb 2016 10:49:47 +0900
From: Simon Horman <horms+renesas@verge.net.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org, linux-sh@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH v2] MAINTAINERS: Update mailing list for Renesas ARM64 SoC
 Development
Message-ID: <20160215014947.GA14034@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Update the mailing list used for development of support for
ARM64 Renesas SoCs.

This is a follow-up for a similar change for other Renesas SoCs and
drivers uses by Renesas SoCs. The ARM64 SoC entry was not updated in
that patch as it was not yet present in mainline.

The motivation for the mailing list update is that Renesas SoCs are now
much wider than the SH architecture and there is some desire from some for
the linux-sh list to refocus on discussion of the work on the SH
architecture.

Acked-by: Magnus Damm <damm@opensource.se>
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
Linus, please consider this for v4.5.

v2
* Added Acks.
---
 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 293874ca4d4e..0331ce2a6dc6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1439,8 +1439,8 @@ S:	Maintained
 ARM/RENESAS ARM64 ARCHITECTURE
 M:	Simon Horman <horms@verge.net.au>
 M:	Magnus Damm <magnus.damm@gmail.com>
-L:	linux-sh@vger.kernel.org
-Q:	http://patchwork.kernel.org/project/linux-sh/list/
+L:	linux-renesas-soc@vger.kernel.org
+Q:	http://patchwork.kernel.org/project/linux-renesas-soc/list/
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git next
 S:	Supported
 F:	arch/arm64/boot/dts/renesas/
-- 
2.1.4
