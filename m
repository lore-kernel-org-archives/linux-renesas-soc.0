Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.128.198.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794789599;
	b=FagCb4IYd0JZVr1QJJ2/OeWvm+AQUZDE3ukob+zO3qsFlv7dmJHZYM6BNwwHzCrs2X4s
	 tezTkaxj9gSRwt9QB9KGVuvUrUqUk+vpwQyHZobXes59qG8XSRvP+uC19A/EUYPV7ZGoW
	 QSNueq1pHhdk4QyWeh3rYeQN3ovKhxdqR8mb3pY58thoQcjYcvZrmA32TtgCYdrBOZ8Xu
	 LbpNX+QHk/APwTuoo38lyyymM7Vm7rIVt2EwcU/sZjtYPVER6hva/coRguaLVuCkM1+cS
	 Qc1BHo3vNx0avxRQVl2dh0ZAVIFFRstSG4kBYhMN8keslckx2Ie9e7yB2Nl2mTdHOdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794789599;
	h=DMARC-Filter:Received:Received:Received:From:To:CC:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-Originating-IP:X-ClientProxiedBy:X-DKIM-Results:
	 X-DNSRBL:X-SPAM-SOURCE-CHECK:X-MAIL;
	bh=whNMgs1wCgGpnJ/g10qabo68iz/frxBjrO4c1CzVz2w=;
	b=QIt5FcoZf67UIeqo3lgcMqJN2VRW0Q4NFIRPm/BzImQMUaVAruRkX3NCH8+6eSU/juvx
	 FibTxBnh/CnckpX9NN2Mwulr+LgiHLOjLyCx0HaF7xQ43rMa/LENlTdn5iS3RUTpBQc03
	 3FOwZ2bPqJsaeX7N1VVisqXkV8aR4FkipMmzY6DsSLD5sfM3YEfYnfP7lc2zKywjucvXJ
	 9kgaE/CO31lYXp+HfuMqztJ4swbVqw7UnFCAWaoFZlzH3m1RNt1ggmXkjgsibDsIzMr69
	 Tw6spCD2Ip61WLnkh3pcfZIDuA7mE5WXdA+kAoIg4j/gpGv5i10OscDUojb3pyzJ44Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=andestech.com;
	spf=pass smtp.mailfrom=andestech.com;
	arc=none smtp.remote-ip=220.128.198.184
Received: from Atcsqr.andestech.com (atcsqr.andestech.com [220.128.198.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC90606A323
	for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Nov 2026 00:39:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CAC90606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from mail.andestech.com (atcpcs55.andestech.com [10.0.1.155])
	by Atcsqr.andestech.com with ESMTPS id 6AG0dje8074721
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 16 Nov 2026 08:39:45 +0800 (+08)
	(envelope-from minachou@andestech.com)
Received: from ATCPCS34.andestech.com (10.0.1.134) by atcpcs55.andestech.com
 (10.0.1.155) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Mon, 16 Nov
 2026 08:39:45 +0800
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Nov
 2026 08:39:44 +0800
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
Subject: [PATCH v2 19/19] dt-bindings: riscv: add Andes A27L2 CPU compatible
Date: Mon, 16 Nov 2026 08:39:37 +0800
Message-ID: <20261116003937.1776888-1-minachou@andestech.com>
X-Mailer: git-send-email 2.34.1
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
X-DKIM-Results: atcpcs55.andestech.com; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:Atcsqr.andestech.com 6AG0dje8074721

Add the compatible string for the Andes A27L2 CPU core, which is used
in the Allwinner V821 sun300i SoC. The V821 devicetree will be submitted
separately by Allwinner.

Signed-off-by: Mina Hui-Min Chou <minachou@andestech.com>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index 0da219ae6769..fbe8f0625e76 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -46,6 +46,7 @@ properties:
           - enum:
               - amd,mbv32
               - amd,mbv64
+              - andestech,a27l2
               - andestech,ax45mp
               - canaan,k210
               - nuclei,ux900
-- 
2.34.1

