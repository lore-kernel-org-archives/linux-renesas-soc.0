Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 913DD495047
	for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Aug 2026 19:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786734283; cv=none; b=koYBIETzy8TJTP289Jktkyt9iiAClMOQc4/GS+Uku2JM9fKPJjiSQ2RwG7KKDmGHTp36ZqNMcZK8rGeK5ryapJ6MCstQvWYmvJEHotLCKNd7IxC2dnzo6036aOv0RDUP0u78ITh64Sae+ZQ3//l2tqbuBJB7m68QdYRYr4tshaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786734283; c=relaxed/simple;
	bh=Pw0NZaYpiHcJ6LnUczkxjh53XdpFkgJeSJbVi1h9dsQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VYib13csPOsr5UAindb18w7BbG/dD+YVbMdxqLErGQldNEIMJsEBMGkWVc24FN9vOGNKZtWS1lYPbOAqj2q4uEm16d+eDlH8GwfHyNNFlm/bZfZzB+Ql8JT7Bq0i1ZYMCwWpfNbgL3VpdiDmckPcKcy+KI4osCwD47CMbhDDzIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=goHqpxBt; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="goHqpxBt"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-381b831d535so2131733a91.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Aug 2026 12:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786734282; x=1787339082; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WKJuMY/9Z2qQ1nJiebk6zH8BqGVpVFHJzd3jEHA9B+4=;
        b=goHqpxBtML0Hd5R/s3QPhKzDLtTfWQGXxtEDCwRmoUzZq8yZ1/sK6OMkizPM0yVvYA
         fRACJiPV80hTDTfEShUgccW8DAg5zadLHujwfwSw9XeXkgagpuVUe8a1gS6i9fnueEhn
         SfaGlfPhrp0CYGi+lePlSJN3/fJFgW+Do712cY8ZYCbyAAvH49CJJFB6nPhhGQK26mzq
         EFPOp3YjaF5AhU4pzuTqQIf4dm0SpB8jFYcEeyse22H7EpAlANqDS32LDDzDkVeRnpWa
         +QeyJ9VY1Bx6AKbXzJxCoFvR12G+En7xTSs1pfD+ikh7riUXIHJvIO48G+LrpVvgR4za
         ONQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786734282; x=1787339082;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WKJuMY/9Z2qQ1nJiebk6zH8BqGVpVFHJzd3jEHA9B+4=;
        b=UovBM1QScQicf3B71kza4r6Wkg0DYVBqMi+Tm2Mij40e/ZIBvW+gy0g0eHnRmPCaEW
         2DF2twJYGNY5KBD/1t8GKqJhak6bAhosD4nGrpRPr5gzTmgNECB4PmnrjMH9MQzxhDsh
         ExGoSEaslylK3muhdGcoJ4ZfxvRP29cVCRCYgri35dgUaTgJMArppe3NW/faKs0Ce2eG
         PaNWfMjrYn1HvHLbOCSl5tefHcMtt1QEiGFigyeZTNVJiL+aYWWnEWuCbmKyr38IcTz5
         p9UdzmCJURYJaIcHIZN611NmW29d9QCPu8ZZJ/hbKf9eZNL/fyFhlFdgYODOKI3/jSuM
         iSIQ==
X-Forwarded-Encrypted: i=1; AHgh+RqPQAVAG26f9jdo8S3w5TscDLnN2J7Qd3Hp5YLTdsjgmFubCKqGxR/QwndB4ZnIsnAaySiVLi1/goYzn3SJGZTbPw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4rwy7P1WftlHYBnQank/UWxADz35spWSizXll0sg/IxQCrcW2
	jZ5isQoT44XOHPwobIydoiqCoZarKS55+XRTyCh1Ij8t8BKUt6EiA6t0
X-Gm-Gg: AR+sD12JYTwtCxnDIH/JaipK5X31gG4vSPYC97mKtQxBo/mlvzHUAlqESet+OVoKwrb
	6ISADWXcucbUHvv0q2PA8547kL3eDGjBT8KW9MnMbDzjCEBZsIxODnI8ZJf4nabL6T88gW6TBS9
	3dtoKU2iL498eQcYaCmekLez1m1RbEp578sZH2+xjARQLlfd5AHBnwkmtYG2wqIZY+bz4iuD2BX
	ZOgsvjyLjUIdAuXzZwhS+sPdL/THVMScAuGT6Cth6AbuCGfx2IogO+t6lKZJiAw1NIfr9WDGc3z
	dP2JN55ugoQthEClmBhwbIHLL3iFl/CHXcgVAaVbmIJJ2gKUrDE6AErX6OXKVtxdY4gjVDjibgZ
	+dWnAOYfbJf3xEUHqOcSVuFaiKGlYC2gmo/PlcBp7DbWXWTTI+nKIaA+O7XrFr3PegdXVIxONIu
	umJbHp+fvHUBZbxs932iMiBnnOI+r85eLsndn5vChqlIJfYVzpBlYqdFOwZlvZTwJf9ViTVdWYw
	XhkbmnGZMxet37QViftEZVR/0wFIJkNIZ4ZsKLCYdc3CZgjXIOMPstCwX2P0oGypQ5RiyNiL0mN
	K+4mOi3LiiYG
X-Received: by 2002:a17:90b:2b8e:b0:38e:4f41:83df with SMTP id 98e67ed59e1d1-3933b8aa611mr9883133a91.15.1786734281764;
        Fri, 14 Aug 2026 12:04:41 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:94:ab62:887d:e555:df21:3318])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141388b2554sm16952785c88.14.2026.08.14.12.04.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 12:04:41 -0700 (PDT)
From: manushprajwal <manushprajwal555@gmail.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Manush Prajwal <manushprajwal555@gmail.com>
Subject: [PATCH v2] net: ethernet: renesas: rswitch: fix device_node refcount leak in rswitch_get_port_node()
Date: Sat, 15 Aug 2026 00:34:23 +0530
Message-ID: <20260814190423.933-1-manushprajwal555@gmail.com>
X-Mailer: git-send-email 2.46.2.windows.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Manush Prajwal <manushprajwal555@gmail.com>

On an of_property_read_u32() failure, rswitch_get_port_node() set port
to NULL and jumped to the out label before releasing the reference the
for_each_available_child_of_node() iterator was holding on it. Once
port was overwritten with NULL, that reference could never be
released since out: only put "ports", the parent node.

Rework the function around for_each_available_child_of_node_scoped()
instead of adding a manual of_node_put(), so the iterator's reference
is dropped automatically on every exit path. Since port is the
function's return value, take an explicit reference with of_node_get()
on the match before breaking out of the loop.

Signed-off-by: Manush Prajwal <manushprajwal555@gmail.com>
---
v2: Rework using for_each_available_child_of_node_scoped() instead of
    a manual of_node_put(), per Andrew Lunn's review.

 drivers/net/ethernet/renesas/rswitch_main.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/renesas/rswitch_main.c b/drivers/net/ethernet/renesas/rswitch_main.c
index 6fe9648163..ffdc42f430 100644
--- a/drivers/net/ethernet/renesas/rswitch_main.c
+++ b/drivers/net/ethernet/renesas/rswitch_main.c
@@ -1303,8 +1303,8 @@
 /* Call of_node_put(port) after done */
 static struct device_node *rswitch_get_port_node(struct rswitch_device *rdev)
 {
-	struct device_node *ports, *port;
-	int err = 0;
+	struct device_node *ports;
+	struct device_node *port = NULL;
 	u32 index;

 	ports = of_get_child_by_name(rdev->ndev->dev.parent->of_node,
@@ -1312,17 +1312,15 @@ static struct device_node *rswitch_get_port_node(struct rswitch_device *rdev)
 	if (!ports)
 		return NULL;

-	for_each_available_child_of_node(ports, port) {
-		err = of_property_read_u32(port, "reg", &index);
-		if (err < 0) {
-			port = NULL;
-			goto out;
-		}
-		if (index == rdev->etha->index)
+	for_each_available_child_of_node_scoped(ports, child) {
+		if (of_property_read_u32(child, "reg", &index))
+			break;
+		if (index == rdev->etha->index) {
+			port = of_node_get(child);
 			break;
+		}
 	}

-out:
 	of_node_put(ports);

 	return port;
--
2.46.2.windows.1
