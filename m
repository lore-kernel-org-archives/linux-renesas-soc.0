Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yangbo Lu <yangbo.lu@nxp.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc: Dirk Behme <dirk.behme@de.bosch.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 3/7] base: soc: Check for NULL SoC device attributes
Date: Mon, 31 Oct 2016 12:30:51 +0100
Message-Id: <1477913455-5314-4-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1477913455-5314-1-git-send-email-geert+renesas@glider.be>
References: <1477913455-5314-1-git-send-email-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

If soc_device_match() is used to check the value of a specific
attribute that is not present for the current SoC, the kernel crashes
with a NULL pointer dereference.

Fix this by explicitly checking for the absence of a needed property,
and considering this a non-match.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
v2:
  - Add Acked-by.
---
 drivers/base/soc.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/base/soc.c b/drivers/base/soc.c
index 04ee597fc3a3fda0..dc26e5949a320223 100644
--- a/drivers/base/soc.c
+++ b/drivers/base/soc.c
@@ -176,19 +176,23 @@ static int soc_device_match_one(struct device *dev, void *arg)
 	const struct soc_device_attribute *match = arg;
 
 	if (match->machine &&
-	    !glob_match(match->machine, soc_dev->attr->machine))
+	    (!soc_dev->attr->machine ||
+	     !glob_match(match->machine, soc_dev->attr->machine)))
 		return 0;
 
 	if (match->family &&
-	    !glob_match(match->family, soc_dev->attr->family))
+	    (!soc_dev->attr->family ||
+	     !glob_match(match->family, soc_dev->attr->family)))
 		return 0;
 
 	if (match->revision &&
-	    !glob_match(match->revision, soc_dev->attr->revision))
+	    (!soc_dev->attr->revision ||
+	     !glob_match(match->revision, soc_dev->attr->revision)))
 		return 0;
 
 	if (match->soc_id &&
-	    !glob_match(match->soc_id, soc_dev->attr->soc_id))
+	    (!soc_dev->attr->soc_id ||
+	     !glob_match(match->soc_id, soc_dev->attr->soc_id)))
 		return 0;
 
 	return 1;
-- 
1.9.1
