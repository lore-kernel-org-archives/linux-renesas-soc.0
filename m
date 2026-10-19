Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A28AE4BD0F2
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Oct 2026 12:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792411353; cv=none; b=JqgzkSjDi5KhocxN6GYu0Vax8OiVyOb8YytEQhxAmCqubqN7JuChK7dEr1ot9L2fX6ze8VrxfkjjdUVzZaxw7y4r0qF7FqHx9DeSpOdekeZgsBDA10Ts8F0MoEQNmlv6oVpkirIfFt3InZfVR0g5GN+S6EauB9y9JjAY9x628F4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792411353; c=relaxed/simple;
	bh=jJW7RQip9aLZnuTavNG7BTkWhgnupXed1qgikA55KDw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z8kGLomGqlajR1f+gUOg4Qb7Wgbz3x3y/u8nALJuK7KsvyICWFpJ8bE+L/cR678hvSMxDi8WNhM3xNXZMzyrpPM7bjKPIhb1ZDWBLrgGBpybdRsacDxtfqz4rOZyapjtieCZTQ2QN5oLxnk3JGWRZUHbSTlB6BcV6wiCp2qG8XU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xsz9hk2g; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xsz9hk2g"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a1e34ecb02so8027035e9.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Oct 2026 05:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792411351; x=1793016151; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pao6ud2K4dDg314zRiJyzOc7KVdNceVjwCxdWrFBC3o=;
        b=Xsz9hk2goW5JJdI9NPJD41m6IDQjOE6aB40ttgitWi/438z0FZQEbdr1wXqn53oxnA
         Vyw4lVw1aJ8F64ImwVV0r2j09IaRMXC43ieaDzqL99YnAhcM+V5wLVJoFNdNmGhe/lAD
         XwL2mA33lE6FuhCjBuZfDa/1sF4Ls4WoeaUn4fNDqbRPzeZ91QK8eeO9Lqd+Lr1ClGke
         y1JxQqxtV3+RV4EkNJgppypff2bUp+QsJ1H3WGLBZEABh511D20LYQdSaBjgB4whBdUl
         DDHprNW5Kz2Pxp1sVpjy87xyXlmpY98U/7C9yY3N+aj3Kw/D/I5FQqikhex7HOUf1siO
         N2fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792411351; x=1793016151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pao6ud2K4dDg314zRiJyzOc7KVdNceVjwCxdWrFBC3o=;
        b=w7S4uqLTUNz7/U0NHyO27FRADIM0VkDr1biblZUZwWe2mkuaRZOQfOU3N/0L2QcZ/b
         W2flY1eTtPN5BuK4C5DY1/q5CQ1HMs6k1Oym9D9rj0QVWig3SqwRqRGKVgGg5XHG/je+
         QzwR82qzFH1iBU6ovDSBJmmMvZmULwyMIRmL9wGbNplAZqpsgWslXjqO9jK6cla9CPvf
         yOnpr3yu5KrQVfGyVzqdTOTFvKa6j7dnru2DIU8jHielG3cbLNoj1IIzgH+Tep9ckWYC
         WRAKDxJZ8ZGJVa2QLX/349O9Mfo66yNzpyk1XP+yBg/26vYcojRkUlR8m7l3uQSidVl8
         OlTw==
X-Forwarded-Encrypted: i=1; AKwUvBymWLTUSBNGVqMcHtfxekqxgQCAyghxeh9WvcMuYiaHhFa6qHNC7gXxKBEnxc9erwCiOogjIeTvjH/rs1LvFdhvWw==@vger.kernel.org
X-Gm-Message-State: AFq9FYLzzk5Ag5sdac9JocwUlkSKy8GcOnOLYfTQBD1gWlWNJvoYPJuk
	JSO6hjQcE+NcKRh0YH3+UPPE41IVoDaSs6YXNEf0Ub98bTWVNtv/5LFG
X-Gm-Gg: AYBFou3hMo6L+8IsbURHOOhMr3iVryXQ6bd6shn0v38YYWwRv41nPrdmO/Zpa0m3jAp
	5RXDRVnLW5t1LDqDOIeorEj8oCdwKkjfQsNMmv+5nx6r2zJE84KJ9zK/yoDWpbwCFUo4UnfhgPu
	4E3s3SDQExkuyfvlq30AgiOOiVkS0CPCQBb33ZQBkLJKRu9/vj47ttmq1lfeP6X7WSTr3NFcR+F
	ktBHFXc8Tx+p+fsezPSbX5wpXvYhNnqnmI4kp/WbPOQu0RRQK77dgu+vysMkr0MwPA5tDCeH3eL
	sBh8g0TpEjLmZkcEFanv1tHA4ID044pzjN+G+dvRduMJhd1uHx97yiRdoA20+KxfpSWo+Rje0xM
	W44HiTS3HVtu3rzd01igrS1zhynHv0u8kKcyzix7U1ufRPyYhs8BIHX/JS7jpZ4TfaRUVEdwOTM
	nVaRx6x/NGw8W7Y8Isctnhs44BTUZnSQoZ3DN4Wy+5OpIFBGT8VyNNagkbhj3PknA82xHMtb99+
	VbmDpHAbTT2bH4/S87rP1FxTpi3vsZwqXE6Cp+tGCLAvlMrusplaF8=
X-Received: by 2002:a05:600c:1da1:b0:49f:ce78:3562 with SMTP id 5b1f17b1804b1-4a1d76011ffmr164064965e9.19.1792411350653;
        Mon, 19 Oct 2026 05:02:30 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:1439:c865:be43:6676])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfdc4eecasm22400720f8f.13.2026.10.19.05.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 05:02:29 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Tu Nguyen <tu.nguyen.xg@renesas.com>,
	linux-can@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Chris Paterson <Chris.Paterson2@renesas.com>,
	Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH v5 2/4] can: rcar_canfd: Document that RZ/G3S has no Classical CAN mode
Date: Mon, 19 Oct 2026 13:02:14 +0100
Message-ID: <20261019120220.166163-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261019120220.166163-1-biju.das.jz@bp.renesas.com>
References: <20261019120220.166163-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

The header comments in the driver describe Classical CAN (CAN 2.0)
only mode as a mode the controller can operate in, without saying that
this does not apply to every supported SoC. RZ/G3S does not support
Classical CAN mode.

Update the comments to note the RZ/G3S exception, so that readers of
the driver are not misled about which SoCs can use that mode. This
matches the corresponding dt-bindings update.

No functional change.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v5:
 * New patch.
---
 drivers/net/can/rcar/rcar_canfd.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/can/rcar/rcar_canfd.c b/drivers/net/can/rcar/rcar_canfd.c
index 74c3c3f20991..86fa88ccf63b 100644
--- a/drivers/net/can/rcar/rcar_canfd.c
+++ b/drivers/net/can/rcar/rcar_canfd.c
@@ -6,7 +6,7 @@
 
 /* The R-Car CAN FD controller can operate in either one of the below two modes
  *  - CAN FD only mode
- *  - Classical CAN (CAN 2.0) only mode
+ *  - Classical CAN (CAN 2.0) only mode (Except RZ/G3S)
  *
  * This driver puts the controller in CAN FD only mode by default. In this
  * mode, the controller acts as a CAN FD node that can also interoperate with
@@ -247,10 +247,10 @@
 #define RCANFD_CFFDCSTS_CFBRS		BIT(1)
 #define RCANFD_CFFDCSTS_CFESI		BIT(0)
 
-/* This controller supports either Classical CAN only mode or CAN FD only mode.
- * These modes are supported in two separate set of register maps & names.
- * However, some of the register offsets are common for both modes. Those
- * offsets are listed below as Common registers.
+/* This controller supports either Classical CAN only mode(Except RZ/G3S) or
+ * CAN FD only mode. These modes are supported in two separate set of register
+ * maps & names. However, some of the register offsets are common for both
+ * modes. Those offsets are listed below as Common registers.
  *
  * The CAN FD only mode specific registers & Classical CAN only mode specific
  * registers are listed separately. Their register names starts with
-- 
2.43.0

