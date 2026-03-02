Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26465356A12
	for <linux-renesas-soc@vger.kernel.org>; Mon,  2 Mar 2026 11:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772449568; cv=none; b=KhrDKvxHjkwQi0yu9qPUdALRA94F2x8zvQHf5DXeopfg1PvZCxy/LksAyzqsDzUNYkDIpXlEInRkwD4rDu6+l+W8IkjzayvtA3+y7CA61OT4Fe0aZpVout68rJYIeWeSuQIkT0yhGchmIbiMba5DC24w8KolewqefQ324XDNNko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772449568; c=relaxed/simple;
	bh=P2wnCu06qmwbsqXvkW5ik8N8LuV9ZT5X3pvrLIw2veI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kNhhs0aB1V7MV5aSBwf8MlIH6rlcu7tsQ/Oz7OkEBlNhTrkKnwXa5v4v/kZe0z4sEhx6OC4TXaYmg3A0gqTXrm88Av9azfjtPL7H9qN60awRNNDCttqCD0ajfRLHJ/clW9P+HHkIsj3WLceGgF1YxOy6yES+ptIBrmwH2wJL/Pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CB90C19423;
	Mon,  2 Mar 2026 11:06:06 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] riscv: rzfive: defconfig: Refresh for v7.0-rc1
Date: Mon,  2 Mar 2026 12:06:04 +0100
Message-ID: <a7fdd607fafd2215c862e0750e7cafedd672e78d.1772449522.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refresh the defconfig for Renesas RZ/Five systems:
  - Drop CONFIG_NFS_V4_1=y (removed in commit 7537db24806fdc3d ("NFS:
    Merge CONFIG_NFS_V4_1 with CONFIG_NFS_V4")).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Not intended for upstream merge.
To be applied to the topic/renesas-defconfig branch.
---
 arch/riscv/configs/rzfive_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/configs/rzfive_defconfig b/arch/riscv/configs/rzfive_defconfig
index 35a672805fb0eb74..a07c75d5f5aea719 100644
--- a/arch/riscv/configs/rzfive_defconfig
+++ b/arch/riscv/configs/rzfive_defconfig
@@ -193,7 +193,6 @@ CONFIG_HUGETLBFS=y
 CONFIG_NFS_FS=y
 CONFIG_NFS_V2=y
 CONFIG_NFS_V4=y
-CONFIG_NFS_V4_1=y
 CONFIG_NFS_V4_2=y
 CONFIG_ROOT_NFS=y
 # CONFIG_NFS_V4_2_READ_PLUS is not set
-- 
2.43.0

