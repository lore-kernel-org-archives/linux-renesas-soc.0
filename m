Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2288047986F
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jul 2026 11:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785325836; cv=none; b=n0l4PmV1rUv60p2zxpGhV+PUWTl3VBVazaWJ8KBR22FhjIgGRSgbxFGHvGDz5OQ3TUmMeQMPbnxOwakE7aUJXqiQptIJL8ImF7bZn+ix4fQ4Ef7ia0imyixOViLZptfvc2jPlrOPz5DHw/VFxwbsl6TCRqux4UbHRMVu7QUUMJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785325836; c=relaxed/simple;
	bh=AcGH0RYsNPDVAqM6RWgghDHXzQ7HD7meQ7rP047k4n4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=djxBcc+meHLfH6PZnK0oOQifjq4RI1udSRaYFMWXCPLrk6pMrCngwCLSsSbKWWxbzw0h15xxu6iEtZycyUPOP9AxAvZq78GlJaWj2II9RjkKPRJVVjQb4eRkZZdoT8q6sjVNia1RPLU+u80b3HV/d6OoP4z/5oM9V+ljZ5M6Bxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rDxzMtXk; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rDxzMtXk"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-493f6de72faso6351015e9.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jul 2026 04:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785325830; x=1785930630; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WfEHlBrWeUh7mZraN40bmgV0Ndqv0u6Nx2aVfHZ7JaE=;
        b=rDxzMtXkENvAoTGqu4XkCKt8qDc0Qcih4Ffv+DeOk29Z3O8wjfGDev+BwAu/JP9BHm
         dCr3FNuDe2CR58jmnaGS/W1fNc0B90n8Zt/4wYn6d6VPU57vSaH7rTv3x/JaoxIQRsko
         YA5dgUy1WoRh7Pi9XNgfyvPk1X1yZJ2U3jYcaxiImG1tfNmx8nsNgBzsLMVq0LipHet1
         visd0gglSQXSBSu7KVPRtYVzK1Gga+idvsICfZjGqRg+ySGM2WkOsoavyNiQ6mgkFPWL
         sI3Q8d0c7Za4GldTwzKvqcXfJPPXGsCRdgG/eEtbMUHhPMlKFDPsAnDTlUtZS/enGEq6
         tQ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785325830; x=1785930630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WfEHlBrWeUh7mZraN40bmgV0Ndqv0u6Nx2aVfHZ7JaE=;
        b=gpithj9Q1lduXbBJvwHArzMcr4mREA2uIcNc466U/P5HJxbSpUcekeoz6bTz2HNWqj
         nn2pAsIcIxVAuofdEdgzReQ5Kq96XNBa2nNiVv1Hd6p0UCOYrgoB9LaxyybHddZQf1YY
         ew9YCcOZMBWfyyL/8hhWisv0shOKf+3ivLo08hdMnGz4oWBx+glL6Oj5UGW/3kvRbNSb
         w35PxjN7k1uuhh97qOq950rIIduvfgceg6ofJdE0J+f4kRZV2ASPIKzfXtNe0qILB71k
         vJ/qqhMOlwriofjF6xvEyFMJ5Jto42UQ1hBs+gF8PrFG2ijj8hiZY8LtBX77380emb5Z
         rSnQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr0kgrwiOfvdkn/+wsLNBK9tcHFwYrh1+QueNCwswspkj+vmPfFPF5GgrdKfjaxk6wuiKiHVeaQqaYLgODB1r8pAw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxMmxd2WMtv8lcyJt9YvpI8MBfGEpvv/SSMfdsriTiZjYIRCtgx
	XaXH0wjwYKvC0Ck31ouNsxwatj3ylftRDlMBfLSW3M++dJYvtT86soQ3
X-Gm-Gg: AR+sD11gzqevuW7n7SOto+B9Q1ppVuDmegcXIaChgRuvcdd3tNxvGGydHsJM7NPxQGS
	OX+KrafS6FnJMgBsdaBeyyFmTjabBS/dE9/n+CLDD7R2XSpo1MvH+8YeqgsJry8eeb0WU2pLmeN
	1hyNsduJ8CKfS1Nderz8Kfrh1uY8c1zh9hZVv/UvvJ5p7t9L6tQExhklhxiX+yuEmYahaJBlPPB
	2+wqqQIOL+Uux+dFR52ue8UipgH73rzgnrx1bGHpsyYk+mbRS9mdqUGkmxXUeJScw+jJS3LcXHE
	sxk1VtE0yXlK9tV1AwPT4PzLs7BVw2W+iMJ8C4LXNXlKBU/vNQy5jfqUu1krnUny8vKqkU1pEtn
	6FpTGqycNbqzVCJbhIYbRMAnBfxJgUlBNwHdjq2tzRJw8+ppQZpHoXGUtROOdMg+/1lwJ7hZJ8a
	ms9GkTkhcFpXTaJlo8qpq08S8nYq1ke2cTFDrmykoisYR2hj/F1Ob1i/L1var/BW9wXyTy0KR20
	mY7+b8I+TaWWg==
X-Received: by 2002:a05:600c:3105:b0:495:6934:4146 with SMTP id 5b1f17b1804b1-497fd307c6fmr22481205e9.11.1785325830358;
        Wed, 29 Jul 2026 04:50:30 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:10b8:4461:ee04:15e2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957bfc2ff2sm326144165e9.4.2026.07.29.04.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 04:50:30 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Vinod Koul <vkoul@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-renesas-soc@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v5 6/9] phy: renesas: phy-rcar-gen3-usb2: Add RZ/G3L support
Date: Wed, 29 Jul 2026 12:50:14 +0100
Message-ID: <20260729115022.222340-7-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260729115022.222340-1-biju.das.jz@bp.renesas.com>
References: <20260729115022.222340-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add renesas,usb2-phy-r9a08g046 to the OF match table, reusing
rz_g3s_phy_usb2_data as the PHY configuration is shared with RZ/G3S.

While the PHY data is shared, RZ/G3L differs from RZ/G3S in that it has
two OTG controllers, OTG interrupts on port 2, and a controllable
OTG_PERI bit in COMMCTRL for host/device switching on the port 2 USB
controller, which is fixed to host-only on RZ/G3S.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4->v5:
 * No change.
v3->v4:
 * No change.
v2->v3:
 * No change.
v1->v2:
 * Updated commit description.
---
 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index 9a45d840efeb..d06fb52ed5f1 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -721,6 +721,10 @@ static const struct of_device_id rcar_gen3_phy_usb2_match_table[] = {
 		.compatible = "renesas,usb2-phy-r9a08g045",
 		.data = &rz_g3s_phy_usb2_data,
 	},
+	{
+		.compatible = "renesas,usb2-phy-r9a08g046",
+		.data = &rz_g3s_phy_usb2_data,
+	},
 	{
 		.compatible = "renesas,usb2-phy-r9a09g057",
 		.data = &rz_v2h_phy_usb2_data,
-- 
2.43.0

