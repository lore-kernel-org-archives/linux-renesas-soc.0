Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 4B8769B;
	Sun,  3 Dec 2023 03:32:55 -0800 (PST)
X-IronPort-AV: E=Sophos;i="6.04,247,1695654000"; 
   d="scan'208";a="185128688"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 03 Dec 2023 20:32:55 +0900
Received: from localhost.localdomain (unknown [10.226.92.30])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 5618741CD969;
	Sun,  3 Dec 2023 20:32:51 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Support Opensource <support.opensource@diasemi.com>,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 10/11] dt-bindings: mfd: da9062: Update thermal description
Date: Sun,  3 Dec 2023 11:31:58 +0000
Message-Id: <20231203113159.92316-11-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231203113159.92316-1-biju.das.jz@bp.renesas.com>
References: <20231203113159.92316-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update thermal description by referring to dlg,da9062-thermal binding
file.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * Updated description.
v2:
 * New patch
---
 Documentation/devicetree/bindings/mfd/da9062.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/da9062.txt b/Documentation/devicetree/bindings/mfd/da9062.txt
index 3f71e4e57bae..7dd641deea1d 100644
--- a/Documentation/devicetree/bindings/mfd/da9062.txt
+++ b/Documentation/devicetree/bindings/mfd/da9062.txt
@@ -88,7 +88,7 @@ Sub-nodes:
 
 - watchdog: See ../watchdog/da9062-watchdog.yaml
 
-- thermal : See ../thermal/da9062-thermal.txt
+- thermal : See ../thermal/dlg,da9062-thermal.yaml
 
 Example:
 
-- 
2.39.2

