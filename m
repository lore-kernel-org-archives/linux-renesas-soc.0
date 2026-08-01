Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B8D4389114
	for <linux-renesas-soc@vger.kernel.org>; Sat,  1 Aug 2026 23:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785627528; cv=none; b=Z1n/BNYMClN5ESMN1O0/rKwMndlUvLnxB9OCVBY971ILAB5xet+gnCDUvOZFvOEyYHAVr40zMhuquDcgsfiGaK66KfyRJNKluXhkGy7WM9tyGOEl9j7gw2R2dokFS++MQw0PfDjxIjGvPR8RV7jrvG0wxNKiKegV/98Mccia2QU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785627528; c=relaxed/simple;
	bh=Fpll1If+XrFTiEzxvdKsJQ6Sl7877EDLn6Omwn0QV1M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jWPsEr3MFf/XH+xCUMKjp86o0BA8eBwygU+V4TKW2CByrASi6eXI/qVqoiELFMz5BJLYnlWvzTBwPyzWmeYxAY7lRMGlzrgaKM/LenN9szTWcmf6A9Nv8etC9yPudBb4btQztBtK2RPQmIkFaWJYzEcLxGAEErtZAwg9FzaGup8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OovJq9q4; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OovJq9q4"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-9063b380982so21595246d6.0
        for <linux-renesas-soc@vger.kernel.org>; Sat, 01 Aug 2026 16:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785627525; x=1786232325; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VvriIWF36dfjdh7Dlc/O57gznAO1gCidw4KO/Z/TIrs=;
        b=OovJq9q4D/JNYpLmzpaUgn7TJXb3r/ddAbEmcgPrCd/3Wg4ShBG6BT8FVopGKcAa7G
         5qqLyiOwS+9x5kxA3twStzCMwXaRCrIV4t2IdWtblrTT269JOI8ByLfDLLEp7Lw9rzmB
         wdkcSmviB34RarpPEhvM4/1SR+iUsBPxqfF6YnO1icaOQgGwV569PRuyK/IQ/ZtCS4zw
         Co7mB/gVTNRHkDtz0GP+9PzCCm6PhhWAgs1eflb3E78wH9V9CbUmqBlAvb9n5X0eZXf1
         KxlkgYQ60Mx9oCAaM6qM4D5C4xxIbbwL7sv75Z9i2XaClDjRxRbClvvpwcue+80LZWgl
         egZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785627525; x=1786232325;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VvriIWF36dfjdh7Dlc/O57gznAO1gCidw4KO/Z/TIrs=;
        b=i9NZfwr8U+9dv5dvmtZSzQG3jTolvFm/3vmPYMDrlhWRrr67eN6tg8akQq0vAlMBc0
         xoy6VXk08W+XZZxm16ps6dQySFJj3u9FZazBADTu6OzC7rTyiLhkhGprinIsIhNodOUU
         q6Bcg3pT6nBdTAtsWQED43gf1RXVHhk66hxGQq46DA5t4wR0Q2SlYhxUIi2I541LLzi/
         o/+RWVJCobWlfCfKWKcfATdaVtSV64XmsIm0/0kWHp00x7TBdQiut93fpA6UQhhFM5w7
         3Afgz8Hr/x1EJU4GyIEh7ckkBdlzpPkKSDhgeCOjMndHjgKrQpfweO2CCPGXE3jI/Fno
         ZCjg==
X-Forwarded-Encrypted: i=1; AHgh+Rq4KjmqWrSzBiJmVB+HdSvHhtzTs4WdgUVU1m2xZIgelK6bn6ZTNFXgC01EkVzGivKgPzcrO4Ufyurc56Q1exDE2A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNAMuJHjlTXfQnNvcgEWfV0+5p3Wtv2wsFTSIWd0/JOnJA5Su1
	IYRPrRSwIeX4XqZgvMtTJOlHHGTdrfuFuMTMXoWDqhSVAvX+qT8uGMBU
X-Gm-Gg: AR+sD12QTldmT1vqfJ4/pAP0SghdlZcV+hs5HI1eUZTBRVgvIL8qfdv6G4LTO5YOqk8
	54zpWCGzFiJeAAzYCSyWDO9hCJzdOyNwcIm4FUC79O5sMbaQcc1oTh4cL8zXAzdf+LRe2Kk+mrT
	qKj6lXN7mhgCQYty3TvxunvV1pv3uUWrkFekr+68Q1ET/Lg4bavpAHzsSAbnmCWbz33UXsSUx9R
	cRtknbL3xM63vNGPAJyMpcOq2sqYbCMJPvVODgchLfJ7QRZtmwRt3STQAK72Tsuq1MCvIKKeYky
	nP6rlMYWko9rGC7DNL2xoVBKoUTscjzTomRBc/8RW3RnaJNKgoljeakF06O5pX6c3CKHSlBl1Vb
	E1ywIZaBhq5FE2VqnLbF+gIYpfkb8oXO8dkLt3Z2Ue41yGQC2dUIbBwH58G1Qo9LLeElN/4/w3t
	cv42Vbguaw6P9cIMILKSC7mDvPDo8jsx6TSOjDoU9v7in6LCnBrm4KdzAVHCikWukj3isZH244b
	ap26VK6YRbr+zAos9oY9EJxAJ9HHrk27bIL1HqKecKKwcYX+zXesWGT8GE/Hps=
X-Received: by 2002:a05:6214:4306:b0:907:d89f:f9ce with SMTP id 6a1803df08f44-908495e088emr118693976d6.12.1785627525442;
        Sat, 01 Aug 2026 16:38:45 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-908434a26basm42614176d6.12.2026.08.01.16.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 16:38:44 -0700 (PDT)
From: Yuho Choi <dbgh9129@gmail.com>
To: marek.vasut+renesas@mailbox.org,
	yoshihiro.shimoda.uh@renesas.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	bhelgaas@google.com,
	geert+renesas@glider.be,
	magnus.damm@gmail.com
Cc: robh@kernel.org,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yuho Choi <dbgh9129@gmail.com>
Subject: [PATCH v1] PCI: rcar: Release temporary device tree node reference
Date: Sat,  1 Aug 2026 19:38:41 -0400
Message-ID: <20260801233841.469826-1-dbgh9129@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

of_find_matching_node() returns a referenced node even when it is used
only as a boolean test. Keep the result in a scoped cleanup variable
so the reference is released after the match check.

Fixes: a115b1bd3af0 ("PCI: rcar: Add L1 link state fix into data abort hook")
Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
---
 drivers/pci/controller/pcie-rcar-host.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/pcie-rcar-host.c b/drivers/pci/controller/pcie-rcar-host.c
index cd9171eebc28..7ed1bc0732ce 100644
--- a/drivers/pci/controller/pcie-rcar-host.c
+++ b/drivers/pci/controller/pcie-rcar-host.c
@@ -1122,7 +1122,10 @@ static const struct of_device_id rcar_pcie_abort_handler_of_match[] __initconst
 
 static int __init rcar_pcie_init(void)
 {
-	if (of_find_matching_node(NULL, rcar_pcie_abort_handler_of_match)) {
+	struct device_node *np __free(device_node) =
+		of_find_matching_node(NULL, rcar_pcie_abort_handler_of_match);
+
+	if (np) {
 #ifdef CONFIG_ARM_LPAE
 		hook_fault_code(17, rcar_pcie_aarch32_abort_handler, SIGBUS, 0,
 				"asynchronous external abort");
-- 
2.43.0

