Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D2B73E5A29
	for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Aug 2026 11:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786619511; cv=none; b=qMEJR/nJJP25X9YF7+dtUM+mXGfm0bgLvTsDjk4nW1UFZjwDvz7sbbZa6buZt1M6OQNcBtxL9xFAQ3ydIxnZNKp+49lXOobjaRUP4DJ3C/R1ZkiqjG3MJPjRdn9TDiYBUuGNvEgTKp3j46cDd6dz6YeRTR6ZoVROAyOgLQAUNNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786619511; c=relaxed/simple;
	bh=X2XXRuA9n7iqYtl9UrrDX4fwoK7KSO6NbygIBSgC/Zc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Okdt8EF/tldZMXjMZhh+FlCeQitRAU/cRqaGoe2jh9cWKt7f77e+sEXcI8E5GGxXkSUBIlEMTpoN68FQjA7Zyex3e64uh1TcZUavydCSrNMgVSGXAcFhoJ6lFSu45Bkev1jYSjODFPeiRR/Xy3Zl/hQ0qitE9KSOwLSlACGfRAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TClANp8L; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TClANp8L"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38fdeaed181so2753335a91.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Aug 2026 04:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786619498; x=1787224298; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/qk6w1x0YNe1+kTmusGuXa4669G4+AgKgk9XUdFhAb8=;
        b=TClANp8LCuX2jcGdFJ6F3RLM9d2+Q+1YcYo+Vb3SaZRpQM+GhIrnJegrqe3no1+nn0
         3/PKeV4HLW4YLCmKGTgpBIApbHbXdz3eUbMvJ5UtiRi05fq0orpxkX5uq6YDqRrKyLQB
         MlK2kIQn7sqEV1aPf4yxjGCb/dlskmzX6HQuDaCsalqdWSElBi+QxEtwO5zJY3sof4Vp
         F2WMd2xmluZe9WbTAarmCE9j44WrQGiNKlJ9pIgIwWXhv0ZrJZCyYXQRT7GB3PrxIr5k
         7NlYuoB5VPuT7KGpOTeRg5l6AckdQul7ky6PMTN43SPq0zrsV8rS1fmDbWUW6nLoCSTO
         RuUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786619498; x=1787224298;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/qk6w1x0YNe1+kTmusGuXa4669G4+AgKgk9XUdFhAb8=;
        b=oBXBZyvt8lr0PRKDRVJBx3IFcanD+M0aptKGJSeaIpUnTe976u3FZeM/qqb3JMfZnr
         0PjCfxkRWMBZMr5jYNLKDblZcTBuVi8jf6YAjytH4GozHaQ3d3DE/C/9Psw/R0jofQN+
         WGE2XLcMaZ7wfLPtIntv/hbn0ylqQFH6osick5nV6VFXDnjNxO/oVow2N3popWFHFzDM
         quAKKuID7huWj8SRYr6AvhIDxK4cAkVbZmGhuBr1GfQntZOa7UjyQz9oycErHjcowvl6
         y5DDcHmhUGPOEjVXPc4IniD2msGIWjshCzOezTHd6Qyf5HX0RhQhoCuUe1Eeqrmr8cCu
         X/Tw==
X-Forwarded-Encrypted: i=1; AHgh+RouIX9eELQ985gPUIwTp0YudcK4Sq6IODG3e8kZ7Ct8WklrCWmbJKM2WNZSJvWfvuXF9ckqyKTI/muyJHgcpOh01g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQmAgjIi+/BUAhU+Qahb+yk0PkNf6B5k0nDhk1a7UL00Ab0bpv
	LV48iQBq/vfvFbXq2lvUl0xSaBxrJnk6X+K9eyxPVOewR2WW0IolKt6L
X-Gm-Gg: AR+sD13nhmMEVjHuKfBXPwiOpZ8eZMRAyCxnKIal9wNYh087SmzOn9Ps7+uQgMxZ7sC
	/5nhedCpXo23+4VrOwZecA/XoA1rXM1COHpfDJW7vShTaMMncZDgII5jXdxFNCexLxvEdbb/R1A
	Ae/dpYLy9lH3PujzYEmsKSjTMz/odBeLkxmbqBmdxJUva9s2l2opq0T5MYnEEBJ5z2+a+Sdccr1
	Wlxk5ebTu3bCCJRL+vfC9RF4+QTxt25nzhsH+REYc85MzXKHutfH05ViVZsHE7J5Yw4/UzAnsZz
	YrSPRL8KADGfFmSxoUR/EplDffeaU5AWp6cbasTJx0zd5U/3DWQj874WCg+zEfG+R3CvZFlgSUJ
	ni9lkHKJufEbHnbo6sNztv26lD24kF1HbeoVY8ovKJk2OtCdbjO74IR8ZWw9CIV/24TSiqwygRA
	8AT6T+zG7L+MFZ8D22SXnQJniZVvMJTFPA5LFa0+6GH62l9mLEz0mDvgvPjDIOU/jcylf6Mfve1
	Z5kr3HsiXxenJuR66xA+53EUXnvBXDlj6dieNXYlslxjgNO1Vu3Nt/CnHSTnnuuE3cAnVZUQy55
	0rEKFPA=
X-Received: by 2002:a17:90b:48c1:b0:393:1cd6:643a with SMTP id 98e67ed59e1d1-3931e2cf85dmr5828192a91.18.1786619498342;
        Thu, 13 Aug 2026 04:11:38 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:94:ab62:887d:e555:df21:3318])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1412d81b220sm8616483c88.0.2026.08.13.04.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 04:11:38 -0700 (PDT)
From: Manush Prajwal <manushprajwal555@gmail.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Manush Prajwal <manushprajwal555@gmail.com>
Subject: [PATCH] net: ethernet: renesas: rswitch: fix device_node refcount leak in rswitch_get_port_node()
Date: Thu, 13 Aug 2026 16:41:21 +0530
Message-ID: <20260813111121.1672-1-manushprajwal555@gmail.com>
X-Mailer: git-send-email 2.46.2.windows.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On an of_property_read_u32() failure, rswitch_get_port_node() sets
port to NULL and jumps to the out label before releasing the
reference the for_each_available_child_of_node() iterator was holding
on it. Once port is overwritten with NULL, that reference can never be
released since out: only puts "ports", the parent node. Call
of_node_put(port) before clearing it.

Signed-off-by: Manush Prajwal <manushprajwal555@gmail.com>
---
 drivers/net/ethernet/renesas/rswitch_main.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/renesas/rswitch_main.c b/drivers/net/ethernet/renesas/rswitch_main.c
index 6fe9648163..ffdc42f430 100644
--- a/drivers/net/ethernet/renesas/rswitch_main.c
+++ b/drivers/net/ethernet/renesas/rswitch_main.c
@@ -1315,6 +1315,7 @@ static struct device_node *rswitch_get_port_node(struct rswitch_device *rdev)
 	for_each_available_child_of_node(ports, port) {
 		err = of_property_read_u32(port, "reg", &index);
 		if (err < 0) {
+			of_node_put(port);
 			port = NULL;
 			goto out;
 		}
-- 
2.46.2.windows.1

