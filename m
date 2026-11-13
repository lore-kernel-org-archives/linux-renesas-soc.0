Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.128.198.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794554016;
	b=dlvnazIYHDxlUYoQA/18/qUgNi92UMG7XdAOxieEkMgQARm5CnIsV0axrFQu8Fwe/wb5
	 86R/WyJ3L3LU1ZHebZI85AL0NoXVub3LHmgeTeSSnJiORWOkMEXHr9vg8HWhdXkLcjvnU
	 bR3ed72+kaoStuPips+OceEkggV9p41YffYpW0pl9/CPlVFZYxA3q2PbUQxNNg8bzoZ4C
	 Y5nS4zuRPORIH4EtT2AeDZXKOTHQm4T7VIzfuLmPdhtGfCQ3EIszp78q2DspBFsMRuull
	 Yw5t65pkfaMc5lUF/MhHvI41ARHh5GhRDLcZJaQp7eHJRK4r/OxnOyJIXvh588dPLfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794554016;
	h=DMARC-Filter:Received:Received:Received:From:To:CC:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy:X-DKIM-Results:X-DNSRBL:X-SPAM-SOURCE-CHECK:X-MAIL;
	bh=Rd674VG7vU4AymhieKIv4CiDG6Cia8Dd41xAqDE8Nyc=;
	b=wALmrsFWE5dUySz67ejUmpIfo4DIL80BhC+u3+R/Pm7GuCbx0fJGCic3gbgINoBlLlbV
	 G6NCJ4PLhKR3JUVX/IeV/fJGTChK+xdVgAKALfkb/oTB57WdWaxQPnbQ4Y/0wzvmgCN2q
	 SrFxEzUx8R22c+a1gUpa+AqeBm6/ttGbvB+3Ylx+rSOyOY6FdvISizmfzZUeSnCbudxHf
	 JAJW2Ykr31goPQL5j1fxkOcjcN+sJIsmZNWffPYz0VfttRplXJ7Szc2OYrIvGD8NZ2wwK
	 jm2eyoWvo9ow7272nbeBaJcBbanjQOGxZXiew717ECSiBlKylfz3vValzUWh+VnzZBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=andestech.com;
	spf=pass smtp.mailfrom=andestech.com;
	arc=none smtp.remote-ip=220.128.198.184
Received: from Atcsqr.andestech.com (atcsqr.andestech.com [220.128.198.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40FC4606A884
	for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Nov 2026 07:13:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40FC4606A884
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from mail.andestech.com (atcpcs53.andestech.com [10.0.1.153])
	by Atcsqr.andestech.com with ESMTPS id 6AD7CU7G059150
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 13 Nov 2026 15:12:30 +0800 (+08)
	(envelope-from minachou@andestech.com)
Received: from ATCPCS34.andestech.com (10.0.1.134) by atcpcs53.andestech.com
 (10.0.1.153) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Fri, 13 Nov
 2026 15:12:30 +0800
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Nov
 2026 15:12:29 +0800
From: Mina Hui-Min Chou <minachou@andestech.com>
To: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <alex@ghiti.fr>, <conor@kernel.org>, <jic23@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <geert+renesas@glider.be>, <magnus.damm@gmail.com>,
        <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <randolph@andestech.com>, <cyyang772@andestech.com>,
        <tim609@andestech.com>, <minachou@andestech.com>, <az70021@gmail.com>
Subject: [PATCH v2 16/19] riscv: errata: andes: allow ERRATA_ANDES_CMO on all Andes SoCs
Date: Fri, 13 Nov 2026 15:11:40 +0800
Message-ID: <20261113071143.1446167-17-minachou@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261113071143.1446167-1-minachou@andestech.com>
References: <20261113071143.1446167-1-minachou@andestech.com>
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs53.andestech.com; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:Atcsqr.andestech.com 6AD7CU7G059150

ERRATA_ANDES_CMO depends on ARCH_R9A07G043, so it can only be enabled
for the Renesas RZ/Five, although other Andes SoCs such as those built
on the A27L2 need it too. Drop the dependency, and select
ANDES_LLCACHE and CACHEMAINT_FOR_DMA so that the errata always comes
with its cache driver, which ARCH_R9A07G043 used to guarantee.

As ERRATA_ANDES_CMO is default y, it is now also enabled in the generic
riscv defconfig. The errata only acts on Andes cores at boot, so other
platforms are not affected.

RZ/Five still gets uncached memory for coherent DMA allocations from the
DMA_GLOBAL_POOL that ARCH_R9A07G043 selects. This patch only covers
cache maintenance for streaming DMA; how other platforms provide uncached
memory stays platform specific.

Signed-off-by: Mina Hui-Min Chou <minachou@andestech.com>
---
 arch/riscv/Kconfig.errata | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig.errata b/arch/riscv/Kconfig.errata
index 4f77b3c6d7fd..3c43e065aa01 100644
--- a/arch/riscv/Kconfig.errata
+++ b/arch/riscv/Kconfig.errata
@@ -12,7 +12,9 @@ config ERRATA_ANDES
 
 config ERRATA_ANDES_CMO
 	bool "Apply Andes cache management errata"
-	depends on ERRATA_ANDES && ARCH_R9A07G043
+	depends on ERRATA_ANDES
+	select ANDES_LLCACHE
+	select CACHEMAINT_FOR_DMA
 	select RISCV_DMA_NONCOHERENT
 	default y
 	help
-- 
2.34.1

