Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id BAC0391;
	Tue, 21 Nov 2023 17:26:04 -0800 (PST)
X-IronPort-AV: E=Sophos;i="6.04,217,1695654000"; 
   d="scan'208";a="183795569"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 22 Nov 2023 10:26:04 +0900
Received: from localhost.localdomain (unknown [10.166.13.99])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id E779A401006C;
	Wed, 22 Nov 2023 10:26:03 +0900 (JST)
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: s.shtylyov@omp.ru,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH net v2 0/3] net: rswitch: Fix issues in rswitch_start_xmit()
Date: Wed, 22 Nov 2023 10:25:53 +0900
Message-Id: <20231122012556.3645840-1-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series is based on the latest net.git / main branch.

Changes from v1:
https://lore.kernel.org/all/20231121055255.3627949-1-yoshihiro.shimoda.uh@renesas.com/
- Separate a patch because fixing 2 issues.
- Add fixing wrong type of return value.
- Use goto for improving code readability.

Yoshihiro Shimoda (3):
  net: rswitch: Fix type of ret in rswitch_start_xmit()
  net: rswitch: Fix return value in rswitch_start_xmit()
  net: rswitch: Fix missing dev_kfree_skb_any() in error path

 drivers/net/ethernet/renesas/rswitch.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

-- 
2.25.1

