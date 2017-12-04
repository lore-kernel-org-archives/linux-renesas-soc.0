Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:52438 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753983AbdLDNjH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Dec 2017 08:39:07 -0500
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: "David S. Miller" <davem@davemloft.net>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: [PATCH 2/2] net: sh_eth: don't use NULL as "struct device" for the DMA mapping API
Date: Mon,  4 Dec 2017 14:33:27 +0100
Message-Id: <20171204133327.3505-3-thomas.petazzoni@free-electrons.com>
In-Reply-To: <20171204133327.3505-1-thomas.petazzoni@free-electrons.com>
References: <20171204133327.3505-1-thomas.petazzoni@free-electrons.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Using NULL as argument for the DMA mapping API is bogus, as the DMA
mapping API may use information from the "struct device" to perform
the DMA mapping operation. Therefore, pass the appropriate "struct
device".

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 drivers/net/ethernet/renesas/sh_eth.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/renesas/sh_eth.c b/drivers/net/ethernet/renesas/sh_eth.c
index 91e918e654fe..db72d13cebb9 100644
--- a/drivers/net/ethernet/renesas/sh_eth.c
+++ b/drivers/net/ethernet/renesas/sh_eth.c
@@ -1187,7 +1187,7 @@ static void sh_eth_ring_free(struct net_device *ndev)
 			}
 		}
 		ringsize = sizeof(struct sh_eth_rxdesc) * mdp->num_rx_ring;
-		dma_free_coherent(NULL, ringsize, mdp->rx_ring,
+		dma_free_coherent(&mdp->pdev->dev, ringsize, mdp->rx_ring,
 				  mdp->rx_desc_dma);
 		mdp->rx_ring = NULL;
 	}
@@ -1204,7 +1204,7 @@ static void sh_eth_ring_free(struct net_device *ndev)
 		sh_eth_tx_free(ndev, false);
 
 		ringsize = sizeof(struct sh_eth_txdesc) * mdp->num_tx_ring;
-		dma_free_coherent(NULL, ringsize, mdp->tx_ring,
+		dma_free_coherent(&mdp->pdev->dev, ringsize, mdp->tx_ring,
 				  mdp->tx_desc_dma);
 		mdp->tx_ring = NULL;
 	}
@@ -1324,8 +1324,8 @@ static int sh_eth_ring_init(struct net_device *ndev)
 
 	/* Allocate all Rx descriptors. */
 	rx_ringsize = sizeof(struct sh_eth_rxdesc) * mdp->num_rx_ring;
-	mdp->rx_ring = dma_alloc_coherent(NULL, rx_ringsize, &mdp->rx_desc_dma,
-					  GFP_KERNEL);
+	mdp->rx_ring = dma_alloc_coherent(&mdp->pdev->dev, rx_ringsize,
+					  &mdp->rx_desc_dma, GFP_KERNEL);
 	if (!mdp->rx_ring)
 		goto ring_free;
 
@@ -1333,8 +1333,8 @@ static int sh_eth_ring_init(struct net_device *ndev)
 
 	/* Allocate all Tx descriptors. */
 	tx_ringsize = sizeof(struct sh_eth_txdesc) * mdp->num_tx_ring;
-	mdp->tx_ring = dma_alloc_coherent(NULL, tx_ringsize, &mdp->tx_desc_dma,
-					  GFP_KERNEL);
+	mdp->tx_ring = dma_alloc_coherent(&mdp->pdev->dev, tx_ringsize,
+					  &mdp->tx_desc_dma, GFP_KERNEL);
 	if (!mdp->tx_ring)
 		goto ring_free;
 	return 0;
-- 
2.13.6
