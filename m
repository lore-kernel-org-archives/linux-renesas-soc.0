Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        David Vrabel <david.vrabel@citrix.com>,
        Juergen Gross <jgross@suse.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 1/3] x86, swiotlb: Simplify pci_swiotlb_detect_override()
Date: Fri, 16 Dec 2016 14:28:40 +0100
Message-Id: <1481894922-28828-2-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1481894922-28828-1-git-send-email-geert+renesas@glider.be>
References: <1481894922-28828-1-git-send-email-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

At the end of the function, the local variable use_swiotlb has always
the same value as the global variable swiotlb. Hence drop the local
variable completely.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - New.
---
 arch/x86/kernel/pci-swiotlb.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/x86/kernel/pci-swiotlb.c b/arch/x86/kernel/pci-swiotlb.c
index b47edb8f52566e22..36049af2715ebd13 100644
--- a/arch/x86/kernel/pci-swiotlb.c
+++ b/arch/x86/kernel/pci-swiotlb.c
@@ -68,12 +68,10 @@ void x86_swiotlb_free_coherent(struct device *dev, size_t size,
  */
 int __init pci_swiotlb_detect_override(void)
 {
-	int use_swiotlb = swiotlb | swiotlb_force;
-
 	if (swiotlb_force)
 		swiotlb = 1;
 
-	return use_swiotlb;
+	return swiotlb;
 }
 IOMMU_INIT_FINISH(pci_swiotlb_detect_override,
 		  pci_xen_swiotlb_detect,
-- 
1.9.1
