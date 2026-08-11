Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 261B937F00F
	for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Aug 2026 18:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786472860; cv=none; b=j3pr57T6SaFSJXEhUOo9p5ccIJ7lnaSApF9n1+6T5l6LI0p2C5mKGwcwy7rHt6eokVSUc4+qr+EUjnDQutBupG2uH9dayOvGZ2grKlZmIkomFV5rWRPHaLFx9UkXny1zl053S0UdaFVTPobcl7WoYcGmPjEkQdf1M7cySQR01RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786472860; c=relaxed/simple;
	bh=PEKHeL9rXvFYW9RpaGeQfOkT2OTMHzNKBGWIMKWDxWo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lhw7eZS6iW0jcFnLZ5RUAtjb8FtvCGCWPa+Aea0upssnnpucQdVqY/X1OG1enfVJ5G+sT9fi1L5msXyDleO/pPFCD4JB2YkcUFiMoL0TUntBeuuYAQcetNNVULx9DOpg+FyCA9Fgt6VNev8xF/FFxOLSiSEyRZChWM7UwFkVINc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KoeHS8zs; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KoeHS8zs"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49558ce01afso724525e9.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Aug 2026 11:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786472856; x=1787077656; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KoBrIu71ZNwcJ7ynDv9vbZU1MnMNwwNUPz9FrjCuwMg=;
        b=KoeHS8zsgxDOEYQztuAmQj6iCnku8cTkQzBYgUu3pB+poso0d4ZjNs/kqwNsurnyoX
         lHl7Ildf3vOLqR/W3vVvOvQhqk3i+PAG9ryhFkjCSKcYqKr9WQdaEaeM8hyhKSSm9HWe
         zQrnVJ6k0nl6XaPCmwSoSKOBPyg3gdx37CPndfnsyzM3UGOFM4cDflFWglfnIKsbkCBj
         vlSCEJpTYs0QLNQnJtX3GQFB4xYa7TRa9CrzUg+DV1ov/9rUoXL1w11qKMn2/A+sRGzd
         vY/+SvCPelf204VvjvaQ9dWYEGxLMDVm63y3H8rfkEXPsPD2Lpuue5IXmKIiC6zYnf8u
         OpDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786472856; x=1787077656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KoBrIu71ZNwcJ7ynDv9vbZU1MnMNwwNUPz9FrjCuwMg=;
        b=bnm/wwtBQJARgXzbpCgQj6LXE4Hw6+mF4jTSRBQfMmXiRZC0DR4D2wke4UvkXCjNuP
         QAjtXt9KkwFUZulx+LLbjmD0VEexZN2cOWluEylRND0oK2Brm/402Ug/N+s+m3bqClwi
         CMf1UmrWwdTDPI9APziUOUM2fMcshxG/UtGoXLZQ9UTPZfvR/XpnzrDr245IvC7EPYyb
         ryjIs7mIFp2bJ7CVRlpqJywdpawyZiagcf6wcclbQhTciHAjt4V1nfX9wBsAYo8elfwV
         OlVHsf/2nE5Y+a+YGbg1xtCL/K/NhfrdPE4PBIakWQzqaPQFswGU//sTqYqHPI2zG3a6
         WVqA==
X-Forwarded-Encrypted: i=1; AHgh+RqYqRabpsd1NxrDajdKTCvVMf8dqAXlSKHXLKBAbEQXlJqECpQiL4R6DqH0iDvKhY5skTA6w0ddBAYUxuktiZ8Lnw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwBiRm69bMqFEQJR2fi4y6HJAlVUrBAVCkE6cyA/uMnUj27ynoC
	K7E33Hp5FU/Yx7OIWZIbpbKktzfwvlqUMKQa1+ZhJcr+uOlKF2UZ8YNh
X-Gm-Gg: AR+sD12rFYtGFoT7JqR//c3YAWinkJBpBvc9rZZYEPBnBKUGIDKyuotToE9CI9AM+t5
	6g10+CpQSGyvC0Tmnn3Ktjz86tV7MXcqZNqvlJEGkqvXkrhWJ1fGD4nLguzcpFhuoKjvmKlfeZC
	nkWUMuVMKwp9/GcpcWMkf0qWQe7S/iqqQwY2kwP9mvzJ5hK0OkuFyz8aKpFpdy5Tbx7Ge0uXBtV
	Craw//yfz5wvVZ1SOUPb1bPwenEraoA7yKrgae+Oj+8MUXC3vcqkuTh0RZgWaA56ad5/xQsvw4W
	4tMcuj8wq+XAhMn/Kf9icIAgJ/RstmHVBXwzbXRZWZ1gSQGmEQfbs7Cjbd0mbbmyDTfUMHzIbLe
	dgMnKr0kthONysk+qLVLs4pKd15v9q9ZgxhhDmgpsAqnzqNjbF6Y7N5vzq8ocnRBMn0tNDbhgDc
	Hng3wR3cG82vvwciK9KEzEIorxejCzXV6E5FQvxU4wMLiBbCw95xBhnHTJ46EW5MQBNKNtD4W4E
	l3/o4g3tv9ZP1mZvg==
X-Received: by 2002:a05:600c:3511:b0:499:53c4:1daa with SMTP id 5b1f17b1804b1-4997a61cd61mr24662225e9.15.1786472856266;
        Tue, 11 Aug 2026 11:27:36 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:935c:3ee:d543:9da1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997aac8c47sm12499385e9.15.2026.08.11.11.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 11:27:36 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Brian Masney <bmasney@redhat.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 4/9] clk: renesas: rzg2l: Add support for divider flags
Date: Tue, 11 Aug 2026 19:27:17 +0100
Message-ID: <20260811182729.360959-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260811182729.360959-1-biju.das.jz@bp.renesas.com>
References: <20260811182729.360959-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add support for passing divider flags apart from clock flags from soc
specific clock drivers.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Collected tag.
 * Fixed a check patch warning by using (_div_flags) in DEF_DIV_FLAGS
   macro.
---
 drivers/clk/renesas/rzg2l-cpg.c |  8 ++++----
 drivers/clk/renesas/rzg2l-cpg.h | 12 ++++++++++--
 2 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index 07b78cbc4531..2d80775c60c2 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -487,20 +487,20 @@ rzg2l_cpg_div_clk_register(const struct cpg_core_clk *core,
 
 	if (core->dtable)
 		clk_hw = clk_hw_register_divider_table(dev, core->name,
-						       parent_name, 0,
+						       parent_name, core->core_flags,
 						       base + GET_REG_OFFSET(core->conf),
 						       GET_SHIFT(core->conf),
 						       GET_WIDTH(core->conf),
-						       core->core_flags,
+						       core->div_flags,
 						       core->dtable,
 						       &priv->rmw_lock);
 	else
 		clk_hw = clk_hw_register_divider(dev, core->name,
-						 parent_name, 0,
+						 parent_name, core->core_flags,
 						 base + GET_REG_OFFSET(core->conf),
 						 GET_SHIFT(core->conf),
 						 GET_WIDTH(core->conf),
-						 core->core_flags, &priv->rmw_lock);
+						 core->div_flags, &priv->rmw_lock);
 
 	if (IS_ERR(clk_hw))
 		return ERR_CAST(clk_hw);
diff --git a/drivers/clk/renesas/rzg2l-cpg.h b/drivers/clk/renesas/rzg2l-cpg.h
index 38db209aabf9..ebf6b744dac4 100644
--- a/drivers/clk/renesas/rzg2l-cpg.h
+++ b/drivers/clk/renesas/rzg2l-cpg.h
@@ -112,6 +112,7 @@ struct cpg_core_clk {
 	notifier_fn_t notifier;
 	u32 core_flags;
 	u32 mux_flags;
+	u32 div_flags;
 	int num_parents;
 };
 
@@ -168,11 +169,18 @@ enum clk_types {
 #define DEF_DIV(_name, _id, _parent, _conf, _dtable) \
 	DEF_TYPE(_name, _id, CLK_TYPE_DIV, .conf = _conf, \
 		 .parent = _parent, .dtable = _dtable, \
-		 .core_flags = CLK_DIVIDER_HIWORD_MASK)
+		 .core_flags = 0, \
+		 .div_flags = CLK_DIVIDER_HIWORD_MASK)
 #define DEF_DIV_RO(_name, _id, _parent, _conf, _dtable) \
 	DEF_TYPE(_name, _id, CLK_TYPE_DIV, .conf = _conf, \
 		 .parent = _parent, .dtable = _dtable, \
-		 .core_flags = CLK_DIVIDER_READ_ONLY)
+		 .core_flags = 0, \
+		 .div_flags = CLK_DIVIDER_READ_ONLY)
+#define DEF_DIV_FLAGS(_name, _id, _parent, _conf, _dtable, _flags, _div_flags) \
+	DEF_TYPE(_name, _id, CLK_TYPE_DIV, .conf = _conf, \
+		 .parent = _parent, .dtable = _dtable, \
+		 .core_flags = _flags, \
+		 .div_flags = CLK_DIVIDER_HIWORD_MASK | (_div_flags))
 #define DEF_G3S_DIV(_name, _id, _parent, _conf, _sconf, _dtable, _invalid_rate, \
 		    _max_rate, _clk_flags, _notif) \
 	DEF_TYPE(_name, _id, CLK_TYPE_G3S_DIV, .conf = _conf, .sconf = _sconf, \
-- 
2.43.0

