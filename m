Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9051FED;
	Sun,  3 Dec 2023 17:21:02 -0800 (PST)
X-IronPort-AV: E=Sophos;i="6.04,248,1695654000"; 
   d="scan'208";a="189033685"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 04 Dec 2023 10:21:01 +0900
Received: from localhost.localdomain (unknown [10.166.13.99])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 4EF2E411DD38;
	Mon,  4 Dec 2023 10:21:01 +0900 (JST)
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: s.shtylyov@omp.ru,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH net-next v3 0/9] net: rswitch: Add jumbo frames support
Date: Mon,  4 Dec 2023 10:20:49 +0900
Message-Id: <20231204012058.3876078-1-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series is based on the latest net-next.git / main branch.

Changes from v2:
https://lore.kernel.org/all/20231201054655.3731772-1-yoshihiro.shimoda.uh@renesas.com/
 - Based on the latest net-next.git / main branch.
 - Fix using a variable in the patch 8/9.
 - Add Reviewed-by tag in the patch 1/9.

Changes from v1:
https://lore.kernel.org/all/20231127115334.3670790-1-yoshihiro.shimoda.uh@renesas.com/
 - Based on the latest net-next.git / main branch.
 - Fix commit descriptions (s/near the future/the near future/).

Yoshihiro Shimoda (9):
  net: rswitch: Drop unused argument/return value
  net: rswitch: Use unsigned int for desc related array index
  net: rswitch: Use build_skb() for RX
  net: rswitch: Add unmap_addrs instead of dma address in each desc
  net: rswitch: Add a setting ext descriptor function
  net: rswitch: Set GWMDNC register
  net: rswitch: Add jumbo frames handling for RX
  net: rswitch: Add jumbo frames handling for TX
  net: rswitch: Allow jumbo frames

 drivers/net/ethernet/renesas/Makefile  |   1 -
 drivers/net/ethernet/renesas/rswitch.c | 376 +++++++++++++++++--------
 drivers/net/ethernet/renesas/rswitch.h |  43 ++-
 3 files changed, 294 insertions(+), 126 deletions(-)

-- 
2.34.1

