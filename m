Received: from mail-qk2-f42.google.com (mail-qk2-f42.google.com [74.125.230.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3C93161A1
	for <linux-renesas-soc@vger.kernel.org>; Thu, 24 Sep 2026 01:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790211864; cv=none; b=TJrU301adq9ryv/ctBqELpw8hhXgmUiizb0m5UT4Cq50RTDBvpLy+IV7mrZ949Gpjms0mcr/EEatAhPU5P24E/sDbwQ+vDE+J0+HR0l7lA7SFYGZ4tksfOXkQfZsRF38pG4TmdiTR0SKsMuPLqx8EHnn9BcjRasNOSO8oRlv9WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790211864; c=relaxed/simple;
	bh=JfjOTmn23C52eZ50zQilW55eYmOVRRAElDsqXwSu/Ys=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fZMwxHSigXu/2avHl1lLWJReFEcgDLZydMB7oC4yUjbMeJrPd0LPcDGPniQz+242lutlbHKfaMxGTm8+YYMzwT/qrc405qFLzHAKT7u1xeZ1qdGdHz17+itR5o0Ef/sr0bYx+2QLo12/AqC4Xgq9zqD7MQFIsNYosv0vaLCq8Tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XHDH3SwU; arc=none smtp.client-ip=74.125.230.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XHDH3SwU"
Received: by mail-qk2-f42.google.com with SMTP id af79cd13be357-93bd580489dso138820885a.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 18:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790211862; x=1790816662; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=czd/s34OcW98EL8w2Vq/LmrqDyHhrcgOAIgDbU3R4Z0=;
        b=XHDH3SwUGa4Ioe8PNEqE3KfbMp1yTiJ24g5X5MyESGkoVmniIccVKN4BWoyKuRuHMX
         Dat6SqiY3NudxFDfIvzL5efKRcPpjm+HsuKzaCWIPcL4ZagJcf81HpViFtTk84wTLBhw
         +sqPl58fX4bNABjHHmM0+B1j/qNcff4pffJp6Q5t6QMtrkmXi/Wr7KhqmwbDpB8GsbyX
         enRXNTjdfeD2JVyOrWKUIZfzGc4wainScB4/GzAdwZs0y7v1W7Xa132yOIwl+nOQmv2w
         nSEOMjJ3KEM7hSK3/LTgvNM8UbOTiQcBOCIGDeuH8oPgGE44wFyZFhVIK2hLuCbMv8PC
         G1RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790211862; x=1790816662;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=czd/s34OcW98EL8w2Vq/LmrqDyHhrcgOAIgDbU3R4Z0=;
        b=PB78NZ1zSmk27nO03bcsB1TOrgHNG86rwzOIPg3WCB7S+h8mp5qmP3u3/llvx3HPSu
         vwTzCVMucZOkqgjH0ZmJCMduVlTdt5efUMi0yD43yEpDQIErliW8cAEbGwbF1MGzlaP+
         mtQokUokaIuCzSNQRYPUCDtkj992HF4gVKcqeo1PXRgUsMIdOAU8fUrncmwMK/55sOy0
         FFhHJJEU6mWuiP3oCKC3YDjFz49x14fVriUxHAigoWyqkwxp552t53g4tS0KPtO6vZKr
         VsYoKuzJA7wA1OutTN/ilUD2Yp4slegaszs4X+Fufji7EAUivra2tLj6kkqe2OFs7scT
         +IOA==
X-Forwarded-Encrypted: i=1; AKwUvBxdFt83ynNylkXmIi+mG0W9LsiQDmY7PBPbm0D+J8Z13Q2rJs6VTHwjW86OJG9tnQnXs+1/kVeBUfl87cJMIZQY2A==@vger.kernel.org
X-Gm-Message-State: AFuF++lToG0yPpXIQvfD/Xi6WG57jWewQ6VJqPNlYzG84MtxCCDIVNCM
	a2cruXd0HpQcCag3En7cjknODk7AoyU7y/ZyHxxCCbAappk1HOlQy0yw
X-Gm-Gg: AYBFou22ewmcNw2bHK4ygWMedH2Om5V/wuUlsCXPdg/PYVH+ZIi+yuB2rAmPyCNYQVH
	j/13w+nG/I7KVgOJJW2VwoSE8myZ0mKeAiYF6MOH5c75xLAasz4ajrOGJSz4VPVEVybgfjaHMEC
	nXSDth26qKLgh88ERe/Kooyp1w2bHwqOVWH96ttt/GtSoz+9AthlsQtR8LU5ECTmIvuOP0Kgx5N
	rohVvZcvH5MDDgxaAV5S5/iIrbtPv3AXDiX5ZjCyH6so5654aNTY2ByhK+kpMOxyK8agWRlnms5
	yjBLXXAl0tVpvKeTX02vsj/5U/r4cV+c2j4ViFiGMV3+UqOsWOddMVGKEquf+sqLVJn2hJj2H0Q
	tMe/tgLV5f9hbEk6+ancd8Sih31wHRALajgEIaMT/HJPnlsXct67URv6WsFTd2mVaG+rMRx8bs6
	13As9pzYK/qU2nlwBhJRXjtWkwIVsaGvI8oQXj52mmx1U/Wp0Ri94T0+taVIP9og21oOcmf94vx
	NtRFk5tssFbap+TXnd99g==
X-Received: by 2002:a05:620a:4413:b0:939:9f51:29a0 with SMTP id af79cd13be357-93c363d6c97mr68153185a.50.1790211862043;
        Wed, 23 Sep 2026 18:04:22 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c2485883asm349018185a.20.2026.09.23.18.04.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 18:04:21 -0700 (PDT)
From: Yuho Choi <oss.patchbox@gmail.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yuho Choi <oss.patchbox@gmail.com>
Subject: [PATCH v2] PCI: rcar: Release temporary device tree node reference
Date: Wed, 23 Sep 2026 21:04:11 -0400
Message-ID: <20260924010418.726980-1-oss.patchbox@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

of_find_matching_node() returns a referenced node even when it is used
only as a boolean test. Drop the reference right after the match check.

Fixes: a115b1bd3af0 ("PCI: rcar: Add L1 link state fix into data abort hook")
Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>
---
Changes in v2:
- Use an explicit of_node_put() instead of __free(device_node) (Marek Vasut)
- Switch to my oss.patchbox address

v1: https://lore.kernel.org/all/20260801233841.469826-1-dbgh9129@gmail.com/

 drivers/pci/controller/pcie-rcar-host.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/pcie-rcar-host.c b/drivers/pci/controller/pcie-rcar-host.c
index cd9171eebc289..1f5e33c802b5b 100644
--- a/drivers/pci/controller/pcie-rcar-host.c
+++ b/drivers/pci/controller/pcie-rcar-host.c
@@ -1122,7 +1122,11 @@ static const struct of_device_id rcar_pcie_abort_handler_of_match[] __initconst
 
 static int __init rcar_pcie_init(void)
 {
-	if (of_find_matching_node(NULL, rcar_pcie_abort_handler_of_match)) {
+	struct device_node *np;
+
+	np = of_find_matching_node(NULL, rcar_pcie_abort_handler_of_match);
+	if (np) {
+		of_node_put(np);
 #ifdef CONFIG_ARM_LPAE
 		hook_fault_code(17, rcar_pcie_aarch32_abort_handler, SIGBUS, 0,
 				"asynchronous external abort");

base-commit: f0100363d8c374bd8e9ea7c9ba02744f0b802ca4
-- 
2.43.0

