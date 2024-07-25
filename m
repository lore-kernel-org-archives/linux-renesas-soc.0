Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87AF9198A10;
	Thu, 25 Jul 2024 10:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721901970; cv=none; b=bXJ1fkLknI5G6cSyvD9rrwAWHWLrds2lm3+cMS61qtjvLsoqzfLeO0Tmnh+34pCUhsJznjsIJfETwkKF06IZ4RqzT4FZI6+f6qX2V8OanOToJR6UOrl5qD4u4xO43nZ39gTCQIv2HSiiwSGPmRZZVKeqaic1vN8LsEwY+milw0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721901970; c=relaxed/simple;
	bh=qd86xqIZmrivd36S2Izt19pgWShk/cCCEKc96sCI20M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qGaEb9oyqhVWgOEmgl27bGSaznZ6YXIlrlvAshOkZ2P91IgxydxWBF4gkZbA1GRXWoP9C3Md1Dh8AUXASh4iZvAfX82/YfAgP/ITWGf9vySQjpSuM0qzsU8wnwJsyK1VTUtaHY+MLnQDxc4wOMcoFwZrmsaHS21JuC50UJSAc84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-IronPort-AV: E=Sophos;i="6.09,235,1716217200"; 
   d="scan'208";a="216709320"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 25 Jul 2024 19:06:08 +0900
Received: from localhost.localdomain (unknown [10.226.93.56])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 36E4941F581D;
	Thu, 25 Jul 2024 19:06:03 +0900 (JST)
From: Oliver Rhodes <oliver.rhodes.aj@renesas.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Oliver Rhodes <oliver.rhodes.aj@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH V2 4/6] dt-bindings: reset: renesas: Document RZ/G2M v3.0 (r8a774a3) reset module
Date: Thu, 25 Jul 2024 11:05:32 +0100
Message-Id: <20240725100534.5374-5-oliver.rhodes.aj@renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240725100534.5374-1-oliver.rhodes.aj@renesas.com>
References: <20240725100534.5374-1-oliver.rhodes.aj@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document bindings for the Renesas RZ/G2M v3.0 (a.k.a r8a774a3) reset
module.

Signed-off-by: Oliver Rhodes <oliver.rhodes.aj@renesas.com>
---
v2->v2 resend:
* No change.
v1 resend->v2:
* No change.
v1->v1 resend:
* Fixed the commit header.
---
 Documentation/devicetree/bindings/reset/renesas,rst.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/reset/renesas,rst.yaml b/Documentation/devicetree/bindings/reset/renesas,rst.yaml
index 58b4a45d3380..7a81491379b0 100644
--- a/Documentation/devicetree/bindings/reset/renesas,rst.yaml
+++ b/Documentation/devicetree/bindings/reset/renesas,rst.yaml
@@ -29,6 +29,7 @@ properties:
       - renesas,r8a7745-rst       # RZ/G1E
       - renesas,r8a77470-rst      # RZ/G1C
       - renesas,r8a774a1-rst      # RZ/G2M
+      - renesas,r8a774a3-rst      # RZ/G2M v3.0
       - renesas,r8a774b1-rst      # RZ/G2N
       - renesas,r8a774c0-rst      # RZ/G2E
       - renesas,r8a774e1-rst      # RZ/G2H
-- 
2.34.1

